//
//  UIViewController+Back.m
//  Conundrums
//
//  Created by lsease on 1/11/16.
//  Copyright © 2016 iParty Mobile. All rights reserved.
//

#import "UIViewController+Back.h"

@implementation UIViewController (Back)
-(void)goBackWithAnimation:(BOOL)animates
{
    if(self.navigationController && self.navigationController.viewControllers.firstObject != self)
    {
        [self.navigationController popViewControllerAnimated:animates];
    }
    else{
        [self dismissViewControllerAnimated:animates completion:nil];
    }
}
@end
