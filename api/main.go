package main

import (
	"fmt"
	"net/http"
	"os"
)

func main() {
	version := os.Getenv("APP_VERSION")
	if version == "" {
		version = "v1.0.0"
	}

	http.HandleFunc("/health", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "OK")
	})
	http.HandleFunc("/version", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "{\"version\": \"%s\"}", version)
	})

	port := "8080"
	fmt.Println("Server started on port", port)
	http.ListenAndServe(":"+port, nil)
}
