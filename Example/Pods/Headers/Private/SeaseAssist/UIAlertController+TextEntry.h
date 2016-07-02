//
//  UIAlertController+TextEntry.h
//  App
//
//  Created by lsease on 12/24/15.
//  Copyright © 2015 iParty Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (TextEntry)

+(UIAlertController*)showTextEntryDialogWithTitle:(NSString*)title andMessage:(NSString*)message andPlaceHolder:(NSString*)holder from:(UIViewController*)controller completionHandler:(void (^)(NSString* text))handler;

+(UIAlertController*)showTextEntryDialogWithTitle:(NSString*)title andMessage:(NSString*)message andPlaceHolder:(NSString*)holder configuration:(void(^)(UITextField *textField))configurationHandler from:(UIViewController*)controller completionHandler:(void (^)(NSString* text))handler;

@end
