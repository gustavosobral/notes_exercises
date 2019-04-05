package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

func main() {
	nums := []int{}
	reader := bufio.NewReader(os.Stdin)
	fmt.Print("Enter a series of integers separated by comma: ")
	text, _ := reader.ReadString('\n')
	arr := strings.Split(text, ",")
	for _, a := range arr {
		num, _ := strconv.Atoi(a)
		nums = append(nums, num)
	}

}

func sort() {

}
