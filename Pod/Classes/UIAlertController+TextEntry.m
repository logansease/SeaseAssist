//
//  UIAlertController+TextEntry.m
//  App
//
//  Created by lsease on 12/24/15.
//  Copyright © 2015 iParty Mobile. All rights reserved.
//

#import "UIAlertController+TextEntry.h"
#import "UIViewController+Top.h"
#import "UIViewController+Presentation.h"

@implementation UIAlertController (TextEntry)

+(void)showTextEntryDialogWithTitle:(NSString*)title andMessage:(NSString*)message andPlaceHolder:(NSString*)holder from:(UIViewController*)controller completionHandler:(void (^)(NSString* text))handler
{
    if(!controller)
    {
        controller = [UIViewController topViewController];
    }
    
    if(!controller)
    {
        return;
    }
    
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        UITextField * field = alert.textFields[0];
        handler(field.text);
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        handler(nil);
    }]];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = holder;
        textField.autocapitalizationType = UITextAutocapitalizationTypeSentences;
    }];
    
    [UIViewController present:alert on:controller];
}

@end
