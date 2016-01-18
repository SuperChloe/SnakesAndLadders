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
        _player1 = [[Player alloc] init];
        _player2 = [[Player alloc] init];
        _start = [self generateBoard];
        
    }
    return self;
}


- (void)startGame {
    NSLog(@"Reach space %d to win", self.boardSize);
    while (YES) {
        [self userInput];
    }

}

- (void)userInput {
    InputCollector *inputCollector = [[InputCollector alloc] init];
    NSString *roll =[inputCollector inputForPrompt:@"Input your roll:"];
    if ([roll isEqualToString:@"1"]) {
        
    } else if ([roll isEqualToString:@"2"]) {
        
    } else if ([roll isEqualToString:@"3"]) {
        
    } else if ([roll isEqualToString:@"4"]) {
        
    } else if ([roll isEqualToString:@"5"]) {
        
    } else if ([roll isEqualToString:@"6"]) {
        
    } else {
        NSLog(@"That is not a valid roll");
    }
}

- (Space *)generateBoard {
    Space *home = [[Space alloc] initWithContent:nil];
    Space *spaceCursor = home;
    Space *previousSpace;
    
    for (int i = 0; i < self.boardSize; i++) {
        
        SpaceContent *randomContent = [self randomContent];
        
        spaceCursor.nextSpace = [[Space alloc] initWithContent:randomContent];
        previousSpace = spaceCursor;
        spaceCursor = spaceCursor.nextSpace;
        
    }
    
    return home;
}

- (SpaceContent *)randomContent {
    return nil;
}

@end
