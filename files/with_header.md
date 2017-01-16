#### Method 2:  Adding a header file to C code

[Stackoverflow](http://stackoverflow.com/questions/439662) on **#import** v. **#include**.  

**add.h**

```c
int f1(int);
int f2(int);

```

**add1.c**

```c
#import <stdio.h>

int f1(int x) {
    printf( "f1: %d; ", x );
    return x+1;
}

```

**add2.c**

```c
#import <stdio.h>

int f2(int x) {
    printf( "f2: %d; ", x );
    return x+2;
}

```

**useadd.c**

```c
#import <stdio.h>
#import "add.h"

int main(int argc, char** argv){
    printf("  main %d\n", f1(1));
    printf("  main %d\n", f2(10));
    return 0;
}

```
Build both the **add** files:

```bash
> clang -g -Wall -c add*.c
> ls *.o
add1.o	add2.o
>
```

We have generated **add1.o** and **add2.o**.  Then

```bash
> clang -g -Wall useadd.c add1.o add2.o -o useadd
> ./useadd
f1: 1;   main 2
f2: 10;   main 12
>
```
