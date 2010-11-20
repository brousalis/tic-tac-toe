//
//  TicTacToeGame.m
//  TicTacToeSolution
//
//  Created by David Fisher on 9/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TicTacToeGame.h"

@interface TicTacToeGame()
- (void) _checkForWinner;
- (BOOL) _didMarkWin:(enTicTacToeMark_t) markType;
- (BOOL) _isBoardFull;
@end


@implementation TicTacToeGame
@synthesize gameState;

- (enTicTacToeMark_t) getMarkInRow:(int) aRow column:(int) aColumn
{
	if (aRow >= NUM_ROWS || aColumn >= NUM_COLS || aRow < 0 || aColumn < 0) {
		return 0;
	}
	return gameBoard[aRow][aColumn];
}

- (void) playerPressedRow:(int) aRow column:(int) aColumn
{
	NSLog(@"Player pressed row=%d  column=%d",aRow,aColumn);
	if (aRow >= NUM_ROWS || aColumn >= NUM_COLS || aRow < 0 || aColumn < 0) { // Check the row and column is on the board
		return;  
	}
	if (gameBoard[aRow][aColumn] != MARK_NONE) { // Check if the spot is free
		return;
	}
	if (self.gameState == GAME_STATE_X_TURN) {
		gameBoard[aRow][aColumn] = MARK_X;
		gameState = GAME_STATE_O_TURN;
	}
	else if (self.gameState == GAME_STATE_O_TURN) {
		gameBoard[aRow][aColumn] = MARK_O;
		gameState = GAME_STATE_X_TURN;
	}
	[self _checkForWinner];
}
- (void) resetBoard
{
	int row,col;
	for (row=0; row<NUM_ROWS; row++) {
		for (col=0; col<NUM_COLS; col++) {
			gameBoard[row][col] = MARK_NONE;
		}
	}
	self.gameState = GAME_STATE_X_TURN;
}

#pragma mark -
#pragma mark Internal methods
- (void) _checkForWinner
{
	if ([self _didMarkWin:MARK_X]) {
		NSLog(@"X won the game");
		gameState = GAME_STATE_X_WON;
	}
	else if ([self _didMarkWin:MARK_O]) {
		NSLog(@"O won the game");
		gameState = GAME_STATE_O_WON;
	}
	else if ([self _isBoardFull]) {
		NSLog(@"Cat");
		gameState = GAME_STATE_TIE;
	}
}
- (BOOL) _didMarkWin:(enTicTacToeMark_t) markType
{
	BOOL marksMatchType;
	int i,j;
	//NSLog(@"Check for %@ win",markType == MARK_X ? @"X" : @"O");
	
	// Check all the rows
	for ( i = 0; i<NUM_ROWS; i++) {
		marksMatchType = YES;
		for ( j = 0; j<NUM_COLS; j++) {
			NSLog(@"Row check for i=%d j=%d",i,j);
			if (markType != gameBoard[i][j]) {
				marksMatchType = NO;
			}
		}
		if (marksMatchType) {
			NSLog(@"Row win for %@", markType == MARK_X ? @"X" : @"O");
			return YES;
		}
	}
	
	// Check all the columnss
	for ( j = 0; j<NUM_COLS; j++) {
		marksMatchType = YES;
		for ( i = 0; i<NUM_ROWS; i++) {
			if (markType != gameBoard[i][j]) {
				marksMatchType = NO;
			}
		}
		if (marksMatchType) {
			NSLog(@"Column win for %@", markType == MARK_X ? @"X" : @"O");
			return YES;
		}
	}
	
	// Check the down diagonal
	marksMatchType = YES;
	for ( i=0; i<NUM_ROWS; i++) {
		if (markType != gameBoard[i][i]) {
			marksMatchType = NO;
		}
	}
	if (marksMatchType) {
		NSLog(@"Down diag win for %@", markType == MARK_X ? @"X" : @"O");
		return YES;
	}
	// Check the up diagonal
	marksMatchType = YES;
	for ( i=0; i<NUM_ROWS; i++) {
		if (markType != gameBoard[NUM_ROWS-i-1][i]) {
			marksMatchType = NO;
		}
	}
	if (marksMatchType) {
		NSLog(@"Up diag win for %@", markType == MARK_X ? @"X" : @"O");
		return YES;
	}
	
	return NO; // No winner.  Checked all possible wins.
}
- (BOOL) _isBoardFull
{
	int i,j;
	NSLog(@"is board full");
	for ( i = 0; i<NUM_ROWS; i++) {
		for ( j = 0; j<NUM_COLS; j++) {
			if (gameBoard[i][j] == MARK_NONE) {
				NSLog(@"Found a blank at %d %d", i,j);
				return NO;
			}
		}
	}
	NSLog(@"Tie game");
	return YES; // No blanks found.  The board is full.
}

@end
