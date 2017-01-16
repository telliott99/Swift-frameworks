#### Method 8:  Use a standard OS X framework from the command line:

**test.m**

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
> clang -o test test.m -framework Foundation
> ./test
2017-01-15 20:49:32.385 test[9705:257881] telliott_admin
>
```

