//
//  UILabel+AnimateShow.h
//  Conundrums
//
//  Created by lsease on 1/9/16.
//  Copyright © 2016 iParty Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (AnimateShow)
-(void)animateShow;
-(void)animateHide;
+(void)animateShow:(NSArray<UIView*>*)views;
+(void)animateHide:(NSArray<UIView*>*)views;
+(void)animateShow:(NSArray<UIView*>*)views withDelay:(float)delay;
@end
