//
//  Space.m
//  Snakes and Ladders
//
//  Created by Chloe on 2016-01-17.
//  Copyright © 2016 Chloe Horgan. All rights reserved.
//

#import "Space.h"

@implementation Space

- (instancetype)initWithContent:(SpaceContent *)content {
    self = [super init];
    if (self) {
        _content = content;
    }
    return self;
}

@end
