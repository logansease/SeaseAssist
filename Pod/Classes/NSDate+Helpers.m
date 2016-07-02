//
//  NSDate+Helpers.m
//  Pods
//
//  Created by Logan Sease on 12/13/15.
//
//

#import "NSDate+Helpers.h"

@implementation NSDate (Helpers)


-(NSDate*)beginningOfWeek
{
    NSDate * dateInWeek = self;
    
    NSCalendar *gregorian = [NSCalendar currentCalendar];
    [gregorian setFirstWeekday:2];
    
    // Get the weekday component of the current date
    NSDateComponents *weekdayComponents = [gregorian components:NSCalendarUnitWeekday fromDate:dateInWeek];
    
    /*
     Create a date components to represent the number of days to subtract
     from the current date.
     The weekday value for Sunday in the Gregorian calendar is 1, so
     subtract 1 from the number
     of days to subtract from the date in question.  (If today's Sunday,
     subtract 0 days.)
     */
    NSDateComponents *componentsToSubtract = [[NSDateComponents alloc] init];
    /* Substract [gregorian firstWeekday] to handle first day of the week being something else than Sunday */
    [componentsToSubtract setDay: - ([weekdayComponents weekday] - [gregorian firstWeekday])];
    NSDate *beginningOfWeek = [gregorian dateByAddingComponents:componentsToSubtract toDate:dateInWeek options:0];
    
    /*
     Optional step:
     beginningOfWeek now has the same hour, minute, and second as the
     original date (today).
     To normalize to midnight, extract the year, month, and day components
     and create a new date from those components.
     */
    NSDateComponents *components = [gregorian components: (NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay)
                                                fromDate: beginningOfWeek];
    beginningOfWeek = [gregorian dateFromComponents: components];
    
    return beginningOfWeek;
}

-(NSDate*)endOfWeek
{
    
    NSDate * beginningOfWeek = [self beginningOfWeek];
    NSDate *endOfWeek = [beginningOfWeek dateByAddingTimeInterval:60 * 60 * 24 * 7];
    
    return endOfWeek;
}

-(NSDate*)beginningOfMonth
{
    NSDate * date = self;
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comp = [gregorian components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    [comp setDay:1];
    return [gregorian dateFromComponents:comp];
}

-(NSDate*)endOfMonth
{
    NSDate * date = self;
    
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* comps = [calendar components:NSCalendarUnitMonth | NSCalendarUnitYear fromDate:date]; // Get necessary date components
    
    // set last of month
    [comps setYear:[comps year]];
    [comps setMonth:[comps month]+1];
    [comps setDay:0];
    return [calendar dateFromComponents:comps];
}

-(NSDate*)beginningOfYear
{
    NSDate * date = self;
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comp = [gregorian components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    [comp setDay:1];
    [comp setMonth:1];
    return [gregorian dateFromComponents:comp];
}

-(NSDate*)endOfYear
{
    NSDate * date = self;
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comp = [gregorian components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    [comp setDay:31];
    [comp setMonth:12];
    return [gregorian dateFromComponents:comp];
}


-(NSString*)dateToStringWithFormat:(NSString*)format
{
    NSDate * date = self;
    
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    if(format == nil)
    {
        format = @"MM/dd/yyyy";
    }

    [formatter setDateFormat:format];
    NSString * result = [formatter stringFromDate: date];
    return result;
}

-(NSDate*)dateWithoutTime
{
    NSDate * date = self;
    
    unsigned int flags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* components = [calendar components:flags fromDate:date];
    NSDate* dateOnly = [calendar dateFromComponents:components];
    return dateOnly;
}
-(NSDate*)dateAtEndOfDay
{
    NSDate * date = self;
    NSDate * day = [date dateWithoutTime];
    return [day dateByAddingTimeInterval:60 * 60 * 24 - 1];
}

-(BOOL)isOnBeforeOrToday
{
    NSDate * date = self;
    NSDate * strippedDate = [date dateWithoutTime];
    NSDate * strippedToday = [[NSDate date] dateWithoutTime];
    
    if ([strippedDate compare:strippedToday] == NSOrderedDescending) {
        return NO;
    } //else if ([date1 compare:date2] == NSOrderedAscending) {
    //    NSLog(@"date1 is earlier than date2");
    //} else {
    //    NSLog(@"dates are the same");
    //}
    return YES;
}

-(BOOL)isToday
{
    
    NSDate * todayDate = [[NSDate date] dateWithoutTime];
    NSDate * compareDate = [self dateWithoutTime];
    return [todayDate isEqualToDate:compareDate];
}

-(BOOL)isBeforeToday
{
    NSDate * strippedDate = [self dateWithoutTime];
    NSDate * strippedToday = [[NSDate date] dateWithoutTime];
    
    if ([strippedDate compare:strippedToday] == NSOrderedAscending) {
        return YES;
    }
    return NO;
}

-(NSDate*)dateByAdvancingMonths:(NSInteger)monthCount;
{
    NSDate *today = self;
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.month = monthCount;
    NSDate *nextMonth = [gregorian dateByAddingComponents:components toDate:today options:0];
    
    NSDateComponents *nextMonthComponents = [gregorian components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:nextMonth];
    
    NSDateComponents *todayDayComponents = [gregorian components:NSCalendarUnitDay fromDate:today];
    
    nextMonthComponents.day = todayDayComponents.day;
    return [gregorian dateFromComponents:nextMonthComponents];
    
}

-(BOOL)isAfterDate:(NSDate*)secondDate
{
    
    if ([self compare:secondDate] == NSOrderedDescending) {
        return YES;
    }
    
    return NO;
}
-(BOOL)isBeforeDate:(NSDate*)secondDate
{
    if ([self compare:secondDate] == NSOrderedAscending) {
        return YES;
    }
    return NO;
}

-(BOOL)isBetween:(NSDate*)startDate and:(NSDate*)endDate
{
    NSDate * checkDate = self;
    return ([endDate isBeforeDate:checkDate] && [startDate isAfterDate:checkDate]);
}
-(NSDate*)dateWithCurrentYear
{
    NSDate * date= self;
    
    //gather current calendar
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    //gather date components from date
    NSDateComponents *dateComponents = [calendar components:(NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitDay | NSCalendarUnitMonth ) fromDate:date];
    
    NSDateComponents *thisYearComponents = [calendar components:(NSCalendarUnitYear ) fromDate:[NSDate date]];
    
    //set date components
    [dateComponents setHour:dateComponents.hour];
    [dateComponents setMinute:dateComponents.minute];
    [dateComponents setSecond:dateComponents.second];
    [dateComponents setDay:dateComponents.day];
    [dateComponents setMonth:dateComponents.month];
    [dateComponents setYear:thisYearComponents.year];
    
    //save date relative from date
    return [calendar dateFromComponents:dateComponents];
}

-(NSDate*)timeValue
{
    NSDate * date= self;
    
    //gather current calendar
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    //gather date components from date
    NSDateComponents *dateComponents = [calendar components:(NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond ) fromDate:date];
    
    //set date components
    [dateComponents setHour:dateComponents.hour];
    [dateComponents setMinute:dateComponents.minute];
    [dateComponents setSecond:dateComponents.second];
    
    //save date relative from date
    return [calendar dateFromComponents:dateComponents];
}



@end
