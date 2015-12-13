//
//  NSMutableArray+shuffling.m
//  Scatterbuddies
//
//  Created by lsease on 12/6/12.
//  Copyright (c) 2012 iParty-Mobile. All rights reserved.
//

#import "NSMutableArray+shuffling.h"

@implementation NSMutableArray (shuffling)

- (void)shuffle
{
    NSUInteger count = [self count];
    for (NSUInteger i = 0; i < count; ++i) {
        // Select a random element between i and end of array to swap with.
        NSInteger  nElements = count - i;
        NSInteger  n = (arc4random() % nElements) + i;
        [self exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
}


@end
