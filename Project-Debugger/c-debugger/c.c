#include "bfd.h"
#include <stdio.h>
int main() {
    const char **p = bfd_target_list();
    while(p) {
        puts(*p);
        p++;
    }
    return 0;
}