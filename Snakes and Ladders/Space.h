//
//  Space.h
//  Snakes and Ladders
//
//  Created by Chloe on 2016-01-17.
//  Copyright © 2016 Chloe Horgan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Space : NSObject

@property (nonatomic, strong) Space *nextSpace;
@property (nonatomic, strong) Space *previousSpace;


@end
