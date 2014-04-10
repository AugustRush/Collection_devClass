//
//  NSString+SLExt.m
//  BodyScaleProduction
//
//  Created by Go Salo on 14-3-20.
//  Copyright (c) 2014年 Go Salo. All rights reserved.
//

#import "NSString+SLExt.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCrypto.h>
#import "DES3Util.h"

#define gkey            @"894D94361A243577F0A497C4EAB6462A178900022D1D95B2EAE04"
#define gIv             @"01234567"

@implementation NSString (SLExt)

// 加密方法
+ (NSString*)encrypt:(NSString*)plainText {
    return [DES3Util encrypt:plainText];
}

// 解密方法
+ (NSString*)decrypt:(NSString*)encryptText {
    return [DES3Util decrypt:encryptText];
}

- (NSString *)md5String
{
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (int)strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

@end
