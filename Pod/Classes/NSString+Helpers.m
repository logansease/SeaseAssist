//
//  NSString+Helpers.m
//  Pods
//
//  Created by Logan Sease on 12/13/15.
//
//

#import "NSString+Helpers.h"

@implementation NSString (Helpers)

+(NSString*)empty
{
    return @"";
}

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

-(NSString *)stringByStrippingWhitespace
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

-(NSArray *)splitOnChar:(char)ch
{
    NSMutableArray *results = [[NSMutableArray alloc] init];
    int start = 0;
    for(int i=0; i<[self length]; i++) {
        
        BOOL isAtSplitChar = [self characterAtIndex:i] == ch;
        BOOL isAtEnd = i == [self length] - 1;
        
        if(isAtSplitChar || isAtEnd) {
            //take the substring &amp; add it to the array
            NSRange range;
            range.location = start;
            range.length = i - start + 1;
            
            if(isAtSplitChar)
                range.length -= 1;
            
            [results addObject:[self substringWithRange:range]];
            start = i + 1;
        }
        
        //handle the case where the last character was the split char.  we need an empty trailing element in the array.
        if(isAtEnd && isAtSplitChar)
            [results addObject:@""];
    }
    
    return results;
}

-(NSString *)substringFrom:(NSInteger)from to:(NSInteger)to
{
    NSString *rightPart = [self substringFromIndex:from];
    return [rightPart substringToIndex:to-from];
}

- (NSInteger)indexOf:(char)character
{
    for (NSUInteger i = 0; i < [self length]; i++)
    {
        if ([self characterAtIndex:i] == character)
        {
            return i;
        }
    }
    
    return -1;
}


-(BOOL)contains:(NSString *)string
{
    NSRange range = [self rangeOfString:string];
    return (range.location != NSNotFound);
}


@end
