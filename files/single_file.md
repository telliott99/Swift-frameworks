#### Method 1:  Compiling and running a single C code file

**test.c**

```c
#include <stdio.h>

int f1(int);

int f1(int x){
    printf( "f1: %d;", x );
    return x+1;
}

int main(int argc, char** argv){
    printf("test:\n");
    printf("  main %d\n", f1(1));
    return 0;
}
```
command line:

```css
> clang -g -Wall test.c -o prog && ./prog
test:
f1: 1;  main 2
>

Note:  if you're not used to doing this, we've combined two different commands here.  The second one comes after the ``&&`` and calls

```bash
./prog
```

even though the program is ``prog``.  The reason is that invoking ``prog`` directly doesn't work.  

We reference ``prog`` in the current directory ``.`` with ``./prog``.

