//
//  Ladder.m
//  Snakes and Ladders
//
//  Created by Chloe on 2016-01-17.
//  Copyright © 2016 Chloe Horgan. All rights reserved.
//

#import "Ladder.h"

@implementation Ladder

- (void)movePlayer:(Player *)player {
    // Move forward x spaces
    for (int i = 0; i < self.length; i++) {
        player.currentSpace = player.currentSpace.nextSpace;
    }
}

@end
