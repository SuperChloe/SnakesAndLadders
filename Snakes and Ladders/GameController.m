//
//  GameController.m
//  Snakes and Ladders
//
//  Created by Chloe on 2016-01-17.
//  Copyright © 2016 Chloe Horgan. All rights reserved.
//

// TODO: If you happen to get a snake generated on the last space, you can never win the game lol. But it happens rarely, so will fix if I have time.
// TODO: randomContent:spaceNumber: needs DRY

#import "GameController.h"
#import "InputCollector.h"
#import "SpaceContent.h"
#import "Snake.h"
#import "Ladder.h"

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
    
    while (self.player1.currentSpace.spaceNumber != self.boardSize && self.player2.currentSpace.spaceNumber != self.boardSize) {
        [self userInput:self.player1];
        [self printLocation];
        [self userInput:self.player2];
        [self printLocation];
    }
    if (self.player1.currentSpace.spaceNumber == self.boardSize) {
        NSLog(@" Player 1 Wins!!!!! Game Over!");
    } else if (self.player2.currentSpace.spaceNumber == self.boardSize) {
        NSLog(@"Player 2 Wins!!!!! Game Over!");
    }
}

- (void)userInput:(Player *)player {
    InputCollector *inputCollector = [[InputCollector alloc] init];
    while (YES) {
        NSLog(@"%@", player.playerName);
        NSString *roll = [inputCollector inputForPrompt:@"Input your roll:"];
   
        int diceRoll;
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
        if (diceRoll) {
            [self movePlayer:player withRoll:diceRoll];
            break;
        }
    }
}

- (void)movePlayer:(Player *)player withRoll:(int)diceRoll {
    for (int i = 0; i < diceRoll; i++) {
        if (player.currentSpace.nextSpace) {
            player.currentSpace = player.currentSpace.nextSpace;
        }
    }
    if (player.currentSpace.content) {
        [player.currentSpace.content movePlayer:player];
    }
}

- (void)printLocation {
    NSLog(@"Player 1 is on %d", self.player1.currentSpace.spaceNumber);
    NSLog(@"Player 2 is on %d", self.player2.currentSpace.spaceNumber);
}

- (Space *)generateBoard {
    Space *home = [[Space alloc] initWithContent:nil];
    home.spaceNumber = 1;
    Space *spaceCursor = home;
    Space *previousSpace;
    
    for (int i = 1; i < self.boardSize; i++) {
        
        SpaceContent *randContent = [self randomContent:self.difficulty spaceNumber:i + 1];
        
        spaceCursor.nextSpace = [[Space alloc] initWithContent:randContent];
        spaceCursor.nextSpace.spaceNumber = i + 1;
        previousSpace = spaceCursor;
        spaceCursor = spaceCursor.nextSpace;
        spaceCursor.previousSpace = previousSpace;
    }
    return home;
}

- (SpaceContent *)randomContent:(Difficulty)difficulty spaceNumber:(int)number {
    int random = arc4random_uniform(100);
    if (difficulty == Easy) {
        // 5/60/35
        if (random < 5) {
            Snake *snake = [[Snake alloc] init];
            if (snake.length > number - 1) {
                snake.length = number - 1;
            }
            return snake;
        } else if (random >= 65) {
            Ladder *ladder = [[Ladder alloc] init];
            int distanceFromEnd = self.boardSize - number;
            if (ladder.length > distanceFromEnd) {
                ladder.length = distanceFromEnd;
            }
            return ladder;
        }
    } else if (difficulty == Medium) {
        // 20/60/20
        if (random < 20) {
            Snake *snake = [[Snake alloc] init];
            if (snake.length > number - 1) {
                snake.length = number - 1;
            }
            return snake;
        } else if (random >= 80) {
            Ladder *ladder = [[Ladder alloc] init];
            int distanceFromEnd = self.boardSize - number;
            if (ladder.length > distanceFromEnd) {
                ladder.length = distanceFromEnd;
            }
            return ladder;
        }
    } else if (difficulty == Hard) {
        // 35/60/5
        if (random < 35) {
            Snake *snake = [[Snake alloc] init];
            if (snake.length > number - 1) {
                snake.length = number - 1;
            }
            return snake;
        } else if (random >= 95) {
            Ladder *ladder = [[Ladder alloc] init];
            int distanceFromEnd = self.boardSize - number;
            if (ladder.length > distanceFromEnd) {
                ladder.length = distanceFromEnd;
            }
            return ladder;
        }
    }
    return nil;
}



@end
