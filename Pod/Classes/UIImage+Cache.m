//
//  UIImage+Cache.m
//  Conundrums
//
//  Created by lsease on 1/18/16.
//  Copyright © 2016 iParty Mobile. All rights reserved.
//

#import "UIImage+Cache.h"
#import "NSThread+Helpers.h"
#import "GCNetworkReachability.h"


@implementation UIImage (Cache)

+(void)loadImageToCacheFrom:(NSString*)url
{
    //if we are connected
    if([[GCNetworkReachability reachabilityForInternetConnection] isReachable]){
    
        [NSThread backgroundThread:^{
            //create our request
            NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0];
            
            //call a URL to get the image Data
    [[NSURLSession sharedSession]dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                
                if(data == nil || ![data isKindOfClass:[NSData class]])
                {
                    return;
                }
                
                UIImage* image = [[UIImage alloc] initWithData:data];
                [self cacheImage:image forUrl:url];
            }];
        }];
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
    NSData * data = UIImageJPEGRepresentation(image, 0.8f);
    [data writeToFile:filePath atomically:NO];
    
    NSLog(@"%@",filePath);
}

+(NSString*)cacheFileNameFor:(NSString*)url
{
    NSString * filename = [url stringByReplacingOccurrencesOfString:@":" withString:@""];
    filename = [filename stringByReplacingOccurrencesOfString:@"/" withString:@""];
    filename = [filename stringByReplacingOccurrencesOfString:@"." withString:@""];
    
    NSString * tempFileName =  [NSTemporaryDirectory() stringByAppendingPathComponent:filename];
    
    NSFileManager * fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:tempFileName]) {
        return tempFileName;
    }

    NSString * documents = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString * imageFolder = [documents stringByAppendingPathComponent:@"imageCache"];
    if (![fileManager fileExistsAtPath:imageFolder]) {
        [fileManager createDirectoryAtPath:imageFolder withIntermediateDirectories:NO attributes:nil error:nil];
    }
    return [imageFolder stringByAppendingPathComponent:filename];
}


@end
