//
//  ReachabilityTest.m
//  Pods
//
//  Created by Logan Sease on 1/21/16.
//
//

#import "UIDevice+Reachability.h"
#import "GCNetworkReachability.h"

@implementation UIDevice(Reachability)
+(BOOL)connected
{
    return [[GCNetworkReachability reachabilityForInternetConnection] isReachable];
}
@end
