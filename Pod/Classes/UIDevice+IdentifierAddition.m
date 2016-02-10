//
//  UIDevice(Identifier).m
//  UIDeviceAddition
//
//  Created by Georg Kitz on 20.08.11.
//  Copyright 2011 Aurora Apps. All rights reserved.
//

#import "UIDevice+IdentifierAddition.h"

#include <sys/socket.h> // Per msqr
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>

#import "UIDevice+Keychain.h"

@interface UIDevice(Private)

- (NSString *) macaddress;

@end

@implementation UIDevice (IdentifierAddition)

////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Private Methods

// Return the local MAC addy
// Courtesy of FreeBSD hackers email list
// Accidentally munged during previous update. Fixed thanks to erica sadun & mlamb.
- (NSString *) macaddress{
    
    int                 mib[6];
    size_t              len;
    char                *buf;
    unsigned char       *ptr;
    struct if_msghdr    *ifm;
    struct sockaddr_dl  *sdl;
    
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    
    if ((mib[5] = if_nametoindex("en0")) == 0) {
        printf("Error: if_nametoindex error\n");
        return NULL;
    }
    
    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 1\n");
        return NULL;
    }
    
    if ((buf = malloc(len)) == NULL) {
        printf("Could not allocate memory. error!\n");
        return NULL;
    }
    
    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 2");
        free(buf);
        return NULL;
    }
    
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    NSString *outstring = [NSString stringWithFormat:@"%02X:%02X:%02X:%02X:%02X:%02X", 
                           *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    free(buf);
    
    return outstring;
}

////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Public Methods

- (NSString *) uniqueDeviceIdentifier{
    
    NSString * result = [UIDevice readFromKeychainWithKey:@"UNIQUE_DEVICE_IDENTIFIER" appSpecific:YES];
    
    if(result)
    {
        return result;
    }
    
    NSString * macAddress = nil;
    if([[UIDevice currentDevice]respondsToSelector:@selector(identifierForVendor)])
    {
        macAddress = [[UIDevice currentDevice] identifierForVendor].UUIDString;
    }
    else{
        NSUInteger randomNumber = random();
        NSDateFormatter * formatter= [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"ASSS"];
        NSString * result = [[NSString alloc] initWithFormat:@"%@-%lu",[formatter stringFromDate:[NSDate date]],(unsigned long)randomNumber];
        macAddress = result;
    }
    
    NSString *bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];
    
    NSString *stringToHash = [NSString stringWithFormat:@"%@%@",macAddress,bundleIdentifier];
    result = [stringToHash stringFromMD5];
    
    [UIDevice write:result toKeychainWithKey:@"UNIQUE_DEVICE_IDENTIFIER" appSpecific:YES];
    
    return result;
}

- (NSString *) uniqueGlobalDeviceIdentifier{
    
    NSString * result = [UIDevice readFromKeychainWithKey:@"UNIQUE_GLOBAL_DEVICE_IDENTIFIER" appSpecific:NO];
    
    if(result)
    {
        return result;
    }
    
    NSString * macAddress = nil;
    if([[UIDevice currentDevice]respondsToSelector:@selector(identifierForVendor)])
    {
        macAddress = [[UIDevice currentDevice] identifierForVendor].UUIDString;
    }
    else{
        NSUInteger randomNumber = random();
        NSDateFormatter * formatter= [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"ASSS"];
        NSString * result = [[NSString alloc] initWithFormat:@"%@-%ld",[formatter stringFromDate:[NSDate date]],(unsigned long)randomNumber];
        macAddress = result;
    }
    
    result = [macAddress stringFromMD5];
    
    [UIDevice write:result toKeychainWithKey:@"UNIQUE_GLOBAL_DEVICE_IDENTIFIER" appSpecific:NO];
    
    return result;
}


@end
