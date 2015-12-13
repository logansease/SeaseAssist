//
//  NSString+Helpers.m
//  Pods
//
//  Created by Logan Sease on 12/13/15.
//
//

#import "NSString+Helpers.h"

@implementation NSString (Helpers)

-(NSInteger)occurancesOfString:(NSString*)test
{
    NSInteger count = 0, length = [self length];
    NSRange range = NSMakeRange(0, length);
    while(range.location != NSNotFound)
    {
        range = [self rangeOfString:test options:0 range:range];
        if(range.location != NSNotFound)
        {
            range = NSMakeRange(range.location + range.length, length - (range.location + range.length));
            count++;
        }
    }
    return count;
}

@end
