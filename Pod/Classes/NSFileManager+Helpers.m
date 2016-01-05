//
//  NSURL+Helpers.m
//  App
//
//  Created by lsease on 12/25/15.
//  Copyright © 2015 iParty Mobile. All rights reserved.
//

#import "NSFileManager+Helpers.h"

@implementation NSFileManager (Helpers)
/*
 * this function returns the full path for a file name that is in the documents directory
 * @param filename: the name of the file in the Documents directory
 * @returns the full path of the file in the documents directory
 */
+(NSString *)myDocumentsPathForFile:(NSString*)fileName
{
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * path = [paths objectAtIndex:0];
    return [path stringByAppendingPathComponent:fileName] ;
}

/*
 * this function returns the full path for a file name that is in the user temp directory
 * @param filename: the name of the file in the Documents directory
 * @returns the full path of the file in the documents directory
 */
+(NSString *)tempPathForFile:(NSString*)fileName
{
    
    NSString * result = [NSTemporaryDirectory() stringByAppendingPathComponent:fileName];
    return result;
}

@end
