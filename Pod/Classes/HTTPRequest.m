//
//  HTTPRequestService.m
//  PartySpots
//
//  Created by lsease on 7/9/13.
//  Copyright (c) 2013 iParty Mobile. All rights reserved.
//

#import "HTTPRequest.h"
#import "NSArrayDictionary+JSON.h"

@implementation HTTPRequest


+(void)jsonRequestToUrl:(NSString*)urlString  withMethod:(NSString*)method withHeaders:(NSDictionary*)headers withParams:(NSDictionary*)params withHandler:(void (^)(NSString* response,NSError * error))handler

{
    //set up the request with the URL
    NSURL * url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:120.0];
    //add the request method. Default to POST
    [request setHTTPMethod:method];
    
    //add the json content type header
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    //set Parameters
    NSString *postString = [params toJsonString];
    [request setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
    
    [self sendRequest:request withHeaders:headers withHandler:handler];
    
}

+(void)httpRequestToUrl:(NSString*)urlString  withMethod:(NSString*)method withHeaders:(NSDictionary*)headers withParams:(NSDictionary*)params withHandler:(void (^)(NSString* response,NSError * error))handler

{
    //set up the request with the URL
    NSURL * url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:120.0];
    //add the request method. Default to POST
    [request setHTTPMethod:method];
    
    //set Parameters
    NSString *postString = [self createPostStringWithParams:params];
    [request setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
    
    [self sendRequest:request withHeaders:headers withHandler:handler];
}


+(void)sendRequest:(NSMutableURLRequest*)request withHeaders:(NSDictionary*)headers withHandler:(void (^)(NSString* response,NSError * error))handler
{
    //ensure a method is set. Default to GET
    if(request.HTTPMethod == nil)
    {
        [request setHTTPMethod:@"GET"];
    }
    
    //add headers
    for(NSString * key in headers.allKeys)
    {
        [request addValue:[key valueForKey:key] forHTTPHeaderField:key];
    }
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        if(handler)
        {
            NSString * resultString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
            handler(resultString, nil);
        }
    }];
}


+(NSString*)addParameters:(NSDictionary*)urlParams toUrl:(NSString*)url
{
    if(urlParams.allKeys.count <= 0)
    {
        return url;
    }
    
    NSMutableString * result = [NSMutableString stringWithString:url];
    
    NSRange paramRange = [result rangeOfString:@"?"];
    if(paramRange.location == NSNotFound)
    {
        [result appendString:@"?"];
    }
    else{
        [result appendString:@"&"];
    }
    
    BOOL isFirst = YES;
    for(NSString * key in urlParams.allKeys)
    {
        if(!isFirst)
        {
            [result appendString:@"&"];
        }
        
        [result appendFormat:@"%@=%@",key,[urlParams objectForKey:key]];
        
        isFirst = NO;
    }
    
    return result;
}

+(NSString*)createPostStringWithParams:(NSDictionary*)params
{
    NSUInteger i=0;
	NSUInteger count = [[params allKeys] count]-1;
    NSMutableString * result = [NSMutableString stringWithString:@""];
    
	for (NSString * key in [params allKeys]) {
        NSString * value = [params objectForKey:key];
        NSString *data = [NSString stringWithFormat:@"%@=%@%@", [self encodeURL:key], [self encodeURL:value],(i<count ?  @"&" : @"")];
		[result appendString:data];
		i++;
	}
    
    return result;

}

+ (NSString*)encodeURL:(NSString *)string
{
	 return [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}


@end
