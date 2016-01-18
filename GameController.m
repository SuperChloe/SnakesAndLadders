//
//  GameController.m
//  Snakes and Ladders
//
//  Created by Chloe on 2016-01-17.
//  Copyright © 2016 Chloe Horgan. All rights reserved.
//

#import "GameController.h"
#import "InputCollector.h"
#import "SpaceContent.h"

@implementation GameController

- (instancetype)initWithBoardSize:(int)boardSize andDifficulty:(Difficulty)difficulty {
    self = [super init];
    if (self) {
        _boardSize = boardSize * boardSize;
        _difficulty = difficulty;
        _start = [self generateBoard];
        _player1 = [[Player alloc] init];
        _player2 = [[Player alloc] init];
        _player1.playerName = @"Player 1";
        _player2.playerName = @"Player 2";
        _player1.currentSpace = _start;
        _player2.currentSpace = _start;
        
    }
    return self;
}


- (void)startGame {
    NSLog(@"Reach space %d to win", self.boardSize);
    while (YES) {
        [self userInput:self.player1];
        [self printLocation];
        [self userInput:self.player2];
        [self printLocation];
    }
}

- (void)userInput:(Player *)player {
    int diceRoll;
    InputCollector *inputCollector = [[InputCollector alloc] init];
    NSLog(@"%@", player.playerName);
    NSString *roll =[inputCollector inputForPrompt:@"Input your roll:"];
    if ([roll isEqualToString:@"1"]) {
        diceRoll = 1;
    } else if ([roll isEqualToString:@"2"]) {
        diceRoll = 2;
    } else if ([roll isEqualToString:@"3"]) {
        diceRoll = 3;
    } else if ([roll isEqualToString:@"4"]) {
        diceRoll = 4;
    } else if ([roll isEqualToString:@"5"]) {
        diceRoll = 5;
    } else if ([roll isEqualToString:@"6"]) {
        diceRoll = 6;
    } else {
        NSLog(@"That is not a valid roll");
    }
    [self movePlayer:player withRoll:diceRoll];
}

- (void)movePlayer:(Player *)player withRoll:(int)diceRoll {
    for (int i = 0; i < diceRoll; i++) {
    player.currentSpace = player.currentSpace.nextSpace;
    }
}

- (void)printLocation {
    NSLog(@"Player 1 is on %d", self.player1.currentSpace.spaceNumber);
    NSLog(@"Player 2 is on %d", self.player2.currentSpace.spaceNumber);
}

- (Space *)generateBoard {
    Space *home = [[Space alloc] initWithContent:nil];
    Space *spaceCursor = home;
    Space *previousSpace;
    
    for (int i = 0; i < self.boardSize; i++) {
        
        SpaceContent *randomContent = [self randomContent];
        
        spaceCursor.nextSpace = [[Space alloc] initWithContent:randomContent];
        spaceCursor.spaceNumber = i + 1;
        previousSpace = spaceCursor;
        spaceCursor = spaceCursor.nextSpace;
        
        
    }
    
    return home;
}

- (SpaceContent *)randomContent {
    return nil;
}

@end