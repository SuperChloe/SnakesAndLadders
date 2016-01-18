//
//  main.m
//  Snakes and Ladders
//
//  Created by Chloe on 2016-01-17.
//  Copyright © 2016 Chloe Horgan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameController.h"
#import "InputCollector.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        InputCollector *inputCollector = [[InputCollector alloc] init];
        NSString *boardSizeString = [inputCollector inputForPrompt:@"Choose a board size:"];
        NSString *difficultyString = [inputCollector inputForPrompt:@"Choose a difficulty ('e' for easy, 'm' for medium, 'h' for hard):"];
        int boardSize = [boardSizeString intValue];
        int intDiff;
        if ([difficultyString isEqualToString:@"e"]) {
            intDiff = Easy;
        } else if ([difficultyString isEqualToString:@"m"]) {
            intDiff = Medium;
        } else if ([difficultyString isEqualToString:@"h"]) {
            intDiff = Hard;
        }
        
        GameController *newGame = [[GameController alloc] initWithBoardSize:boardSize andDifficulty:intDiff];
        
        [newGame startGame];
        
    }
    return 0;
}
