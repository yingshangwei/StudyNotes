这个博客主要是讲解了一下在linux中C的动态内存分配是如何实现的，小内存通过brk分配，大内存通过mmap分配。

TODO::不过其中说mmap是建立虚拟内存和文件地址的映射，不知道这是个什么映射操作？动态开的内存空间实际上还能在磁盘上不成？

ref : https://blog.csdn.net/gfgdsg/article/details/42709943