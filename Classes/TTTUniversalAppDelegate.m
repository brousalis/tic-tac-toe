//
//  TTTUniversalAppDelegate.m
//  TTTUniversal
//
//  Created by pete on 9/15/10.
//  Copyright (c) 2010 __MyCompanyName__. All rights reserved.
//

#import "TTTUniversalAppDelegate.h"
#import "TTTUViewController.h"

@implementation TTTUniversalAppDelegate

@synthesize window, viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // Override point for customization after application launch.
    [window addSubview:self.viewController.view];
    [window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {

    // Save data if appropriate.
}

- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}

@end
