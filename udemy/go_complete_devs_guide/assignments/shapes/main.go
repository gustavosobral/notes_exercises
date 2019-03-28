package main

import "fmt"

type shape interface {
	calculateArea() float64
}

type square struct {
	sideLength float64
}

type triangle struct {
	height float64
	base   float64
}

func main() {
	s := square{sideLength: 10.2}
	t := triangle{height: 5.5, base: 3.3}

	printArea(s)
	printArea(t)
}

func (s square) calculateArea() float64 {
	return s.sideLength * s.sideLength
}

func (t triangle) calculateArea() float64 {
	return 0.5 * t.base * t.height
}

func printArea(s shape) {
	fmt.Println("Shape area:", s.calculateArea())
}
