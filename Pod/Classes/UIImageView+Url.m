//
//  UIImageView+Url.m
//  sofascape
//
//  Created by lsease on 11/6/15.
//  Copyright © 2015 Logan Sease. All rights reserved.
//

#import "UIImageView+Url.h"
#import "GCNetworkReachability.h"
#import "NSThread+Helpers.h"

@implementation UIImageView (Url)

-(void)setImageUrl:(NSString*)urlString
{
    //return from an empty URL
    if(urlString.length <= 0)
    {
        return;
    }
    
#if !TARGET_OS_TV
    //if we are on iphone, see if we have cached the image and if so load and set it
    UIImage * image = [UIImageView cachedImageForUrl:urlString];
    if(image)
    {
        self.image = image;
        return;
    }
#endif
    
    //this will ensure we don't set any old images to our view
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
                //set the image data
                [self setWithData:data fromUrl:urlString];
            }
        }];
    }
}

-(void)setWithData:(NSData*)imageData fromUrl:(NSString*)url
{
    if(imageData == nil || ![imageData isKindOfClass:[NSData class]])
    {
        return;
    }
    
    UIImage* image = [[UIImage alloc] initWithData:imageData];
    if(image)
    {
        CGSize itemSize = CGSizeMake(self.frame.size.width, self.frame.size.height);
        UIGraphicsBeginImageContext(itemSize);
        CGRect imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
        [image drawInRect:imageRect];
        UIImage * imageFromContext =  UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        [NSThread mainThread:^{
            self.image = imageFromContext;
        }];

        //if iphone cache the image
#if !TARGET_OS_TV
        [UIImageView cacheImage:self.image forUrl:url];
#endif
        
    }
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
