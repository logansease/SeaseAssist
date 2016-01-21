//
//  UITableView+Background.m
//  EZWaves
//
//  Created by Logan Sease on 11/4/14.
//  Copyright (c) 2014 Qonceptual. All rights reserved.
//

#import "UIViewController+Background.h"

@implementation UIViewController (Background)

-(void)setBackgroundImage:(UIImage*)image withAlpha:(float)alpha
{
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:self.view.frame];
    imageView.image = image;
    imageView.alpha = alpha;
    imageView.contentMode = UIViewContentModeScaleToFill;
    imageView.tag = kViewBackgroundImageTag;
    [self.view addSubview:imageView];
    [self.view sendSubviewToBack:imageView];
    
    //add constraints to 
    [imageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"H:|-0-[imageView]-0-|"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(imageView)]];
    [self.view addConstraints:[NSLayoutConstraint
                               constraintsWithVisualFormat:@"V:|-0-[imageView]-0-|"
                               options:NSLayoutFormatDirectionLeadingToTrailing
                               metrics:nil
                               views:NSDictionaryOfVariableBindings(imageView)]];
    self.view.backgroundColor = [UIColor whiteColor];
}

@end


@implementation UITableViewController (Background)

-(void)setBackgroundImage:(UIImage*)image withAlpha:(float)alpha
{
    
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:self.tableView.frame];
    imageView.image = image;
    imageView.alpha = alpha;
    imageView.tag = kViewBackgroundImageTag;
    imageView.contentMode = UIViewContentModeScaleToFill;
    
    self.tableView.backgroundView = imageView;
}

@end
