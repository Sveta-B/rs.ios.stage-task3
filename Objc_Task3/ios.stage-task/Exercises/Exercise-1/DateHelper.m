#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
        
        NSString *result = @"";
        
    typedef NS_ENUM(NSInteger, NumberOfMonth ) {
        January = 1,
        February,
        March,
        April,
        May,
        June,
        July,
        August,
        September,
        October,
        November,
        December
    };
        NumberOfMonth month = monthNumber;
        
        switch (month) {
            case January:
                result = @"January";
                break;
            case February:
                result = @"February";
                break;
            case March:
                result = @"March";
                break;
            case April:
                result = @"April";
                break;
            case May:
                result = @"May";
                break;
            case June:
                result = @"June";
                break;
            case July:
                result = @"July";
                break;
            case August:
                result = @"August";
                break;
            case September:
                result = @"September";
                break;
            case October:
                result = @"October";
                break;
            case November:
                result = @"November";
                break;
            case December:
                result = @"December";
                break;
            default:
                result = nil;
                break;
        }
        return result;
    }
    


#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSDateFormatter *format = [NSDateFormatter new];
    [format setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];
    NSDate *dateFromString = [format dateFromString:date];
    NSDateComponents *dayComponent = [NSDateComponents new];
    NSCalendar *calendar = [NSCalendar currentCalendar];
  dayComponent = [calendar components:NSCalendarUnitDay fromDate:dateFromString];
    long day =  [dayComponent day];
    
    return day;
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    
    NSDateFormatter *format = [NSDateFormatter new];
    format.dateFormat = @"EE";
    format.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
    NSLog(@"%@", [format stringFromDate:date]);
    return [format stringFromDate:date];
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
       NSDateComponents *currentDateComponents = [calendar components:(NSCalendarUnitWeekOfYear | NSCalendarUnitYear) fromDate:[NSDate now]];
       NSDateComponents *dateComponents = [calendar components:(NSCalendarUnitWeekOfYear | NSCalendarUnitYear) fromDate:date];
    return (currentDateComponents.year == dateComponents.year) && (currentDateComponents.weekOfYear == dateComponents.weekOfYear);;
}

@end
