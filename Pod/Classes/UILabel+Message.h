//
//  UILabel+Message.h
//  phrasepartyTV
//
//  Created by Logan Sease on 11/5/15.
//  Copyright © 2015 Logan Sease. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Message)
+(void)showMessage:(NSString*)message ofColor:(UIColor*)color inView:(UIView*)view;
@end
