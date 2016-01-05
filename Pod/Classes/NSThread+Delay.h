//
//  NSThread+Delay.h
//  Conundrums
//
//  Created by lsease on 1/2/16.
//  Copyright © 2016 iParty Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSThread (Delay)
+(void)delay:(float)length code:(void (^)())function;
@end
