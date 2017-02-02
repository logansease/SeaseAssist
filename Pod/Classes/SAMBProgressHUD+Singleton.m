//
//  SAMBProgressHUD+Singleton.m
//  Pods
//
//  Created by Logan Sease on 12/13/15.
//
//

#import <UIKit/UIKit.h>
#import "SAMBProgressHUD+Singleton.h"
#import "NSThread+Helpers.h"

@implementation SAMBProgressHUD (Singleton)


static SAMBProgressHUD * commonHUD = nil;
    
//this helps to track the # of times we've called hide / show to allow for multiple loads
static NSInteger showingCount = 0;
    
+(id)commonHUD
{
    if(commonHUD == nil)
    {
        [SAMBProgressHUD setupCommonHUDWithView:nil];
    }
    
    return commonHUD;
}

+(void)showWithTitle:(NSString*)title
{
    //increment the count, if we are already showing one, then don't show another
    showingCount++;
    if(showingCount > 1)
    {
        return;
    }
    
    [NSThread mainThread:^{
        SAMBProgressHUD * hud = [self commonHUD];
        hud.labelText = title;
        hud.labelFont = [UIFont systemFontOfSize:20];
#if TARGET_OS_TV
        hud.labelFont = [UIFont systemFontOfSize:60];
#endif
        
        [hud show:YES];
    }];

}

+(void)hide
{
    //decrement the count. only hide if we aren't loading any more
    showingCount--;
    if(showingCount > 0)
    {
        return;
    }
    showingCount = 0;
    
    [NSThread mainThread:^{
    SAMBProgressHUD * hud = [self commonHUD];
    [hud hide:YES];
    }];
}

+(void)setupCommonHUDWithView:(UIView*)view
{
    if(view ==nil && ![UIApplication sharedApplication].keyWindow)
    {
        NSLog(@"tried to create the common HUD without a view");
        return;
    }
    if(view == nil)
    {
        view = [UIApplication sharedApplication].keyWindow;
    }
    
    if(view == nil)
    {
        return;
    }
    
    if(commonHUD == nil)
    {
        commonHUD = [[SAMBProgressHUD alloc]initWithView:view];
    }
    [view addSubview:commonHUD];
    [view bringSubviewToFront:commonHUD];
    
}


@end
