//
//  UITextField+Toolbar.h
//  Pods
//
//  Created by Logan Sease on 1/5/16.
//
//

#import <UIKit/UIKit.h>

@interface UITextField (Toolbar)
-(UIToolbar*)addToolbarWithLeftButton:(NSString*)lTitle withSelector:(SEL)lSelector andRightButton:(NSString*)rTitle withSelector:(SEL)rSelector andTarget:(id)target;
@end
