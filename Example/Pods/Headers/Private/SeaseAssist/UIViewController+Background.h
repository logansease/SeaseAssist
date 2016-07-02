//
//  UITableView+Background.h
//  EZWaves
//
//  Created by Logan Sease on 11/4/14.
//  Copyright (c) 2014 Qonceptual. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kViewBackgroundImageTag 90123
@interface UIViewController (Background)
-(UIImageView*)setBackgroundImage:(UIImage*)image withAlpha:(float)alpha;
@end


@interface UITableViewController (Background)
-(UIImageView*)setBackgroundImage:(UIImage*)image withAlpha:(float)alpha;
@end


@interface UITableView (Background)
-(UIImageView*)setBackgroundImage:(UIImage*)image withAlpha:(float)alpha;
-(UIImageView*)setupTableHeader:(UIImage*)image;
@end
