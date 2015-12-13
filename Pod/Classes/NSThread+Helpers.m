//
//  NSThread+Helpers.m
//  Pods
//
//  Created by Logan Sease on 12/13/15.
//
//

#import "NSThread+Helpers.h"

@implementation NSThread (Helpers)

+(void)mainThread:(void (^)())main
{
     dispatch_async(dispatch_get_main_queue(), ^{
         main();
     });
}

+(void)backgroundThread:(void (^)())background
{
     dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
         background();
     });
}
@end
