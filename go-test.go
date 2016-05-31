package main

import "fmt"

func fact(n float64) float64 {
	if n == 0 {
		return 1
	}
	return n * fact(n-1)
}

func main() {
	fmt.Println(fact(100))
}
