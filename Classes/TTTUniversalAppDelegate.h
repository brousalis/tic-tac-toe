//
//  TTTUniversalAppDelegate.h
//  TTTUniversal
//
//  Created by pete on 9/15/10.
//  Copyright (c) 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TTTUViewController;

@interface TTTUniversalAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TTTUViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet TTTUViewController *viewController;

@end
