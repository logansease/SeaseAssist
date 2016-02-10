//
//  UITableView+Reload.h
//  Conundrums
//
//  Created by lsease on 1/15/16.
//  Copyright © 2016 iParty Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (Reload)
-(void)reloadSection:(NSInteger)section;
-(void)reloadSections:(NSInteger)fromSection to:(NSInteger)toSection;
@end
