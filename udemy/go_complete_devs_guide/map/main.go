package main

import "fmt"

func main() {
	colors := map[string]string{
		"red":   "#ff0000",
		"green": "#00ff00",
		"white": "#ffffff",
	}
	fmt.Println(colors)
	printMap(colors)
	delete(colors, "green")
	fmt.Println(colors)

	var newColors map[string]string
	fmt.Println(newColors)

	var makeColors = make(map[string]string)
	makeColors["white"] = "#ffffff"
	fmt.Println(makeColors)
}

func printMap(c map[string]string) {
	for color, hex := range c {
		fmt.Println("Hex code for", color, "is", hex)
	}
}
