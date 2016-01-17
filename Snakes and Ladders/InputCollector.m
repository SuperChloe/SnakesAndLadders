//
//  InputCollector.m
//  
//
//  Created by Chloe on 2016-01-12.
//  Copyright © 2016 Chloe Horgan. All rights reserved.
//

#import "InputCollector.h"


@implementation InputCollector

- (NSString *)inputForPrompt:(NSString *)promptString {
    NSLog(@"\n%@", promptString);
    char userInput[50];
    fgets(userInput, 50, stdin);
    NSString *input = [NSString stringWithUTF8String:userInput];
    input = [input stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return input;
}

@end
