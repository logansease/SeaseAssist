//
//  NSString+Helpers.h
//  Pods
//
//  Created by Logan Sease on 12/13/15.
//
//

#import <Foundation/Foundation.h>

@interface NSString (Helpers)
-(NSInteger)occurancesOfString:(NSString*)test;
-(BOOL)contains:(NSString *)string;
+(NSString*)empty;
- (NSInteger)indexOf: (char)character;
-(NSArray *)splitOnChar:(char)ch;
-(NSString *)substringFrom:(NSInteger)from to:(NSInteger)to;
-(NSString *)stringByStrippingWhitespace;
@end
