package main

import (
	"encoding/json"
	"fmt"
	"os"
	"path/filepath"
	"regexp"
	"strings"

	gapi "github.com/grafana/grafana-api-golang-client"
)

func main() {
	config := gapi.Config{
		APIKey: os.Getenv("GAPI_KEY"),
	}
	client, _ := gapi.New(os.Getenv("GAPI_URL"), config)
	dashboards, _ := client.Dashboards()
	for _, b := range dashboards {
		board, _ := client.DashboardByUID(b.UID)
		create(*board)
	}
}

func create(board gapi.Dashboard) {
	contents := board.Model
	dirname := "dashboards"
	title := strings.ReplaceAll(strings.ToLower(board.Model["title"].(string)), " ", "-")
	filename := filepath.Join(dirname, title)

	for _, item := range contents["panels"].([]interface{}) {
		copyItem := item.(map[string]interface{})
		title := copyItem["title"].(string)

		var targets []interface{}
		var ok bool = false
		queries := make([]string, 0)

		if targets, ok = copyItem["targets"].([]interface{}); ok {
			for i, target := range targets {
				query := target.(map[string]interface{})["query"].(string)
				queries = append(queries, query)

				reg, _ := regexp.Compile("[^a-zA-Z0-9 ]+")
				title = reg.ReplaceAllString(title, "")

				id := fmt.Sprintf("%s-%d", strings.ReplaceAll(strings.ToLower(title), " ", "-"), i)
				target.(map[string]interface{})["query"] = fmt.Sprintf("{{ %s }}", id)
				if err := write(filename, id, query); err != nil {
					fmt.Println(err.Error())
					return
				}
			}
		}
	}

	var (
		f   *os.File
		err error
	)
	newContents, _ := json.MarshalIndent(contents, "", "    ")
	if f, err = os.Create(fmt.Sprintf("%s.tpl", filename)); err != nil {
		fmt.Println("failed to create backup file")
		return
	}
	defer f.Close()

	f.Write(newContents)
}

func write(dashboard, name, query string) error {
	dirname := filepath.Join(".", dashboard)
	filename := fmt.Sprintf("%s.flux", filepath.Join(dirname, name))

	if fi, err := os.Stat(dirname); err != nil || !fi.IsDir() {
		if !os.IsNotExist(err) && !fi.IsDir() {
			return err
		}
	}

	if err := os.Mkdir(dirname, os.ModePerm); err != nil && !os.IsExist(err) {
		return err
	}

	var f *os.File
	var err error
	if f, err = os.Create(fmt.Sprintf("%s.tpl", filename)); err != nil {
		return err
	}

	defer f.Close()

	f.Write([]byte(query))
	return nil
}
