#import <stdio.h>

extern int f1(int);
extern int f2(int);

int main(int argc, char** argv){
    printf("  main %d\n", f1(1));
    printf("  main %d\n", f2(10));
    return 0;
}

