//
//  NSString+AbbreviatedDisplay.m
//  conundrums
//
//  Created by Logan Sease on 3/7/16.
//  Copyright © 2016 iParty Mobile. All rights reserved.
//

#import "NSString+AbbreviatedDisplay.h"

@implementation NSString (AbbreviatedDisplay)
+(NSString*)displayString:(float)number
{
    float billion = 1000000000;
    if(fabs(number) / billion > 1)
    {
        return [NSString stringWithFormat:@"%.1fB", (float)number / billion ];
    }
    
    float million = billion / 1000;
    if(fabs(number) / million > 1)
    {
        return [NSString stringWithFormat:@"%.1fM", (float)number / million ];
    }
    
    float thousand = million / 1000;
    if(fabs(number) / thousand > 1)
    {
        return [NSString stringWithFormat:@"%.1fK", (float)number / thousand ];
    }
    
    return [NSString stringWithFormat:@"%.0f",number];
}
@end
