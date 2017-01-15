#### Method 7:  Use a standard OS X framework from the command line:

**test2.m**

```objc
#import <Foundation/Foundation.h>
int main (int argc, const char* argv[]) {
    NSDictionary *eD = [[NSProcessInfo processInfo] environment];
    NSLog(@"%@",[[eD objectForKey:@"USER"] description]);
    return 0;
}
```

command line:

```bash
> clang -o test test2.m -framework Foundation
> ./test
2017-01-13 21:11:54.506 test[7792:197260] telliott_admin
>
```

