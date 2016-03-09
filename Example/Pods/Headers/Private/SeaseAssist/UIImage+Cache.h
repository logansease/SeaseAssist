//
//  UIImage+Cache.h
//  Conundrums
//
//  Created by lsease on 1/18/16.
//  Copyright © 2016 iParty Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

//TODO Merge this with the imageView

@interface UIImage (Cache)
+(void)cacheImage:(UIImage*)image forUrl:(NSString*)url;
+(NSString*)cacheFileNameFor:(NSString*)url;
+(UIImage*)cachedImageForUrl:(NSString*)url;
+(void)loadImageToCacheFrom:(NSString*)url;
@end
