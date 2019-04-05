package main

import (
	"fmt"
	"sync"
)

/*
Implement the dining philosopher’s problem with the following constraints/modifications.

There should be 5 philosophers sharing chopsticks, with one chopstick between each adjacent pair of philosophers.
Each philosopher should eat only 3 times (not in an infinite loop as we did in lecture)
The philosophers pick up the chopsticks in any order, not lowest-numbered first (which we did in lecture).
In order to eat, a philosopher must get permission from a host which executes in its own goroutine.
The host allows no more than 2 philosophers to eat concurrently.
Each philosopher is numbered, 1 through 5.
When a philosopher starts eating (after it has obtained necessary locks) it prints “starting to eat <number>” on a line by itself, where <number> is the number of the philosopher.
When a philosopher finishes eating (before it has released its locks) it prints “finishing eating <number>” on a line by itself, where <number> is the number of the philosopher.
*/

type philosopher struct {
	id      int
	leftCS  *chopstick
	rightCS *chopstick
}

type host struct {
	counter int
}

type chopstick struct{ sync.Mutex }

var askPermission = make(chan bool)
var getPermission = make(chan bool)

func main() {
	var wg sync.WaitGroup
	host := host{2}
	go host.host()

	chopsticks := make([]*chopstick, 5)
	for i := 0; i < 5; i++ {
		chopsticks[i] = new(chopstick)
	}

	philosophers := make([]philosopher, 5)
	wg.Add(5)
	for i := 0; i < 5; i++ {
		philosophers[i] = philosopher{i + 1, chopsticks[i], chopsticks[(i+1)%5]}
		go philosophers[i].dinning(&wg)
	}
	wg.Wait()
}

func (h host) host() {
	select {
	case <-askPermission:
		if(h)
		h.counter = h.counter - 1
	}
}

func (p philosopher) dinning(wg *sync.WaitGroup) {
	for i := 0; i < 3; i++ {
		p.eat()
	}
	wg.Done()
}

func (p philosopher) eat() {
	p.leftCS.Lock()
	p.rightCS.Lock()
	fmt.Println("starting to eat", p.id)
	fmt.Println("finishing eating", p.id)
	p.leftCS.Unlock()
	p.rightCS.Unlock()
}
