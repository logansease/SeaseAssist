//
//  UIAlertController+Helpers.h
//  sofascape
//
//  Created by lsease on 11/10/15.
//  Copyright © 2015 Logan Sease. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (Helpers)

+(void)showAlertWithTitle:(NSString*)title andMessage:(NSString*)message from:(UIViewController*)controller;
+(void)showDialogWithTitle:(NSString*)title andMessage:(NSString*)message from:(UIViewController*)controller andActions:(NSArray<NSString*>*)buttonTitles completionHandler:(void (^)(NSInteger selected))handler;
@end
