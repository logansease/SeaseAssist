//
//  NSArray+rearrange.m
//  Conundrums
//
//  Created by lsease on 1/11/16.
//  Copyright © 2016 iParty Mobile. All rights reserved.
//

#import "NSArray+Rearrange.h"

@implementation NSArray (Rearrange)
-(NSArray*)rotatedArrayAround:(NSInteger)index
{
    //if too large then exit
    if(index >= self.count)
    {
        return self;
    }
    
    //start at our desired index and all items to the array till the end
    NSMutableArray * result = [NSMutableArray array];
    for(NSInteger i = index ; i < self.count ; i++)
    {
        [result addObject:self[i]];
    }
    
    //now add all items from the beginning
    for(NSInteger i = 0 ; i < index ; i++)
    {
        [result addObject:self[i]];
    }
    
    return result;
}
@end
