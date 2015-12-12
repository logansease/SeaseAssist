//
//  UIWindow+TopViewController.m
//  sofascape
//
//  Created by lsease on 11/10/15.
//  Copyright © 2015 Logan Sease. All rights reserved.
//

#import "UIViewController+Top.h"

@implementation UIViewController (Top)
+(UIViewController*)topViewController
{
    UIWindow * window = [[UIApplication sharedApplication]keyWindow];
    return [self topViewController:window.rootViewController];
}

+(UIViewController*)topViewController:(UIViewController*)root
{
    //check to see if there is a view controller presented on top
    if(root.presentedViewController != nil)
    {
        return [self topViewController:root.presentedViewController];
    }
    
    //check to see if this is a tab controller
    if([root isKindOfClass:[UITabBarController class]])
    {
        UITabBarController * tab = (UITabBarController*)root;
        return [self topViewController:tab.selectedViewController];
    }
    
    //check to see if this is a nav controller
    if([root isKindOfClass:[UINavigationController class]])
    {
        UINavigationController * nav = (UINavigationController*)root;
        return [self topViewController:nav.topViewController];
    }
    
    //otherwise, this is the root VC.
    return root;
}

@end
