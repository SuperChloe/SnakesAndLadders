//
//  main.m
//  Snakes and Ladders
//
//  Created by Chloe on 2016-01-17.
//  Copyright © 2016 Chloe Horgan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameController.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        GameController *newGame = [[GameController alloc] initWithBoardSize:5 andDifficulty:Easy];
        
        [newGame startGame];
        
    }
    return 0;
}
