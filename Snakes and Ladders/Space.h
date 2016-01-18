//
//  Space.h
//  Snakes and Ladders
//
//  Created by Chloe on 2016-01-17.
//  Copyright © 2016 Chloe Horgan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SpaceContent;

@interface Space : NSObject

@property (nonatomic) Space *nextSpace;
@property (nonatomic) Space *previousSpace;
@property (nonatomic) SpaceContent *content;
@property (nonatomic, assign) int spaceNumber;

- (instancetype)initWithContent:(SpaceContent *)content;


@end
