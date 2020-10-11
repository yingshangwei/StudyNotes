package main

import (
	"fmt"
)

//不定参数函数
func sum(items ...int) (sum int) {
	for _, v := range items { //items 相当于切片
		sum += v
	}
	return
}

//切片参数函数
func sumS(items []int) (sum int) {
	for _, v := range items {
		sum += v
	}
	return
}

func main() {

	slice := []int{1, 2, 3, 4, 5}
	//array := [...]int{1, 2, 3, 4, 5}
	fmt.Println(sum(1, 2, 3, 4, 5))
	fmt.Println(sum(slice...)) //不定参数函数参数为切片时，需用...运算符
	//fmt.Println(sum(array...)) //数组不支持...运算符
	fmt.Println(sumS(slice)) //切片参数函数可直接用切片变量，不用...运算符
	//fmt.Println(sumS(array)) //切片参数函数不能用数组传参
	fmt.Printf("%T\n", sum)
	fmt.Printf("%T\n", sumS)

}
