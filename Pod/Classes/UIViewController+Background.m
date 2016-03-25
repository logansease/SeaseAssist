//
//  UITableView+Background.m
//  EZWaves
//
//  Created by Logan Sease on 11/4/14.
//  Copyright (c) 2014 Qonceptual. All rights reserved.
//

#import "UIViewController+Background.h"

@implementation UIViewController (Background)

-(UIImageView*)setBackgroundImage:(UIImage*)image withAlpha:(float)alpha
{
    if([self.view isKindOfClass:[UITableView class]])
    {
        UITableView * table = (UITableView*)self.view;
        return [table setBackgroundImage:image withAlpha:alpha];
    }
    
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:self.view.frame];
    imageView.image = image;
    imageView.alpha = alpha;
    imageView.contentMode = UIViewContentModeScaleToFill;
    imageView.tag = kViewBackgroundImageTag;
    [self.view addSubview:imageView];
    [self.view sendSubviewToBack:imageView];
    self.view.clipsToBounds = YES;
    
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
    return imageView;
}

@end


@implementation UITableViewController (Background)

-(UIImageView*)setBackgroundImage:(UIImage*)image withAlpha:(float)alpha
{
    
    return [self.tableView setBackgroundImage:image withAlpha:alpha];
}

@end

@implementation UITableView (Background)

-(UIImageView*)setBackgroundImage:(UIImage*)image withAlpha:(float)alpha
{
    
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:self.frame];
    imageView.image = image;
    imageView.alpha = alpha;
    imageView.tag = kViewBackgroundImageTag;
    imageView.contentMode = UIViewContentModeScaleToFill;
    
    self.backgroundView = imageView;
    return imageView;
}

-(UIImageView*)setupTableHeader:(UIImage*)image
{
    // create crowdflik logo
    UIImageView * logoView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    logoView.image = image;
    //self.imageView = logoView;
    logoView.contentMode = UIViewContentModeScaleAspectFit;
    //self.cachedImageViewSize = self.imageView.frame;
    self.tableHeaderView =  logoView;
    [self setContentInset:UIEdgeInsetsMake(-image.size.height, 0, 0, 0)];
    return logoView;
    
}

@end
