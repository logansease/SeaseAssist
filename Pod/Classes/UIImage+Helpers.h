//
//  UIImage+Helpers.h
//  Pods
//
//  Created by Logan Sease on 12/13/15.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (Helpers)
- (UIImage *)imageByScalingProportionallyToSize:(CGSize)targetSize;
- (UIImage *)imageWithColor:(UIColor *)color;
@end
