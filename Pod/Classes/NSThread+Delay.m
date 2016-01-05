//
//  NSThread+Delay.m
//  Conundrums
//
//  Created by lsease on 1/2/16.
//  Copyright © 2016 iParty Mobile. All rights reserved.
//

#import "NSThread+Delay.h"
#import "NSThread+Helpers.h"

@implementation NSThread (Delay)
+(void)delay:(float)length code:(void (^)())function
{
    [self backgroundThread:^{
        [NSThread sleepForTimeInterval:length];
        [self mainThread:function];
    }];
}

@end
