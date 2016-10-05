//
//  UIImageView+Initials.m
//  conundrums
//
//  Created by Logan Sease on 3/8/16.
//  Copyright © 2016 iParty Mobile. All rights reserved.
//

#import "UIImageView+Initials.h"
#import "NSString+Initials.h"
#import "UIView+Rounding.h"
#import "NSThread+Helpers.h"
#import "UIImageView+Networking.h"

@implementation UIImageView (Initials)
-(UILabel*)addInitialsPlaceholder:(NSString*)title circle:(BOOL)circle
{
    if([self viewWithTag:kInitialLabelTag])
    {
        UILabel * oldLabel= [self viewWithTag:kInitialLabelTag];
        [oldLabel removeFromSuperview];
    }
    
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    label.text = [title initials];
    label.textAlignment = NSTextAlignmentCenter;
    label.adjustsFontSizeToFitWidth = YES;
    label.font = [UIFont systemFontOfSize:24];
    label.backgroundColor = [UIColor colorWithWhite:1 alpha:.5];
    label.tag = kInitialLabelTag;
    if(circle)
    {
        [label circle];
    }
    [self addSubview:label];
    [self sendSubviewToBack:label];
    return label;
}

-(void)setImageFromUrl:(NSString*)urlString withPlaceholderString:(NSString*)holder withPlaceHolderImage:(UIImage*)image rounding:(BOOL)round
{
    [self setImageFromUrl:urlString withPlaceholderString:holder withPlaceHolderImage:image rounding:round completionHandler:^(BOOL success) {
    }];
}

-(void)setImageFromUrl:(NSString*)urlString withPlaceholderString:(NSString*)holder withPlaceHolderImage:(UIImage*)image rounding:(BOOL)round completionHandler:(BoolCompletionHandler)handler
{
    if([self viewWithTag:kInitialLabelTag])
    {
        UILabel * oldLabel= [self viewWithTag:kInitialLabelTag];
        [oldLabel removeFromSuperview];
    }
    
    NSString * initials = [holder initials];
    __block UIImageView * imageView = self;
    [self setImageFromUrl:urlString withDefault:image rounding:round completion:^(BOOL loaded) {
        if(!loaded && initials.length > 0)
        {
            [NSThread mainThread:^{
                //get a blank image to prevent the imageView size from adjusting
                UIGraphicsBeginImageContextWithOptions(CGSizeMake(imageView.frame.size.width, imageView.frame.size.height), NO, 0.0);
                UIImage *blank = UIGraphicsGetImageFromCurrentImageContext();
                UIGraphicsEndImageContext();
                imageView.image = blank;
                [imageView addInitialsPlaceholder:holder circle:round];
                handler(true);
            }];
        }
        else{
            handler(false);
        }
    }];

}
@end
