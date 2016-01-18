//
//  SpaceContent.h
//  Snakes and Ladders
//
//  Created by Chloe on 2016-01-17.
//  Copyright © 2016 Chloe Horgan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface SpaceContent : NSObject

@property (nonatomic, assign) int length;

- (void)movePlayer:(Player *)player;

@end
