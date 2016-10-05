//
//  NSString+Initials.m
//  conundrums
//
//  Created by Logan Sease on 3/8/16.
//  Copyright © 2016 iParty Mobile. All rights reserved.
//

#import "NSString+Initials.h"

@implementation NSString (Initials)
-(NSString*)initials
{
    //look for multiple words. If there are multiple then use the first letter of the first and second word
    //and capitolize them
    NSArray * words = [self componentsSeparatedByString:@" "];
    if(words.count >= 2)
    {
        NSString * firstWord = [words.firstObject uppercaseString];
        NSString * lastWord = [words.lastObject uppercaseString];
        
       if(firstWord.length > 0 && lastWord.length > 0)
       {
           return [NSString stringWithFormat:@"%c%c",[firstWord characterAtIndex:0],[lastWord characterAtIndex:0]];
       }
    }
    
    //if there are two characters use the first two capitalized
    if(self.length >= 2)
    {
        NSString * cap = [self uppercaseString];
        return [NSString stringWithFormat:@"%c%c",[cap characterAtIndex:0],[cap characterAtIndex:1]];
    }
    else if(self.length == 1)
    {
        NSString * cap = [self uppercaseString];
        return [NSString stringWithFormat:@"%c",[cap characterAtIndex:0]];
    }
    
    return self;
}
@end
