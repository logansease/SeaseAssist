//
//  NSURL+Helpers.m
//  conundrums
//
//  Created by Logan Sease on 12/31/15.
//  Copyright © 2015 iParty Mobile. All rights reserved.
//

#import "NSURL+Helpers.h"

@implementation NSURL (Helpers)
-(NSString*)toString
{
    return [self absoluteString];
}
@end
