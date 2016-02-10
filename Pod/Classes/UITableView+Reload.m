//
//  UITableView+Reload.m
//  Conundrums
//
//  Created by lsease on 1/15/16.
//  Copyright © 2016 iParty Mobile. All rights reserved.
//

#import "UITableView+Reload.h"

@implementation UITableView (Reload)
-(void)reloadSections:(NSInteger)fromSection to:(NSInteger)toSection
{    
    NSRange range = NSMakeRange(fromSection, toSection - fromSection);
    NSIndexSet *sectionToReload = [NSIndexSet indexSetWithIndexesInRange:range];
    [self reloadSections:sectionToReload withRowAnimation:UITableViewRowAnimationAutomatic];
}

-(void)reloadSection:(NSInteger)section
{
    [self reloadSections:section to:section + 1];
}

@end
