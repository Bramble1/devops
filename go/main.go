package main

import (
	"fmt"

	"github.com/google/uuid"
)

func greet(name string) string {
	return fmt.Sprintf("Hello, %s!", name)
}

func main() {
	id := uuid.New()
	fmt.Println(greet("World"))
	fmt.Println("UUID:", id.String())
}
