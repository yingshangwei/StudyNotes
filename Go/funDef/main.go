package main

import (
	"fmt"
)

func addT1(a, b int) (int, bool) { //多值返回，返回值不命名
	c := a + b
	d := a > b
	return c, d //按顺序输入返回值
}
func addT2(a, b int) (c int, d bool) { //多值返回，返回值命名
	c = a + b
	d = a > b
	return //直接返回
}
func main() {
	e, f := addT1(8, 2)
	g, h := addT2(8, 2)
	fmt.Printf("%v,%v \n", e, f)
	fmt.Printf("%v,%v \n", g, h)

}
