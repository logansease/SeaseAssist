//
//  UIDevice+Keychain.h
//  Pods
//
//  Created by lsease on 2/7/16.
//
//

#import <UIKit/UIKit.h>

@interface UIDevice (Keychain)
+(void)write:(NSString*)value toKeychainWithKey:(NSString*)key;
+(NSString*)readFromKeychainWithKey:(NSString*)key;
@end
