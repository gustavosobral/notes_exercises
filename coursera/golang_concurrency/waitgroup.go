package main

import (
	"fmt"
	"sync"
)

func main() {
	var wg sync.WaitGroup
	wg.Add(1)
	go foo(&wg)
	wg.Wait()
	fmt.Println("Main")
}

func foo(wg *sync.WaitGroup) {
	fmt.Println("Go Routine")
	wg.Done()
}
