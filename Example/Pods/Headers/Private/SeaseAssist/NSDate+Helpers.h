//
//  NSDate+Helpers.h
//  Pods
//
//  Created by Logan Sease on 12/13/15.
//
//

#import <Foundation/Foundation.h>

@interface NSDate (Helpers)

-(NSDate*)beginningOfWeek;
-(NSDate*)endOfWeek;

-(NSDate*)beginningOfMonth;
-(NSDate*)endOfMonth;

-(NSDate*)beginningOfYear;
-(NSDate*)endOfYear;
-(NSDate*)dateWithCurrentYear;

-(NSString*)dateToStringWithFormat:(NSString*)format;

-(NSDate*)dateAtEndOfDay;
-(NSDate*)dateWithoutTime;
-(NSDate*)timeValue;
-(BOOL)isOnBeforeOrToday;
-(BOOL)isToday;
-(BOOL)isBeforeToday;

-(BOOL)isBetween:(NSDate*)startDate and:(NSDate*)endDate;
-(NSDate*)dateByAdvancingMonths:(NSInteger)monthCount;
-(BOOL)isAfterDate:(NSDate*)secondDate;
-(BOOL)isBeforeDate:(NSDate*)secondDate;


@end
