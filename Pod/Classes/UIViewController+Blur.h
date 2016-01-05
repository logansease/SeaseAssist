//
//  UIViewController+Blur.h
//  App
//
//  Created by lsease on 12/24/15.
//  Copyright © 2015 iParty Mobile. All rights reserved.
//
//
//  NOTE, you can use this easily with a modal, Over Current Context presentation to blur a view over another.

#import <UIKit/UIKit.h>

@interface UIViewController (Blur)
-(UIVisualEffectView*)blurBackground;
-(UIVisualEffectView*)blurBackgroundOfTableView:(UITableView*)tableView;
-(UIVisualEffectView*)darkBlurBackground;
-(UIVisualEffectView*)darkBlurBackgroundOfTableView:(UITableView*)tableView;
@end

@interface UITableViewController (Blur)
-(UIVisualEffectView*)blurBackground;
-(UIVisualEffectView*)darkBlurBackground;
@end
