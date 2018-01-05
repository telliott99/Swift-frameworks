//
//  AppDelegate.m
//  UseStaticLib
//
//  Created by Tom Elliott on 1/16/17.
//  Copyright © 2017 Tom Elliott. All rights reserved.
//

#import "AppDelegate.h"
#import "add.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    int x = f1(1);
    printf("AD: %d;", x);
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
