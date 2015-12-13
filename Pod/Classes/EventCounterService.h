//
//  EventCounterService.h
//  CatchPhrase
//
//  Created by lsease on 4/15/13.
//
//

#import <Foundation/Foundation.h>

@interface EventCounterService : NSObject

+(NSUInteger)addCountForEvent:(NSString*)event count:(NSInteger)add;
+(NSUInteger)addCountForEvent:(NSString*)event;
+(void)resetCountForEvent:(NSString*)event;
+(NSUInteger)checkCountForEvent:(NSString*)event;
+(NSUInteger)checkDailyEventCount:(NSString*)dailyEvent;
+(NSUInteger)addDailyEventCount:(NSString*)dailyEvent;
+(NSUInteger)addCountForDailyEvent:(NSString*)dailyEvent count:(NSInteger)count;
@end
