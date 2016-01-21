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

+(void)customRequest:(NSString*)requestType withData:(NSData*)data toUrl:(NSString*)url withHeaders:(NSDictionary*)headers withHandler:(void (^)(NSString* response,NSError * error))handler
{
    
    // Make a request...
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:120.0];
    
    // Add Content-Length header if your server needs it
    unsigned long long postLength = data.length;
    NSString *contentLength = [NSString stringWithFormat:@"%llu", postLength];
    [request addValue:contentLength forHTTPHeaderField:@"Content-Length"];
    
    // This should all look familiar...
    [request setHTTPMethod:requestType];
    [request setHTTPBody:data];
    
    
    [self sendRequest:request withHeaders:headers withHandler:handler];
    
}

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
    if(![headers objectForKey:@"Content-Type"])
    {
        [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    }
    
    //set Parameters
    NSString *postString = [params toJsonString];
    [request setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
    
    [self sendRequest:request withHeaders:headers withHandler:handler];
    
}

+(void)httpRequestToUrl:(NSString*)urlString  withMethod:(NSString*)method withHeaders:(NSDictionary*)headers withParams:(NSDictionary*)params withHandler:(void (^)(NSString* response,NSError * error))handler

{
    //if this is a json request, then call the json method
    if([[headers objectForKey:@"Content-Type"] isEqualToString:@"application/json"])
    {
        [self jsonRequestToUrl:urlString withMethod:method withHeaders:headers withParams:params withHandler:handler];
        return;
    }
    
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
        [request addValue:[headers valueForKey:key] forHTTPHeaderField:key];
    }
    
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        //parse our result, ensuring that we return an error if a 200 was not returned from the API
        
        // This will Fetch the status code from NSHTTPURLResponse object
        NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
        NSInteger responseStatusCode = [httpResponse statusCode];
        
        NSString * resultString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        if(responseStatusCode == 200)
        {
            handler(resultString, error);
        }
        else if(error)
        {
            handler(resultString,error);
        }
        else{
            NSString * errorString = [NSString stringWithFormat:@"Error Response\n%@",resultString];
            handler(resultString,[NSError errorWithDomain:@"HTTPRequest" code:responseStatusCode userInfo:@{@"error" : errorString}]);
        }
        
    }]resume];
    
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
        
        id value = [urlParams objectForKey:key];
        if([value isKindOfClass:[NSString class]])
        {
            value = [value stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        }
        
        [result appendFormat:@"%@=%@",key,value];
        
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
