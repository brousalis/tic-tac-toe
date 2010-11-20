//
//  TTTUViewController.m
//  TTTUniversal
//
//  Created by pete on 9/15/10.
//  Copyright (c) 2010 __MyCompanyName__. All rights reserved.
//

#import "TTTUViewController.h"
#import "TicTacToeGame.h"

@implementation TTTUViewController


@synthesize userMessageLabel, game, xImage, oImage;

- (void) _updateView
{
    // Update user message label
    switch (self.game.gameState) {
        case GAME_STATE_X_TURN:
            self.userMessageLabel.text = NSLocalizedString(@"X's Turn", @"X's Turn");
            break;
        case GAME_STATE_O_TURN:
            self.userMessageLabel.text = NSLocalizedString(@"O's Turn", @"O's Turn");
            break;
        case GAME_STATE_X_WON:
            self.userMessageLabel.text = NSLocalizedString(@"X Won", @"X Won");
            break;
        case GAME_STATE_O_WON:
            self.userMessageLabel.text = NSLocalizedString(@"O Won", @"O Won");
            break;
        case GAME_STATE_TIE:
            self.userMessageLabel.text = NSLocalizedString(@"Tie Game", @"Tie Game");
            break;
        default:
            break;
    }
    // Update the squares on the board
    for (int row = 0; row < NUM_ROWS; row++) {
        for (int col = 0; col < NUM_COLS;col++) {
            NSInteger tagToChange = 1000 + 10*row+col;
            UIButton *currentButton = (UIButton *) [self.view viewWithTag:tagToChange];
            switch([self.game getMarkInRow:row column:col])
            {
                case MARK_NONE:
                    [currentButton setImage:nil forState:UIControlStateNormal];
                    break;
                case MARK_X:
                    [currentButton setImage:self.xImage forState:UIControlStateNormal];
                    break;
                case MARK_O:
                    [currentButton setImage:self.oImage forState:UIControlStateNormal];
                    break;
                default:
                    break;
            }
        }
    }
    
    
}

- (IBAction) pressedBoardSquare:(id)sender
{
    //NSLog(@"%s", __FUNCTION__);
    UIButton *clickedButton = (UIButton *) sender;
    NSInteger buttonTag = clickedButton.tag;
    NSInteger row = buttonTag / 10 % 10;
    NSInteger col = buttonTag % 10;
    NSLog(@"%s - row: %d - col %d", __FUNCTION__, row, col);
    
    [self.game playerPressedRow:row column:col];
    [self _updateView];
}


- (IBAction) pressedReset:(id)sender 
{
    NSLog(@"%s", __FUNCTION__);   
    [self.game resetBoard];
    [self _updateView];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    TicTacToeGame *newGame = [[TicTacToeGame alloc] init];
    self.game = newGame;
    [newGame release];
    
    [self _updateView];
    
}


/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
    self.userMessageLabel = nil;
    self.game = nil;
    self.xImage = nil;
    self.oImage = nil;
}


- (void)dealloc {
    [super dealloc];
    [xImage release];
    [oImage release];
    [game release];
    [userMessageLabel release];
}

@end
