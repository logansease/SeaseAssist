//
//  HTTPRequestService.h
//  PartySpots
//
//  Created by lsease on 7/9/13.
//  Copyright (c) 2013 iParty Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kHttpRequestFormatJson      @"Application/Json"

@interface HTTPRequest : NSObject


+(void)jsonRequestToUrl:(NSString*)urlString withMethod:(NSString*)method withHeaders:(NSDictionary*)headers withParams:(NSDictionary*)params withHandler:(void (^)(NSString* response,NSError * error))handler;


+(void)httpRequestToUrl:(NSString*)urlString  withMethod:(NSString*)method withHeaders:(NSDictionary*)headers withParams:(NSDictionary*)params withHandler:(void (^)(NSString* response,NSError * error))handler;

+(void)customRequest:(NSString*)requestType withData:(NSData*)data toUrl:(NSString*)url withHeaders:(NSDictionary*)headers withHandler:(void (^)(NSString* response,NSError * error))handler;

+(NSString*)addParameters:(NSDictionary*)urlParams toUrl:(NSString*)url;

+(void)sendRequest:(NSMutableURLRequest*)request withHeaders:(NSDictionary*)headers withHandler:(void (^)(NSString* response,NSError * error))handler;

@end

