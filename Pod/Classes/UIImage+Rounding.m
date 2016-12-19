//
//  UIImage+Rounding.m
//  conundrums
//
//  Created by Logan Sease on 12/30/15.
//  Copyright © 2015 iParty Mobile. All rights reserved.
//

#import "UIImage+Rounding.h"

@implementation UIImage (Rounding)
    
-(UIImage*)clippedToCircleOfSize:(CGSize)size
    {
        /* FIRST, SQUARE THE IMAGE */
        
        UIImage *image = self;
        
        float dim = size.width;
        if(size.height > size.width)
        {
            dim = size.height;
        }
        
        if(self.size.width != self.size.height)
        {
            image = [self cropToSize:dim];
        }
        
        // Begin a new image that will be the new image with the rounded corners
        // (here with the size of an UIImageView)
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(dim, dim), NO, 1.0);
        
        // Add a clip before drawing anything, in the shape of an rounded rect
        [[UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, dim, dim)
                                    cornerRadius:dim / 2] addClip];
        // Draw your image
        [image drawInRect:CGRectMake(0, 0, dim, dim)];
        
        // Get the image, here setting the UIImageView image
        UIImage * new = UIGraphicsGetImageFromCurrentImageContext();
        
        // Lets forget about that we were drawing
        UIGraphicsEndImageContext();
        
        return new;
    }
    
-(UIImage*)clippedToCircle
    {
        return [self clippedToCircleOfSize:CGSizeMake(self.size.width, self.size.width)];
    }
    
- (UIImage *)cropToSize:(float)sideLength
    {
        
        // input size comes from image
        CGSize inputSize = self.size;
        
        // round up side length to avoid fractional output size
        sideLength = ceilf(sideLength);
        
        // output size has sideLength for both dimensions
        CGSize outputSize = CGSizeMake(sideLength, sideLength);
        
        // calculate scale so that smaller dimension fits sideLength
        CGFloat scale = MAX(sideLength / inputSize.width,
                            sideLength / inputSize.height);
        
        // scaling the image with this scale results in this output size
        CGSize scaledInputSize = CGSizeMake(inputSize.width * scale,
                                            inputSize.height * scale);
        
        // determine point in center of "canvas"
        CGPoint center = CGPointMake(outputSize.width/2.0,
                                     outputSize.height/2.0);
        
        // calculate drawing rect relative to output Size
        CGRect outputRect = CGRectMake(center.x - scaledInputSize.width/2.0,
                                       center.y - scaledInputSize.height/2.0,
                                       scaledInputSize.width,
                                       scaledInputSize.height);
        
        // begin a new bitmap context, scale 0 takes display scale
        UIGraphicsBeginImageContextWithOptions(outputSize, YES, 0);
        
        // optional: set the interpolation quality.
        // For this you need to grab the underlying CGContext
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        CGContextSetInterpolationQuality(ctx, kCGInterpolationHigh);
        
        // draw the source image into the calculated rect
        [self drawInRect:outputRect];
        
        // create new image from bitmap context
        UIImage *outImage = UIGraphicsGetImageFromCurrentImageContext();
        
        // clean up
        UIGraphicsEndImageContext();
        
        // pass back new image
        return outImage;
        
    }
    
    @end
