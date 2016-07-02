//
//  NSDictionary+Json.h
//  Pods
//
//  Created by Logan Sease on 12/13/15.
//
//

#import <Foundation/Foundation.h>

@interface NSDictionary (JSON)

-(NSString*)toJsonString;
+(NSDictionary*)fromJsonString:(NSString*)json;

@end

@interface NSArray (JSON)

-(NSString*)toJsonString;
+(NSArray*)fromJsonString:(NSString*)json;

@end
