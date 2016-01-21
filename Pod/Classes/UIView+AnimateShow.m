//
//  UILabel+AnimateShow.m
//  Conundrums
//
//  Created by lsease on 1/9/16.
//  Copyright © 2016 iParty Mobile. All rights reserved.
//

#import "UIView+AnimateShow.h"
#import "NSThread+Delay.h"

@implementation UIView (AnimateShow)
-(void)animateShow
{
    self.hidden = NO;
    self.alpha = 0;
    [UIView animateWithDuration:.5 animations:^{
        self.alpha = 1;
    }];
}
+(void)animateShow:(NSArray<UIView*>*)views
{
    for(UIView * view in views)
    {
        view.hidden = NO;
        view.alpha = 0;
    }
    [UIView animateWithDuration:.5 animations:^{
        for(UIView * view in views)
        {
            view.alpha = 1;
        }
    }];
}

+(void)animateShow:(NSArray<UIView*>*)views withDelay:(float)delay
{
    for(UIView * view in views)
    {
        view.hidden = NO;
        view.alpha = 0;
    }
    
    [NSThread delay:delay code:^{
        [UIView animateWithDuration:.5 animations:^{
            for(UIView * view in views)
            {
                view.alpha = 1;
            }
        }];
    }];
}



+(void)animateHide:(NSArray<UIView*>*)views
{
    [UIView animateWithDuration:.5 animations:^{
        for(UIView * view in views)
        {
            view.alpha = 0;
        }
    }];
}


-(void)animateHide
{
    [UIView animateWithDuration:.5 animations:^{
        self.alpha = 0.0f;
    }];
}
@end
