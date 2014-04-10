//
//  UIViewController+HUD.h
//  iChrono365
//
//  Created by 刘平伟 on 14-1-14.
//  Copyright (c) 2014年 刘平伟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface NSObject (HUD)

-(void)showHUDInWindowWithText:(NSString *)text;
-(void)disMissHUDWithText:(NSString *)text afterDelay:(NSTimeInterval)inteval;

-(void)showHUDInWindowJustWithText:(NSString *)text;
-(void)showHUDInWindowJustWithText:(NSString *)text disMissAfterDelay:(NSTimeInterval)interval;

-(void)showHUDInView:(UIView *)view WithText:(NSString *)text;
-(void)showHUDInView:(UIView *)view WithText:(NSString *)text dismissAfterDelay:(NSTimeInterval)interval;
-(void)showHUDInView:(UIView *)view justWithText:(NSString *)text;
-(void)showHUDInView:(UIView *)view justWithText:(NSString *)text disMissAfterDelay:(NSTimeInterval)interval;

-(void)showHUDWithCustomView:(UIView *)customView inView:(UIView *)view;

@end
