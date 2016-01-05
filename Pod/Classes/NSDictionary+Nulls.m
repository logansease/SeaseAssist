//
//  NSDictionary+Nulls.m
//  Conundrums
//
//  Created by lsease on 12/26/15.
//  Copyright © 2015 iParty Mobile. All rights reserved.
//

#import "NSDictionary+Nulls.h"

@implementation NSDictionary (Nulls)
+(NSDictionary*)dictionaryWithoutEmptyValues:(NSDictionary*)input
{
    NSMutableDictionary * result = [NSMutableDictionary dictionaryWithDictionary:input];
    for(NSString * key in input.allKeys)
    {
        if([[input valueForKey:key] isKindOfClass:[NSNull class]])
        {
            [result removeObjectForKey:key];
        }
    }
    return result;
}
@end
