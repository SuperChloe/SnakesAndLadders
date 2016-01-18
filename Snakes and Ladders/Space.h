//
//  Space.h
//  Snakes and Ladders
//
//  Created by Chloe on 2016-01-17.
//  Copyright © 2016 Chloe Horgan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SpaceContent.h"

@interface Space : NSObject

@property (nonatomic, strong) Space *nextSpace;
@property (nonatomic, strong) Space *previousSpace;
@property (nonatomic, strong) SpaceContent *content;
@property (nonatomic, assign) int spaceNumber;

- (instancetype)initWithContent:(SpaceContent *)content;


@end
