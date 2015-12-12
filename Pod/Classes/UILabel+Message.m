//
//  UILabel+Message.m
//  phrasepartyTV
//
//  Created by Logan Sease on 11/5/15.
//  Copyright © 2015 Logan Sease. All rights reserved.
//

#import "UILabel+Message.h"

@implementation UILabel (Message)
+(void)showMessage:(NSString*)message ofSize:(float)fontSize ofColor:(UIColor*)color inView:(UIView*)view forDuration:(float)seconds;
{
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, view.frame.size.height + fontSize + 20, view.frame.size.width, fontSize + 20)];
    label.textColor = color;
    label.text = message;
    label.textAlignment = NSTextAlignmentCenter;
    label.adjustsFontSizeToFitWidth = YES;
    label.numberOfLines = 2;
    label.font = [UIFont systemFontOfSize:fontSize];
    [view addSubview:label];
    [view bringSubviewToFront:label];
    
    [UIView animateWithDuration:.5 delay:0 usingSpringWithDamping:.3 initialSpringVelocity:0 options:0 animations:^{
        label.frame = CGRectMake(label.frame.origin.x, label.frame.origin.y - label.frame.size.height * 3, label.frame.size.width, label.frame.size.height);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:.5 delay:seconds options:0 animations:^{
            label.alpha = 0.0f;
        } completion:^(BOOL finished) {
            [label removeFromSuperview];
        }];
    }];
    
}
@end
