//
//  Utility.h
//  BodyScale
//
//  Created by Jerry Yu on 13-12-24.
//  Copyright (c) 2013年 于菲. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utility : NSObject

+(NSString*)getAppname;
+(NSString*)getAppVersion;
+(NSString*)getMacAddress;
+(NSString*)getModelOwnerName;
+(NSString*)getSystemName;
+(NSString*)getSystemVersion;
+(NSString*)getModelType;
+(NSString*)getLocalizedModel;
+(NSString*)getLanguage;
//+(NSString *)MD516:(NSString *)str;
//+(NSString *)MD532:(NSString *)str;
+(NSMutableArray*)splitString:(NSString*)str splitchar:(NSString*)splitchar;
+(UILabel*)createUILabelWithRect:(CGRect)rect text:(NSString*)text fontsize:(float)fontsize textAlignment:(NSTextAlignment)textAlignment textcolor:(UIColor*)textcolor;
+(int)getRandomInt:(int)maxInt;
+(NSString*)substring:(NSString*)str nstart:(int)nstart len:(int)len;
+(int)indexOfString:(NSString*)str substr:(NSString*)substr;
+(int)hexToDec:(NSString *)s;

@end
