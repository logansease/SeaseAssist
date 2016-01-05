//
//  UIButton+Helpers.m
//  App
//
//  Created by lsease on 12/24/15.
//  Copyright © 2015 iParty Mobile. All rights reserved.
//

#import "UIButton+TitleHelpers.h"

@implementation UIButton (TitleHelpers)
-(void)setTitle:(NSString*)title{
    [self setTitle:title forState:UIControlStateNormal];
}
@end
