package main

import (
	"context"
	"fmt"
	"log"
	"os"
	"sync"
	"time"

	"github.com/hokaccha/go-prettyjson"
	"github.com/notapipeline/bwvault/pkg/bitw"
	"r00t2.io/gokwallet"
)

var (
	loginResponse *bitw.LoginResponse
)

func getSecretFromKWallet(what string) (string, error) {
	var (
		err error
		r   *gokwallet.RecurseOpts = gokwallet.DefaultRecurseOpts
		wm  *gokwallet.WalletManager
	)

	r.AllWalletItems = true
	if wm, err = gokwallet.NewWalletManager(r, "BWVault"); err != nil {
		return "", err
	}

	for _, v := range wm.Wallets {
		if f, ok := v.Folders["Passwords"]; ok {
			if m, ok := f.Maps["bwdata"]; ok {
				for k, p := range m.Value {
					if k == what {
						return p, nil
					}
				}
			}
		}
	}
	return "", nil
}

func getSecret(what string) string {
	var (
		value string
		err   error
	)
	if value, err = getSecretFromKWallet(what); err == nil {
		return value
	}
	return ""
}

func getSecretsFromEnvOrStore() map[string]string {
	secrets := map[string]string{
		"BW_CLIENTID":     "",
		"BW_CLIENTSECRET": "",
		"BW_PASSWORD":     "",
		"BW_EMAIL":        "",
	}

	for k := range secrets {
		var value string = os.Getenv(k)
		if value == "" {
			value = getSecret(k)
		}
		secrets[k] = value
	}
	return secrets
}

func getFromUser() map[string]string {
	secrets := make(map[string]string)
	secrets["BW_EMAIL"], _ = bitw.ReadLine("Email: ")
	secrets["BW_PASSWORD"], _ = bitw.ReadPassword("Password: ")
	return secrets
}

func init() {
	secrets := getSecretsFromEnvOrStore()

	var (
		loginResponse *bitw.LoginResponse
		useApiKeys    bool = secrets["BW_CLIENTID"] != "" && secrets["BW_CLIENTSECRET"] != ""
	)

	for {
		if secrets["BW_PASSWORD"] == "" || secrets["BW_EMAIL"] == "" {
			s := getFromUser()
			for k, v := range s {
				secrets[k] = v
			}
		}

		var (
			wg      sync.WaitGroup
			success bool        = false
			pwchan  chan string = make(chan string, 1)
		)
		wg.Add(1)
		go func() {
			defer wg.Done()
			p, err := bitw.Prelogin(secrets["BW_EMAIL"])
			if err != nil {
				log.Fatal(err)
			}
			hashed := bitw.SetMasterPassword(secrets["BW_PASSWORD"], secrets["BW_EMAIL"], p)
			// for user logins we require the hashed password. For api logins, we don't.
			// this means for user logins we're forced to wait for the pre-login phase
			// to complete and the master password to be configured.
			if !useApiKeys {
				pwchan <- hashed
			}
			fmt.Fprintf(os.Stderr, "Master password configured\n")
		}()

		wg.Add(1)
		go func() {
			var err error
			defer wg.Done()
			if useApiKeys {
				if loginResponse, err = bitw.ApiLogin(secrets["BW_CLIENTID"], secrets["BW_CLIENTSECRET"]); err != nil {
					fmt.Printf("Error : Failed to retrieve auth token : %s\n", err)
					return
				}
			} else {
				hashedpw := <-pwchan
				if loginResponse, err = bitw.UserLogin(hashedpw, secrets["BW_EMAIL"]); err != nil {
					fmt.Printf("Error : Failed to retrieve auth token : %s\n", err)
					return
				}
			}
			success = true
			fmt.Fprintf(os.Stderr, "Login complete\n")
		}()
		wg.Wait()

		if success {
			break
		}
	}

	ctx := context.Background()
	ctx = context.WithValue(ctx, bitw.AuthToken{}, loginResponse.AccessToken)
	if err := bitw.Sync(ctx); err != nil {
		log.Fatal(err)
	}
	fmt.Fprintf(os.Stderr, "Sync complete\n")
}

func main() {
	start := time.Now()
	if len(os.Args) != 2 {
		fmt.Println("Usage bwvault <path>")
		return
	}

	var (
		path string
		c    []bitw.DecryptedCipher
		ok   bool
	)
	path = os.Args[1]
	if c, ok = bitw.Get(path); !ok {
		fmt.Printf("No such path %s\n", path)
	}
	s, e := prettyjson.Marshal(c)
	if e != nil {
		log.Fatal(e)
	}
	fmt.Println(string(s))
	elapsed := time.Since(start)
	fmt.Fprintf(os.Stderr, "Completed in %s\n", elapsed)
}
