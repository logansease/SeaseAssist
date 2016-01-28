//
//  NSURL+Helpers.h
//  App
//
//  Created by lsease on 12/25/15.
//  Copyright © 2015 iParty Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (Helpers)
+(NSString *)myDocumentsPathForFile:(NSString*)fileName;
+(NSString *)tempPathForFile:(NSString*)fileName;
@end
