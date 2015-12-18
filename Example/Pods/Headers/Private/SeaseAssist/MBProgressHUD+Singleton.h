//
//  MBProgressHUD+Singleton.h
//  Pods
//
//  Created by Logan Sease on 12/13/15.
//
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (Singleton)
+(id)commonHUD;
+(void)showWithTitle:(NSString*)title;
+(void)hide;
+(void)setupCommonHUDWithView:(UIView*)view;
@end
