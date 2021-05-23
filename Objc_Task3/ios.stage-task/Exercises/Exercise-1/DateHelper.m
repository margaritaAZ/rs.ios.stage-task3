#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    if (monthNumber < 1 || monthNumber > 12) {
        return nil;
    }
    
    NSDateComponents *dateComponents = [NSDateComponents new];
    [dateComponents setMonth:monthNumber];
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    [dateFormatter setDateFormat:@"MMMM"];
    
    NSDate *date = [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
    
    return [dateFormatter stringFromDate:date];
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"]];
    [dateFormatter setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    
    NSDate *dateFromString = [dateFormatter dateFromString:date];
    if (!dateFromString) {
        return 0;
    }
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    return [calendar component:NSCalendarUnitDay fromDate:dateFromString];
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat: @"E"];
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RUS"];
    
    return [formatter stringFromDate:date];
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSDate *currentDate = [NSDate now];
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    if ([calendar component:NSCalendarUnitYear fromDate:date] != [calendar component:NSCalendarUnitYear fromDate:currentDate]) {
        return NO;
    }
    if ([calendar component:NSCalendarUnitWeekOfYear fromDate:date] == [calendar component:NSCalendarUnitWeekOfYear fromDate:currentDate]) {
        return YES;
    } else {
        return NO;
    }
}

@end
