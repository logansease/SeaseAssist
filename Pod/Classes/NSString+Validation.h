//
//  NSString+Validation.h
//  Pods
//
//  Created by Logan Sease on 12/13/15.
//
//

#import <Foundation/Foundation.h>

@interface NSString (Validation)

-(BOOL)isValidEmail:(BOOL)laxValidation;
-(BOOL)isValidEmail;
-(BOOL)isDigitOfLength:(NSInteger)length;
-(BOOL)isBlank;
+(BOOL)isValidAlphanumbericChars:(NSString*)textString;

@end
