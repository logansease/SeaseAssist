//
//  UIViewController+Presentation.h
//  App
//
//  Created by lsease on 12/25/15.
//  Copyright © 2015 iParty Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Presentation)
+(void)present:(nonnull UIViewController* )newVC on:(nullable UIViewController*)source;
+(void)present:(nonnull UIViewController* )newVC on:(nullable UIViewController*)source withBlur:(float)blurAmount;
@end
