//
//  NSString+Validation.m
//  Pods
//
//  Created by Logan Sease on 12/13/15.
//
//

#import "NSString+Validation.h"
#import "NSString+Helpers.h"

@implementation NSString (Validation)

-(BOOL)isBlank
{
    if (self == nil) return TRUE;
    if ([self isEqual:[NSNull null]]) return TRUE;
    if ([self stringByStrippingWhitespace].length <= 0) return TRUE;
    return FALSE;
}

-(BOOL)isValidEmail
{
    return [self isValidEmail:NO];
}

-(BOOL)isValidEmail:(BOOL)laxValidation
{
    BOOL stricterFilter = !laxValidation; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

-(BOOL)isDigitOfLength:(NSInteger)length
{
    if(self.integerValue == 0)
    {
        return NO;
    }
    
    if(self.length != length)
    {
        return NO;
    }
    return YES;
}

+ (BOOL)isValidAlphanumbericChars: (NSString *)textString
{
    
    NSMutableCharacterSet *_alnum = [NSMutableCharacterSet characterSetWithCharactersInString:@"_"];
    [_alnum formUnionWithCharacterSet:[NSCharacterSet alphanumericCharacterSet]];
    
    BOOL valid = [[textString stringByTrimmingCharactersInSet:_alnum] isEqualToString:@""];
    
    return valid;
}


@end
