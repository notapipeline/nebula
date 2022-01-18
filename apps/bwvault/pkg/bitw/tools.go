package bitw

import (
	"os"

	"github.com/peterh/liner"
)

func ReadPassword(prompt string) (string, error) {
	line := liner.NewLiner()
	line.SetCtrlCAborts(true)
	defer line.Close()
	var (
		password string
		err      error
	)
	if password, err = line.PasswordPrompt(prompt); err != nil {
		if err == liner.ErrPromptAborted {
			line.Close()
			os.Exit(0)
		}
		return "", err
	}
	return password, nil
}

func ReadLine(prompt string) (string, error) {
	line := liner.NewLiner()
	line.SetCtrlCAborts(true)
	defer line.Close()
	var (
		password string
		err      error
	)
	if password, err = line.Prompt(prompt); err != nil {
		if err == liner.ErrPromptAborted {
			line.Close()
			os.Exit(0)
		}
		return "", err
	}
	return password, nil
}
