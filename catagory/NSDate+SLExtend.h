//
//  NSDate+SLExtend.h
//  schoolfellow
//
//  Created by EasyitsApp on 14-1-4.
//  Copyright (c) 2014年 www.easyits.net. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (SLExtend)

// 判断是否是本周更早
- (BOOL)isThisWeekEarlier;
// 判断是否是本周晚些
- (BOOL)isThisWeekLater;
// 判断是否是下一周或者更远
- (BOOL)isNextWeekOrLater;
// 判断是否是上一周或者更早
- (BOOL)isLastWeekOrEarlier;
// 判断是否是昨天或更早
- (BOOL)isYesterdayOrEarlier;
// 判断是否是明天或更晚
- (BOOL)isTomorrowOrLater;
// 判断是否是前天
- (BOOL)isTheDayBeforeYesterday;
// 判断是否是昨天
- (BOOL)isYesterDay;
// 判断是否是今天
- (BOOL)isToday;
// 判断是否是明天
- (BOOL)isTomorrow;
// 判断是否是后天
- (BOOL)isTheDayAfterTomorrow;

// 转换成年月日（其他补0）
- (NSDate *)convertDefinitionToDate;
// 转换标准时间
- (NSString *)convertToStandardDateFormat;
// 转换本星期标准时间
- (NSString *)convertToStandardThisWeekDateFormat;
// 转换成标准前天、昨天、今天、明天、后天时间
- (NSString *)convertToStandardRecentlyDateFormat;
// 转换成时间
- (NSString *)convertToStandardTimeDateFormat;
// 转换成标准时间（不带星期）
- (NSString *)convertToStandardNormalDateFormat;
// 转换成YYYY-MM-DD HH:MM:SS格式时间
- (NSString *)convertToStandardYYYYMMDDHHMMSSDateFormat;
// 转换成YYYY-MM-DD
- (NSString *)convertToStandardYYYYMMDDDateFormat;
// 转换成YYYYMMDDHHMMSS
- (NSString *)convertToYYYYMMDDHHMMSSDateFormat;

// 指定日期是星期几，1表示一周的第一天周日
+ (NSInteger)weekdayByDate:(NSDate *)date;
+ (NSString *)weekdayInChineseByDate:(NSDate *)date;

// 指定时间往前推多少天
+ (NSDate *)dateWithDays:(NSUInteger)days beforDate:(NSDate *)date;
+ (NSDate *)dateWithDays:(NSUInteger)days afterDate:(NSDate *)date;

// 获取某个时间点前多少天的总集合
+ (NSArray *)dayNamesAtDays:(NSInteger)days beforDate:(NSDate *)date;

// 获取年
+ (NSInteger)yearByDate:(NSDate *)date;

// 获取月
+ (NSInteger)monthByDate:(NSDate *)date;

// 获取日
+ (NSInteger)dayByDate:(NSDate *)date;

// 该日期处于一年中的第几周
+ (NSInteger)weekOfYearByDate:(NSDate *)date;

//获取当前的时间HH:mm
+ (NSString *)getCurrentDateHHMM;

// 该月有多少天
+ (NSUInteger)daysInMonthByDate:(NSDate *)date;

+ (NSString *)convertToyyyMMddHHmmssString:(NSDate *)date;




@end
