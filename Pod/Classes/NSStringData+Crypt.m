#import "NSStringData+Crypt.h"
#import <CommonCrypto/CommonCryptor.h>
#import <CommonCrypto/CommonDigest.h>

@implementation NSData(Crypt)


-(NSString*)toBase64
{
    NSData * theData = self;
    
    const uint8_t* input = (const uint8_t*)[theData bytes];
    NSInteger length = [theData length];
        
    static char table[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
        
    NSMutableData* data = [NSMutableData dataWithLength:((length + 2) / 3) * 4];
    uint8_t* output = (uint8_t*)data.mutableBytes;
        
    NSInteger i,i2;
    for (i=0; i < length; i += 3) {
        NSInteger value = 0;
        for (i2=0; i2<3; i2++) {
            value <<= 8;
            if (i+i2 < length) {
                value |= (0xFF & input[i+i2]);
            }
        }
        
        NSInteger theIndex = (i / 3) * 4;
        output[theIndex + 0] =                    table[(value >> 18) & 0x3F];
        output[theIndex + 1] =                    table[(value >> 12) & 0x3F];
        output[theIndex + 2] = (i + 1) < length ? table[(value >> 6)  & 0x3F] : '=';
        output[theIndex + 3] = (i + 2) < length ? table[(value >> 0)  & 0x3F] : '=';
    }
    
    return [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding] ;

}

-(NSData *) aesEncryptedDataWithKey:(NSData *) key {
    unsigned char               *buffer = nil;
    size_t                      bufferSize = 0;
    CCCryptorStatus             err;
    NSUInteger                  i, keyLength = 0, plainTextLength;
    
    // make sure there's data to encrypt
    err = ( plainTextLength = [self length] ) == 0;
    
    // pass the user's passphrase through SHA256 to obtain 32 bytes
    // of key data.  Use all 32 bytes for an AES256 key or just the
    // first 16 for AES128.
    if ( ! err ) {
        switch ( ( keyLength = [key length] ) ) {
            case kCCKeySizeAES128:
            case kCCKeySizeAES256:                      break;
                
                // invalid key size
            default:                    err = 1;        break;
        }
    }
    
    // create an output buffer with room for pad bytes
    if ( ! err ) {
        bufferSize = kCCBlockSizeAES128 + plainTextLength + kCCBlockSizeAES128;     // iv + cipher + padding
        
        err = ! ( buffer = (unsigned char *) malloc( bufferSize ) );
    }
    
    // encrypt the data
    if ( ! err ) {
        srandomdev();
        
        // generate a random iv and prepend it to the output buffer.  the
        // decryptor needs to be aware of this.
        for ( i = 0; i < kCCBlockSizeAES128; ++i ) buffer[ i ] = random() & 0xff;
        
        err = CCCrypt( kCCEncrypt, kCCAlgorithmAES128, kCCOptionPKCS7Padding,
                      [key bytes], keyLength, buffer, [self bytes], plainTextLength,
                      buffer + kCCBlockSizeAES128, bufferSize - kCCBlockSizeAES128, &bufferSize );
    }
    
    if ( err ) {
        if ( buffer ) free( buffer );
        
        return nil;
    }
    
    // dataWithBytesNoCopy takes ownership of buffer and will free() it
    // when the NSData object that owns it is released.
    return [NSData dataWithBytesNoCopy: buffer length: bufferSize + kCCBlockSizeAES128];
}


@end

@implementation NSString(Crypt)
- (NSData *) sha256 {
    unsigned char               *buffer;
    
    if ( ! ( buffer = (unsigned char *) malloc( CC_SHA256_DIGEST_LENGTH ) ) ) return nil;
    
    CC_SHA256( [self UTF8String], (CC_LONG)[self lengthOfBytesUsingEncoding: NSUTF8StringEncoding], buffer );
    
    return [NSData dataWithBytesNoCopy: buffer length: CC_SHA256_DIGEST_LENGTH];
}

- (NSString*)sha256String
{
    const char* str = [self UTF8String];
    unsigned char result[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(str, (CC_LONG)strlen(str), result);
    
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH*2];
    for(int i = 0; i<CC_SHA256_DIGEST_LENGTH; i++)
    {
        [ret appendFormat:@"%02x",result[i]];
    }
    return ret;
}

- (NSString *) stringFromMD5{
    
    if(self == nil || [self length] == 0)
        return nil;
    
    const char *value = [self UTF8String];
    
    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(value, (CC_LONG)strlen(value), outputBuffer);
    
    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++){
        [outputString appendFormat:@"%02x",outputBuffer[count]];
    }
    
    return outputString;
}

-(NSString*)encryptWithKey:(NSString*)key
{
    NSData *data = [NSData dataWithData:[self dataUsingEncoding:NSUTF8StringEncoding]];
    NSData * keyData = [NSData dataWithBytes: [[key sha256] bytes] length: kCCKeySizeAES128];
    NSData * encrypted = [data aesEncryptedDataWithKey:keyData];
    NSString * encodedString = [encrypted toBase64];
    if(encodedString == nil)
    {
        encodedString = @"";
    }
    return encodedString;
}

@end