//
//  Reachability+SImple.m
//  
//
//  Created by Logan Sease on 10/22/15.
//
//

#import "Reachability+Simple.h"

@implementation Reachability (Simple)

+ (BOOL)connected
{
    Reachability *reachability = [self reachabilityForInternetConnection];
    NetworkStatus networkStatus = [reachability currentReachabilityStatus];
    return !(networkStatus == NotReachable);
}

@end
