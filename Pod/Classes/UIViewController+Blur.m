//
//  UIViewController+Blur.m
//  App
//
//  Created by lsease on 12/24/15.
//  Copyright © 2015 iParty Mobile. All rights reserved.
//

#import "UIViewController+Blur.h"

@implementation UIViewController (Blur)

-(UIVisualEffectView*)darkBlurBackground
{
    UIBlurEffect * blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *beView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    beView.frame = self.view.bounds;
    [self.view addSubview:beView];
    [self.view sendSubviewToBack:beView];
    
    //add constraints to
    [beView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"H:|-0-[beView]-0-|"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(beView)]];
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:|-0-[beView]-0-|"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(beView)]];
    
    self.view.backgroundColor = [UIColor clearColor];
    
    return beView;
}

-(UIVisualEffectView*)darkBlurBackgroundOfTableView:(UITableView*)tableView
{
    UIBlurEffect * blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *beView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    beView.frame = self.view.bounds;
    tableView.backgroundView = beView;
    
    self.view.backgroundColor = [UIColor clearColor];
    
    return beView;
}

-(UIVisualEffectView*)blurBackground
{
    UIBlurEffect * blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *beView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    beView.frame = self.view.bounds;
    [self.view addSubview:beView];
    [self.view sendSubviewToBack:beView];
    
    //add constraints to
    [beView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"H:|-0-[beView]-0-|"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(beView)]];
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:|-0-[beView]-0-|"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(beView)]];
    
    self.view.backgroundColor = [UIColor clearColor];
    
    return beView;
}

-(UIVisualEffectView*)blurBackgroundOfTableView:(UITableView*)tableView
{
    UIBlurEffect * blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *beView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    beView.frame = self.view.bounds;
    tableView.backgroundView = beView;
    
    self.view.backgroundColor = [UIColor clearColor];
    
    return beView;
}

@end

@implementation UITableViewController (Blur)
-(UIVisualEffectView*)blurBackground
{
    return [self blurBackgroundOfTableView:self.tableView];
}
-(UIVisualEffectView*)darkBlurBackground
{
    return [self darkBlurBackgroundOfTableView:self.tableView];
}

@end
