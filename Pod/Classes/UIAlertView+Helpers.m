//
//  UIAlertView+Helpers.m
//  EZWaves
//
//  Created by Logan Sease on 10/31/14.
//  Copyright (c) 2014 Qonceptual. All rights reserved.
//

#import "UIAlertView+Helpers.h"

@implementation UIAlertView (Helpers)

+(void)showWithTitle:(NSString*)title andMessage:(NSString*)message
{
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    dispatch_async(dispatch_get_main_queue(), ^{
        [alert show];
    });
}

@end
