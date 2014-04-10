//
//  DES3Util.h
//  bluetoothTest
//
//  Created by 刘平伟 on 14-1-10.
//  Copyright (c) 2014年 刘平伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DES3Util : NSObject
// 加密方法
+ (NSString*)encrypt:(NSString*)plainText;

// 解密方法
+ (NSString*)decrypt:(NSString*)encryptText;
@end
