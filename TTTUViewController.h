//
//  TTTUViewController.h
//  TTTUniversal
//
//  Created by pete on 9/15/10.
//  Copyright (c) 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TicTacToeGame.h"

@interface TTTUViewController : UIViewController {
    UILabel *userMessageLabel;    
    TicTacToeGame *game;
    
    UIImage *xImage;
    UIImage *oImage;
}

@property (nonatomic, retain) IBOutlet UILabel *userMessageLabel;
@property (nonatomic, retain) IBOutlet TicTacToeGame *game;
@property (nonatomic, retain) IBOutlet UIImage *xImage;
@property (nonatomic, retain) IBOutlet UIImage *oImage;

- (IBAction) pressedBoardSquare:(id)sender;
- (IBAction) pressedReset:(id)sender;

@end
