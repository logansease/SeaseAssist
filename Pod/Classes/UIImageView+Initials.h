//
//  UIImageView+Initials.h
//  conundrums
//
//  Created by Logan Sease on 3/8/16.
//  Copyright © 2016 iParty Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GenericCompletionHandlers.h"

#define kInitialLabelTag        847123

@interface UIImageView (Initials)
-(UILabel*)addInitialsPlaceholder:(NSString*)title circle:(BOOL)circle;
-(void)setImageFromUrl:(NSString*)urlString withPlaceholderString:(NSString*)holder withPlaceHolderImage:(UIImage*)image rounding:(BOOL)round;
-(void)setImageFromUrl:(NSString*)urlString withPlaceholderString:(NSString*)holder withPlaceHolderImage:(UIImage*)image rounding:(BOOL)round completionHandler:(BoolCompletionHandler)handler;
@end
