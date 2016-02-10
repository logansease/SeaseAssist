//
//  UIDevice+Keychain.h
//  Pods
//
//  Created by lsease on 2/7/16.
//
//

#import <UIKit/UIKit.h>

@interface UIDevice (Keychain)
+(void)write:(NSString*)value toKeychainWithKey:(NSString*)key appSpecific:(BOOL)appSpecific;
+(NSString*)readFromKeychainWithKey:(NSString*)key appSpecific:(BOOL)appSpecific;
@end
