package main

import (
	"fmt"
)

func appendStr() func(string) string {

	t := "Hello" //编译器检测到t被闭包引用，会在堆上分配内存,而不是栈上

	c := func(b string) string {
		t = t + " " + b
		return t
	}
	return c
}

func main() {
	a := appendStr()

	fmt.Println(a("World"))
	fmt.Println(a("China"))

	b := appendStr()

	fmt.Println(b("Everyone"))
	fmt.Println(b("!"))
}
