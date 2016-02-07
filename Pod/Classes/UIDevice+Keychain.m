//
//  UIDevice+Keychain.m
//  Pods
//
//  Created by lsease on 2/7/16.
//
//

#import "UIDevice+Keychain.h"
#import "KeychainItemWrapper.h"

@implementation UIDevice (Keychain)
+(void)write:(NSString*)value toKeychainWithKey:(NSString*)key
{
    NSString *bundleId = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
    
    KeychainItemWrapper *keychainItem = [[KeychainItemWrapper alloc] initWithIdentifier:bundleId accessGroup:nil];

    [keychainItem setObject:value forKey:(__bridge id)(kSecValueData)];
    NSLog(@"saving item %@", [keychainItem objectForKey:(__bridge id)(kSecValueData)]);

}
+(NSString*)readFromKeychainWithKey:(NSString*)key
{
    NSString *bundleId = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
    
    KeychainItemWrapper *keychainItem = [[KeychainItemWrapper alloc] initWithIdentifier:bundleId accessGroup:nil];

    NSData * result = [keychainItem objectForKey:(__bridge id)(kSecValueData)];
    if(![result isKindOfClass:[NSData class]])
    {
        return nil;
    }
    NSString * resultString = [[NSString alloc]initWithData:result encoding:NSUTF8StringEncoding];
    
    return resultString;
    
}
@end
