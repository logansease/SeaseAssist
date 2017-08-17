//
//  UIImageView+Networking.m
//  conundrums
//
//  Created by Logan Sease on 12/30/15.
//  Copyright © 2015 iParty Mobile. All rights reserved.
//

#import "UIImageView+Networking.h"
#import "NSThread+Helpers.h"
#import "UIView+Rounding.h"
#import "UIImage+Rounding.h"
#import "GCNetworkReachability.h"
#import "UIImage+Helpers.h"

@implementation UIImageView (Networking)


-(void)setImageFromUrl:(NSString*)urlString withDefault:(UIImage*)defaultImage rounding:(BOOL)round completion:(void(^)(BOOL loaded))handler
{
    if(round)
    {
        if(self.frame.size.width > 0)
        {
            self.image = [defaultImage clippedToCircleOfSize:self.frame.size];
        } else{
            self.image = [defaultImage clippedToCircle];
        }
        
    } else if(defaultImage)
    {
        //if the content mode is aspect fill then we should not resize the image since it will impact this
        if(self.contentMode == UIViewContentModeScaleAspectFill )
        {
            self.image = defaultImage;
        }
        else if(self.frame.size.width > 0)
        {
            self.image = [defaultImage imageByScalingProportionallyToSize:self.frame.size];
        } else{
            self.image = [defaultImage imageByScalingProportionallyToSize:CGSizeMake(100, 100)];
        }
    }else
    {
        if(self.frame.size.width > 0)
        {
            self.image = [UIImage blankImageWithSize:self.frame.size];
        } else{
            self.image = [UIImage blankImageWithSize:CGSizeMake(100, 100)];
        }
    }
    
    //return from an empty URL
    if(urlString.length <= 0)
    {
        if(handler)
        {
            handler(false);
        }
        return;
    }
    
#if !TARGET_OS_TV
    //if we are on iphone, see if we have cached the image and if so load and set it
    if([self setCachedImage:urlString round:round withHandler:handler])
    {
        return;
    }
#endif
    
    //this will ensure we don't set any old images to our view
    NSInteger originalTag = self.tag;
    self.tag = random();
    NSInteger tag = self.tag;
    
    //if we are connected
    if([[GCNetworkReachability reachabilityForInternetConnection] isReachable]){
        
        //create our request
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:urlString] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0];
        
        //call a URL to get the image Data
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
            
            //ensure this view hasn't called a new load URL
            if(self.tag == tag)
            {
                //set the image data and reset the tag
                [self setWithData:data fromUrl:urlString andRound:round completion:^(BOOL loaded) {
                    if(handler)
                    {
                        handler(loaded);
                    }
                }];
                self.tag = originalTag;
            }
        }];
    }
}

//this method will load a cached image from a url and set it, applying rounding if necessary
-(BOOL)setCachedImage:(NSString*)url round:(BOOL)round withHandler:(void(^)(BOOL loaded))handler
{
    BOOL cached = false;
    UIImage * image = [UIImageView cachedImageForUrl:url];
    
    if(image)
    {
        cached = YES;
    }
    
    [NSThread mainThread:^{
        
        CGRect frame = self.frame;
        if(image)
        {
            //if we need to round, then do it in a background thread, but call the main thread to set it
            if(round)
            {
                [NSThread backgroundThread:^{
                    
                    UIImage * scaled = nil;
                    if(self.frame.size.width > 0)
                    {
                        //find the pixel density
                        CGFloat screenScale = [[UIScreen mainScreen] scale];
                        
                        scaled = [image clippedToCircleOfSize:CGSizeMake(frame.size.width * screenScale, frame.size.height * screenScale)];
                    } else
                    {
                        scaled = [image clippedToCircle];
                    }
                    
                    [NSThread mainThread:^{
                        self.image = scaled;
                        if(handler)
                        {
                            handler(true);
                        }
                    }];
                }];
            } else{
                
                self.image = image;
                if(handler)
                {
                    handler(true);
                }
            }
        }
        
    }];
    return cached;
}

-(void)setWithData:(NSData*)imageData fromUrl:(NSString*)url andRound:(BOOL)round completion:(void(^)(BOOL loaded))handler
{
    if(imageData == nil || ![imageData isKindOfClass:[NSData class]])
    {
        if(handler)
        {
            handler(NO);
        }
        return;
    }
    
    UIImage* image = [[UIImage alloc] initWithData:imageData];
    if(image)
    {

#if !TARGET_OS_TV
        [UIImageView cacheImage:image forUrl:url];
#endif
        if(round)
        {
            image = [image clippedToCircle];
        }
        
//        else if(self.frame.size.width > 0)
//        {
//            //scale the image to avoid issues setting a giant image to a small view
//            //find the pixel density
//            CGFloat screenScale = [[UIScreen mainScreen] scale];
//            image = [image imageByScalingProportionallyToSize:CGSizeMake(self.frame.size.width * screenScale, self.frame.size.height * screenScale)];
//        }
        
        [NSThread mainThread:^{
            self.image = image;
            
            if(handler)
            {
                handler(YES);
            }
        }];
    }
    else{
        if(handler)
        {
            handler(NO);
        }
    }
}

//helpers

-(void)setImageFromUrl:(NSString*)urlString withDefault:(UIImage*)defaultImage
{
    [self setImageFromUrl:urlString withDefault:defaultImage andRounding:NO];
    
}
-(void)setImageFromUrl:(NSString*)urlString withDefault:(UIImage*)defaultImage andRounding:(BOOL)round
{
    [self setImageFromUrl:urlString withDefault:defaultImage rounding:round completion:nil];
}


+(UIImage*)cachedImageForUrl:(NSString*)url
{
    NSString * imagePath = [self cacheFileNameFor:url];
    NSFileManager * fileManager = [NSFileManager defaultManager];
    if(imagePath != nil && [fileManager fileExistsAtPath:imagePath])
    {
        NSData * imageData = [NSData dataWithContentsOfFile:imagePath];
        return [[UIImage alloc] initWithData:imageData];
    }
    NSLog(@"%@",imagePath);
    return nil;
}

+(void)cacheImage:(UIImage*)image forUrl:(NSString*)url
{
    NSString * filePath = [self cacheFileNameFor:url];
    NSData * data = UIImageJPEGRepresentation(image, .8f) ;
    [data writeToFile:filePath atomically:NO];
    
    NSLog(@"%@",filePath);
}

+(NSString*)cacheFileNameFor:(NSString*)url
{
    NSString * filename = [url stringByReplacingOccurrencesOfString:@":" withString:@""];
    filename = [filename stringByReplacingOccurrencesOfString:@"/" withString:@""];
    filename = [filename stringByReplacingOccurrencesOfString:@"." withString:@""];
    
    return [NSTemporaryDirectory() stringByAppendingPathComponent:filename];
}


@end
