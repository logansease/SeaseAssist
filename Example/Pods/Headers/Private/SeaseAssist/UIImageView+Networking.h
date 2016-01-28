//
//  UIImageView+Networking.h
//  conundrums
//
//  Created by Logan Sease on 12/30/15.
//  Copyright © 2015 iParty Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Networking)
-(void)setImageFromUrl:(NSString*)url withDefault:(UIImage*)defaultImage andRounding:(BOOL)round;
@end
