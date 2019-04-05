package main

import (
	"fmt"
	"time"
)

// The two go routines present in this code access and modify the same address on memory
// The result of this program depend on the routines interleaving order
func main() {
	counter := 1

	go incCounter(&counter)
	go incCounter(&counter)

	time.Sleep(1000 * time.Millisecond)
}

func incCounter(counter *int) {
	(*counter) = (*counter) + 1
	fmt.Println(*counter)
}
