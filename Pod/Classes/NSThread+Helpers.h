//
//  NSThread+Helpers.h
//  Pods
//
//  Created by Logan Sease on 12/13/15.
//
//

#import <Foundation/Foundation.h>

@interface NSThread (Helpers)
+(void)mainThread:(void (^)())main;
+(void)backgroundThread:(void (^)())background;
@end
