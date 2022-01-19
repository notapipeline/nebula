package main

import (
	"encoding/json"
	"fmt"
	"log"
	"os/exec"
)

func main() {
	result := make(map[string]interface{})
	speeds := make([]map[string]interface{}, 0)

	speedtest := "/usr/bin/speedtest"
	common := []string{
		"-f",
		"json-pretty",
		"--accept-license",
		"--accept-gdpr",
	}
	out, err := exec.Command(speedtest, append(common, "-L")...).Output()
	if err != nil {
		log.Fatal(err)
	}
	json.Unmarshal(out, &result)

	for _, item := range result["servers"].([]interface{}) {
		id := int(item.(map[string]interface{})["id"].(float64))
		out, err = exec.Command(speedtest, append(common, "-s", fmt.Sprint(id))...).Output()
		if err != nil {
			log.Fatal(err)
		}
		speed := make(map[string]interface{})
		json.Unmarshal(out, &speed)
		speeds = append(speeds, speed)
	}
	response, _ := json.Marshal(speeds)
	fmt.Println(string(response))
}
