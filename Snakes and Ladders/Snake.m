//
//  Snake.m
//  Snakes and Ladders
//
//  Created by Chloe on 2016-01-17.
//  Copyright © 2016 Chloe Horgan. All rights reserved.
//

#import "Snake.h"

@implementation Snake


- (void)movePlayer:(Player *)player {
    // Move back x spaces
    for (int i = 0; i < self.length; i++) {
        NSLog(@"%d", player.currentSpace.spaceNumber);
        player.currentSpace = player.currentSpace.previousSpace;
    }
    NSLog(@"Sssssssnakin' on down %d spaces!", self.length);
}

@end
