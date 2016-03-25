//
//  UIDevice+Version.h
//  App
//
//  Created by lsease on 12/25/15.
//  Copyright © 2015 iParty Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (Version)
+(BOOL)versionGreaterThanOrEqual:(NSString*)version;
@end
