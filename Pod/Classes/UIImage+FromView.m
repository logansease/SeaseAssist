//
//  UIImage+FromView.m
//  Conundrums
//
//  Created by lsease on 1/11/16.
//  Copyright © 2016 iParty Mobile. All rights reserved.
//

#import "UIImage+FromView.h"

@implementation UIImage (FromView)
+(UIImage*)fromView:(UIView*)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}
@end
