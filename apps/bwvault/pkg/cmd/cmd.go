package cmd

import (
	"flag"
	"fmt"
	"os"

	"github.com/notapipeline/bwvault/pkg/bitw"
)

type Command interface {
	SetArgs(args interface{})
	Execute() int
}

type command struct {
	flags   *flag.FlagSet
	cflags  *flag.FlagSet
	command Command
}

type httpargs struct {
	Cert        string
	Key         string
	Letsencrypt bool
}

type getargs struct {
	Filter            string
	ReturnKubeYaml    bool
	KubeNamespace     string
	UsernameFieldName string
	PasswordFieldName string
	IncludeFields     string
}

var acceptedCommands []string = []string{
	"get",
	"dbus",  // serve dbus only
	"http",  // serve http only
	"serve", // serve both dbus and http
}

func contains(what string, where []string) int {
	for i, c := range where {
		if c == what {
			return i
		}
	}
	return -1
}

func usage() {
	fmt.Printf("%s [options] <command> [command options]\n\n", os.Args[0])
	fmt.Println("    get   [options]      Get credentials matching path or filter")
	fmt.Println("    http  [options]      Start a https web server")
	fmt.Println("    serve [http options] Serve credentials on both https and dbus")
	fmt.Println("    dbus                 Serve credentials on dbus only")
}

func (c *command) New() {
	c.flags = flag.NewFlagSet("bwvault", flag.ContinueOnError)
	c.flags.StringVar(&bitw.ApiServer, "api", bitw.ApiServer, "The upstream api server address")
	c.flags.StringVar(&bitw.IdtServer, "identity", bitw.IdtServer, "The upstream identity server address")
	c.flags.StringVar(&bitw.EmailAddr, "email", bitw.EmailAddr, "The account email address")
	c.flags.Parse(os.Args)

	args := c.flags.Args()
	command := args[0]

	switch command {
	case "dbus":
	case "serve":
		fallthrough
	case "http":
		hargs := c.getHttpArgs(args[1:])
		c.command.SetArgs(hargs)
	case "get":
		gargs := c.getCredentialArgs(args[1:])
		c.command.SetArgs(gargs)
	default:
		usage()
	}
}

func (c *command) Exec() int {
	return c.command.Execute()
}

func (c *command) getCredentialArgs(args []string) (gargs *getargs) {
	gargs = &getargs{}
	c.cflags = flag.NewFlagSet("get", flag.ExitOnError)
	c.cflags.StringVar(&gargs.Filter, "filter", "name", "A comma separated list of fields to match against. Default name")
	c.cflags.BoolVar(&gargs.ReturnKubeYaml, "kube-yaml", false, "Return as kubernetes yaml instead of json")
	c.cflags.StringVar(&gargs.KubeNamespace, "kube-namespace", "default", "The namespace to assign the yaml to. Only applicable if kube-yaml is true")
	c.cflags.StringVar(&gargs.UsernameFieldName, "user-field", "username", "Alternative name for username field")
	c.cflags.StringVar(&gargs.PasswordFieldName, "password-field", "password", "Alternative name for password field")
	c.cflags.Parse(args)
	return
}

func (c *command) getHttpArgs(args []string) (hargs *httpargs) {
	hargs = &httpargs{}
	c.cflags.StringVar(&hargs.Cert, "cert", "", "Path to the certificate to use")
	c.cflags.StringVar(&hargs.Key, "key", "", "Path to the certificate key")
	c.cflags.BoolVar(&hargs.Letsencrypt, "letsencrypt", false, "If true will use letsencrypt for certificates")
	return
}
