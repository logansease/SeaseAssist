//
//  UIAlertController+TextEntry.h
//  App
//
//  Created by lsease on 12/24/15.
//  Copyright © 2015 iParty Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (TextEntry)

+(void)showTextEntryDialogWithTitle:(NSString*)title andMessage:(NSString*)message andPlaceHolder:(NSString*)holder from:(UIViewController*)controller completionHandler:(void (^)(NSString* text))handler;

@end
