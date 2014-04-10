//
//  NSString+SLExt.h
//  BodyScaleProduction
//
//  Created by Go Salo on 14-3-20.
//  Copyright (c) 2014年 Go Salo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SLExt)

- (NSString *)md5String;

// 加密方法
+ (NSString*)encrypt:(NSString*)plainText;

// 解密方法
+ (NSString*)decrypt:(NSString*)encryptText;

@end
