//
//  GameController.h
//  Snakes and Ladders
//
//  Created by Chloe on 2016-01-17.
//  Copyright © 2016 Chloe Horgan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
#import "Space.h"

typedef NS_ENUM(NSInteger, Difficulty) {
    Easy,
    Medium,
    Hard
};


@interface GameController : NSObject

@property (nonatomic, assign) int boardSize;
@property (nonatomic) Difficulty difficulty;
@property (nonatomic, strong) Player *player1;
@property (nonatomic, strong) Player *player2;
@property (nonatomic, strong) Space *start;

- (instancetype)initWithBoardSize:(int)boardSize andDifficulty:(Difficulty)difficulty;
- (void)startGame;
- (void)userInput:(Player *)player;
- (void)movePlayer:(Player *)player withRoll:(int)diceRoll;
- (void)printLocation;
- (Space *)generateBoard;
- (SpaceContent *)randomContent:(Difficulty)difficulty spaceNumber:(int)number;

@end
