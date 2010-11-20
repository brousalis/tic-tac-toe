//
//  TicTacToeGame.h
//  TicTacToeSolution
//
//  Created by David Fisher on 9/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define NUM_ROWS 3
#define NUM_COLS NUM_ROWS  // Most Tic Tac Toe boards should be square

typedef enum {
	MARK_NONE,
	MARK_X,
	MARK_O
} enTicTacToeMark_t;

typedef enum {
	GAME_STATE_X_TURN,
	GAME_STATE_O_TURN,
	GAME_STATE_X_WON,
	GAME_STATE_O_WON,
	GAME_STATE_TIE
} enTicTacToeGameState_t;

@interface TicTacToeGame : NSObject {
	enTicTacToeMark_t gameBoard[NUM_ROWS][NUM_COLS];
	enTicTacToeGameState_t gameState;
}
@property (nonatomic) enTicTacToeGameState_t gameState;
- (enTicTacToeMark_t) getMarkInRow:(int) aRow column:(int) aColumn;
- (void) playerPressedRow:(int) aRow column:(int) aColumn;
- (void) resetBoard;

@end
