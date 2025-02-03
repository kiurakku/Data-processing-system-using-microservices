package main

import (
	"fmt"
	"io/ioutil"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
	// Відправляємо запит до Data Processor
	resp, err := http.Get("http://data-processor:8081/process")
	if err != nil {
		http.Error(w, "Error calling data processor", http.StatusInternalServerError)
		return
	}
	defer resp.Body.Close()

	// Читаємо відповідь від Data Processor
	body, _ := ioutil.ReadAll(resp.Body)
	fmt.Fprintf(w, "Response from Data Processor: %s", body)
}

func main() {
	// Налаштовуємо HTTP-сервер
	http.HandleFunc("/", handler)
	http.ListenAndServe(":8080", nil)
}
