//
//  EventCounterService.m
//  CatchPhrase
//
//  Created by lsease on 4/15/13.
//
//
#define kEventPrefPrefix     @"Event_"
#define kEventDateSuffix     @"_Date"


#import "EventCounterService.h"

@implementation EventCounterService


+(NSUInteger)addCountForEvent:(NSString*)event count:(NSInteger)add
{
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    NSUInteger count = [defaults integerForKey:[NSString stringWithFormat:@"%@%@",kEventPrefPrefix,event]];
    count = count + add;
    [defaults setInteger:count forKey:[NSString stringWithFormat:@"%@%@",kEventPrefPrefix,event]];
    [defaults synchronize];
    return count;
}

+(NSUInteger)addCountForEvent:(NSString*)event
{
    return [self addCountForEvent:event count:1];
}

+(void)resetCountForEvent:(NSString*)event
{
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:0 forKey:[NSString stringWithFormat:@"%@%@",kEventPrefPrefix,event]];
    [defaults synchronize];
}
+(NSUInteger)checkCountForEvent:(NSString*)event
{
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    NSUInteger count = [defaults integerForKey:[NSString stringWithFormat:@"%@%@",kEventPrefPrefix,event]];
    return count;
}
+(NSUInteger)checkDailyEventCount:(NSString*)dailyEvent
{
    NSDate * date = [NSDate date];
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"MMddyyyy"];
    NSString * dateString = [formatter stringFromDate:date];
    
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    NSString * dateKey = [NSString stringWithFormat:@"%@%@%@",kEventPrefPrefix,dailyEvent,kEventDateSuffix];
    NSString * countDate = [defaults stringForKey:dateKey];
    if(![countDate isEqualToString:dateString])
    {
        [defaults setObject:dateString forKey:dateKey];
        [self resetCountForEvent:dailyEvent];
        return 0;
    }
    else{
        return [self checkCountForEvent:dailyEvent];
    }
    
}
+(NSUInteger)addDailyEventCount:(NSString*)dailyEvent
{
    return [self addCountForDailyEvent:dailyEvent count:1];
}

+(NSUInteger)addCountForDailyEvent:(NSString*)dailyEvent count:(NSInteger)count
{
    [self checkDailyEventCount:dailyEvent];
    return [self addCountForEvent:dailyEvent count:count];
}


@end
