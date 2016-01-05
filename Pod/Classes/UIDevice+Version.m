//
//  UIDevice+Version.m
//  App
//
//  Created by lsease on 12/25/15.
//  Copyright © 2015 iParty Mobile. All rights reserved.
//

#import "UIDevice+Version.h"

@implementation UIDevice (Version)

+(BOOL)versionGreaterThanOrEqual:(NSString*)version
{
    return [[[UIDevice currentDevice] systemVersion] compare:version options:NSNumericSearch] != NSOrderedAscending;
}
@end
