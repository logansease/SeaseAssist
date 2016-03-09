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

@implementation UIImageView (Networking)


-(void)setImageFromUrl:(NSString*)urlString withDefault:(UIImage*)defaultImage rounding:(BOOL)round completion:(void(^)(BOOL loaded))handler
{
    self.image = defaultImage;
    if(round)
    {
        self.image = [defaultImage clippedToCircle];
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
    UIImage * image = [UIImageView cachedImageForUrl:urlString];
    if(image)
    {
        self.image = image;
        if(round)
        {
            self.image = [image clippedToCircle];
        }
        if(handler)
        {
            handler(true);
        }
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
        //        CGSize itemSize = CGSizeMake(self.frame.size.width, self.frame.size.height);
        //        UIGraphicsBeginImageContext(itemSize);
        //        CGRect imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
        //        [image drawInRect:imageRect];
        //        UIImage * imageFromContext =  UIGraphicsGetImageFromCurrentImageContext();
        //        UIGraphicsEndImageContext();
        
        [NSThread mainThread:^{
            self.image = image;
            
            if(round)
            {
                self.image = [image clippedToCircle];
            }
            
            //if iphone cache the image
#if !TARGET_OS_TV
            [UIImageView cacheImage:image forUrl:url];
#endif
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
