//
//  Player.h
//  Snakes and Ladders
//
//  Created by Chloe on 2016-01-17.
//  Copyright © 2016 Chloe Horgan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Space.h"

@interface Player : NSObject

@property (nonatomic) Space *currentSpace;
@property (nonatomic, strong) NSString *playerName;

@end
