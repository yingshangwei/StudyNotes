package main

import (
	"fmt"
	"math"
	"time"
)

func fibo1(n int) int {
	if n <= 1 {
		return n
	}
	return fibo1(n-1) + fibo1(n-2)
}

func fibo2(n int) (c int) {
	for a, b, i := 0, 1, 2; i <= n; i++ {
		c = a + b
		a = b
		b = c
	}
	return
}

func fibo3(n int) int {
	arr := make([]int, n+1, n+1)
	arr[0] = 0
	arr[1] = 1
	for i := 2; i <= n; i++ {
		arr[i] = arr[i-1] + arr[i-2]
	}
	return arr[n]
}

func fibo4(n int) int {
	m := float64(n)
	return int((math.Pow((1+math.Sqrt(5.0))/2.0, m) - math.Pow((1-math.Sqrt(5.0))/2.0, m)) / math.Sqrt(5.0))
}

func main() {

	//var a int
	start := time.Now().UnixNano() //记录当前时间的纳秒数
	fmt.Println(fibo1(40))
	fmt.Printf("Fibo1's time was: %v\n", (time.Now().UnixNano() - start))

	start = time.Now().UnixNano()
	for i := 0; i < 5; i++ {
		fibo2(20000000)
	}
	fmt.Println(fibo2(40))
	fmt.Printf("Fibo2's time was: %v\n", (time.Now().UnixNano() - start))

	start = time.Now().UnixNano()
	for i := 0; i < 5; i++ {
		fibo3(20000000)
	}
	fmt.Println(fibo3(40))
	fmt.Printf("Fibo3's time was: %v\n", (time.Now().UnixNano() - start))

	start = time.Now().UnixNano()
	for i := 0; i < 10000; i++ {
		fibo4(20000000)
	}
	fmt.Println(fibo4(40))
	fmt.Printf("Fibo4's time was: %v\n", (time.Now().UnixNano() - start))

}
