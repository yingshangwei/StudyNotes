#include <stdio.h>
const char* p1 = "hello";
const char* p2 = "world";
void main() {
	printf("%016llX\n", p1);
	puts(p1);
	puts(p2);
}
