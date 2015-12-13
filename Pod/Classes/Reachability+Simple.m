//
//  Reachability+SImple.m
//  
//
//  Created by Logan Sease on 10/22/15.
//
//

#import "Reachability+Simple.h"

@implementation GCNetworkReachability (Simple)

+ (BOOL)connected
{
    GCNetworkReachability *reachability = [GCNetworkReachability reachabilityForInternetConnection];
    return ([reachability isReachable]);
}

@end
