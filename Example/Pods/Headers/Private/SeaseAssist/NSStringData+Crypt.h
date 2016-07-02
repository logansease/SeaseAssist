#import <Foundation/Foundation.h>

@interface NSData (Crypt)

-(NSData *) aesEncryptedDataWithKey:(NSData *) key;
-(NSString*)toBase64;
@end

@interface NSString (Crypt)

- (NSData *) sha256;
- (NSString *) stringFromMD5;
-(NSString*)encryptWithKey:(NSString*)key;
-(NSString*)sha256String;

@end