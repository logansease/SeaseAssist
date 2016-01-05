//
//  UIViewController+Presentation.m
//  App
//
//  Created by lsease on 12/25/15.
//  Copyright © 2015 iParty Mobile. All rights reserved.
//

#import "UIViewController+Presentation.h"
#import "UIViewController+Top.h" 
#import "UIDevice+Version.h"
#import "UIViewController+Blur.h"
#import "NSThread+Helpers.h"

@implementation UIViewController (Presentation)
+(void)present:(nonnull UIViewController* )newVC on:(nullable UIViewController*)source
{
    [self present:newVC on:source withBlur:0];
}

+(void)present:(nonnull UIViewController* )newVC on:(nullable UIViewController*)source withBlur:(float)blurAmount
{
    
    if(source == nil)
    {
        source = [UIViewController topViewController];
    }
    
    //if there is a view controller currently presenting, dismiss it first so we can show the login.
    if(source.presentingViewController)
    {
        [[source presentedViewController] dismissViewControllerAnimated:NO completion:nil];
    }
    
    if(blurAmount > 0)
    {
        newVC.view.backgroundColor = [UIColor colorWithWhite:1 alpha:1-blurAmount];
        if([UIDevice versionGreaterThanOrEqual:@"8.0"])
        {
            source.providesPresentationContextTransitionStyle = YES;
            source.definesPresentationContext = YES;
            newVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
        }
        else
        {
            source.modalPresentationStyle = UIModalPresentationCurrentContext;
        }
        [newVC blurBackground];
    }

    if(source)
    {
        [NSThread mainThread:^{
            [source presentViewController:newVC animated:YES completion:nil];
        }];
    }
}


@end
