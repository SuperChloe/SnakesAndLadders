//
//  SpaceContent.m
//  Snakes and Ladders
//
//  Created by Chloe on 2016-01-17.
//  Copyright © 2016 Chloe Horgan. All rights reserved.
//

#import "SpaceContent.h"

@implementation SpaceContent

- (instancetype)init {
    self = [super init];
    if (self) {
        _length = arc4random_uniform(10);
    }
    return self;
}

// For subclass
- (void)movePlayer:(Player *)player {
    NSLog(@"ERROR: Don't call this, YOU DUN GOOFED");
}

@end
