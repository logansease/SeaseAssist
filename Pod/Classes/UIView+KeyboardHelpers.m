//
//  UIViewController+KeyboardHelpers.m
//  App
//
//  Created by lsease on 12/25/15.
//  Copyright © 2015 iParty Mobile. All rights reserved.
//

#import "UIView+KeyboardHelpers.h"

@implementation UIView (KeyboardHelpers)
-(void)hideKeyboardOnClick
{
    UIGestureRecognizer * gr = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideKeyboard)];
    [self addGestureRecognizer:gr];
}

-(void)hideKeyboard
{
    //hide the keyboard and recursively call this method on all subviews
    [self resignFirstResponder];
    for(UIView * view in self.subviews)
    {
        [view hideKeyboard];
    }
}

-(UIView*)findFirstResponder
{
    UIView * result = nil;
    if([self isFirstResponder])
    {
        result = self;
    }
    else
    {
        for(UIView * view in self.subviews)
        {
            result = [view findFirstResponder];
            if(result)
            {
                return result;
            }
        }
    }
    return result;
}

@end
