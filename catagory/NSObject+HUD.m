//
//  UIViewController+HUD.m
//  iChrono365
//
//  Created by 刘平伟 on 14-1-14.
//  Copyright (c) 2014年 刘平伟. All rights reserved.
//

#import "NSObject+HUD.h"

MBProgressHUD *__HUD = nil;

#define KeyWindow     [[UIApplication sharedApplication] keyWindow]

@implementation NSObject (HUD)

-(void)showHUDInWindowWithText:(NSString *)text
{
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithWindow:KeyWindow];
    HUD.removeFromSuperViewOnHide = YES;
    [KeyWindow addSubview:HUD];
    __HUD = HUD;
    if (text) {
        __HUD.labelText = text;
    }
    [__HUD show:YES];
}

-(void)disMissHUDWithText:(NSString *)text afterDelay:(NSTimeInterval)inteval
{
    if (text) {
        __HUD.labelText = text;
    }
    [__HUD hide:YES afterDelay:inteval];
}

-(void)showHUDInWindowJustWithText:(NSString *)text
{
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithWindow:KeyWindow];
    HUD.removeFromSuperViewOnHide = YES;
    HUD.customView = [[UILabel alloc] init];
    HUD.removeFromSuperViewOnHide = YES;
    HUD.mode = MBProgressHUDModeCustomView;
    [KeyWindow addSubview:HUD];
    __HUD = HUD;
    if (text) {
        __HUD.labelText = text;
    }
    [__HUD show:YES];
}

-(void)showHUDInWindowJustWithText:(NSString *)text disMissAfterDelay:(NSTimeInterval)interval
{
    [self showHUDInWindowJustWithText:text];
    [self disMissHUDWithText:nil afterDelay:interval];
}

-(void)showHUDInView:(UIView *)view WithText:(NSString *)text
{
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:view];
    HUD.removeFromSuperViewOnHide = YES;
    [view addSubview:HUD];
    __HUD = HUD;
    if (text) {
        __HUD.labelText = text;
    }
    [__HUD show:YES];
}

-(void)showHUDInView:(UIView *)view WithText:(NSString *)text dismissAfterDelay:(NSTimeInterval)interval
{
    [self showHUDInView:view WithText:text];
    [self disMissHUDWithText:nil afterDelay:interval];
}

-(void)showHUDInView:(UIView *)view justWithText:(NSString *)text
{
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:view];
    HUD.removeFromSuperViewOnHide = YES;
    HUD.customView = [[UILabel alloc] init];
    HUD.mode = MBProgressHUDModeCustomView;
    HUD.removeFromSuperViewOnHide = YES;
    [view addSubview:HUD];
    __HUD = HUD;
    if (text) {
        __HUD.labelText = text;
    }
    [__HUD show:YES];
}

-(void)showHUDInView:(UIView *)view justWithText:(NSString *)text disMissAfterDelay:(NSTimeInterval)interval
{
    [self showHUDInView:view justWithText:text];
    [self disMissHUDWithText:nil afterDelay:interval];
}

-(void)showHUDWithCustomView:(UIView *)customView inView:(UIView *)view
{
//    CGRect frame = [[UIScreen mainScreen] applicationFrame];
    CGRect frame = view.bounds;
//    customView.alpha = .3;
    customView.center = CGPointMake(CGRectGetWidth(frame)/2, CGRectGetHeight(frame)/2);
    [view addSubview:customView];
    view.userInteractionEnabled = NO;
    [UIView animateKeyframesWithDuration:.3
                                   delay:2
                                 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
                                     customView.alpha = 0.0;
    } completion:^(BOOL finished) {
        view.userInteractionEnabled = YES;
        [customView removeFromSuperview];
    }];
    
}

@end
