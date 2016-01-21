//
//  UIColor+Hex.m
//  Conundrums
//
//  Created by lsease on 1/9/16.
//  Copyright © 2016 iParty Mobile. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)
+(UIColor*)colorWithHex:(NSString*)hex
{
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hex];
    
    BOOL skipFirst = NO;
    if([hex rangeOfString:@"#"].location == 0)
    {
        skipFirst = YES;
    }
    
    [scanner setScanLocation: skipFirst? 1 : 0]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];

}
@end
