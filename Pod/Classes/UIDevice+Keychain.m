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
+(void)write:(NSString*)value toKeychainWithKey:(NSString*)key appSpecific:(BOOL)appSpecific
{
    @try{
    NSString *bundleId = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
    if(!appSpecific)
    {
        bundleId = @"";
    }
    
    NSString * combinedKey = [NSString stringWithFormat:@"%@.%@",bundleId,key];
    
    KeychainItemWrapper *keychainItem = [[KeychainItemWrapper alloc] initWithIdentifier:combinedKey accessGroup:nil];
        [keychainItem resetKeychainItem];
        keychainItem = [[KeychainItemWrapper alloc] initWithIdentifier:combinedKey accessGroup:nil];
        [keychainItem setObject:key forKey:(__bridge id)(kSecAttrAccount)];
        [keychainItem setObject:value forKey:(__bridge id)(kSecValueData)];
        
        NSLog(@"saving item %@", [keychainItem objectForKey:(__bridge id)(kSecValueData)]);
    }
    @catch(NSException * e)
    {
        NSLog(@"Error writing to keychain");
    }
}
+(NSString*)readFromKeychainWithKey:(NSString*)key appSpecific:(BOOL)appSpecific
{
    @try{
    NSString *bundleId = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
    
    if(!appSpecific)
    {
        bundleId = @"";
    }
    
    NSString * combinedKey = [NSString stringWithFormat:@"%@.%@",bundleId,key];
    
    KeychainItemWrapper *keychainItem = [[KeychainItemWrapper alloc] initWithIdentifier:combinedKey accessGroup:nil];
    
    NSData * result = [keychainItem objectForKey:(__bridge id)(kSecValueData)];
    if(![result isKindOfClass:[NSData class]] || ![result respondsToSelector:@selector(length)] || result.length == 0)
    {
        return nil;
    }
    NSString * resultString = [[NSString alloc]initWithData:result encoding:NSUTF8StringEncoding];
    
    return resultString;
    }
    @catch(NSException * e)
    {
        NSLog(@"Error writing to keychain");
        return nil;
    }
    
}
@end
