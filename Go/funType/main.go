package main

import (
	"fmt"
)

func add(a, b int) int {
	return a + b
}

func sub(a, b int) int {
	return a - b
}

//抽象加法和减法运算的函数类型
type Op func(int, int) int

//通用运算函数,函数为参数
func do(f Op, a, b int) int {
	return f(a, b)
}

//函数作为返回值
func Cnfun(op string) Op {
	switch op {
	case "加法":
		return add
	case "减法":
		return sub
	default:
		return nil
	}
}

func main() {

	var c Op
	fmt.Println(c)

	//add = sub //标准定义的函数名为常量
	c = add   //声明的函数变量可赋值
	fmt.Println(c)

	c = Cnfun("减法")
	fmt.Println(c)
	fmt.Println(c(1, 2))

	a := do(add, 1, 2)
	fmt.Println(a)

	s := do(sub, 1, 2)
	fmt.Println(s)
}
