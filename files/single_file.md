#### Method 1:  Compiling and running a single C code file

**single_file.c**

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
> cp src/single_file.c .
> clang -g -Wall single_file.c -o prog && ./prog
test:
f1: 1;  main 2
>>
```

Note:  if you haven't seen this before, we've combined two different commands.  

We could have done them separately as

```bash
> clang -g -Wall single_file.c -o prog
> ./prog
test:
f1: 1;  main 2
>
```

Even though the filename for the compiled program is ``prog`` (as requested with the ``-o`` flag to the compiler) we have to add something in front.

Invoking ``prog`` directly doesn't work.  

We reference ``prog`` in the current directory ``.`` and make the command:  ``./prog``, which is simply the path to the ``prog`` file.

