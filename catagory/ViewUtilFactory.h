//
//  ViewUtilFactory.h
//  BodyScaleProduction
//
//  Created by Go Salo on 14-3-21.
//  Copyright (c) 2014年 Go Salo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ViewUtilFactory : NSObject

+ (void)presentAlertViewWithTitle:(NSString *)title
                          message:(NSString *)message
                         delegate:(id<UIAlertViewDelegate>)delegate
                cancelButtonTitle:(NSString *)cancelButtonTitle
                otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;

+ (void)presentTakePhotoAlertViewWithTarget:(id)target takeAction:(SEL)takeAction localAction:(SEL)localAction;
+ (void)presentAlertViewWithTitle:(NSString *)title sureButtonTitle:(NSString *)sureButtonTitle cancelButtonTitle:(NSString *)cancelButtonTitle target:(id)target sureAction:(SEL)sureAction;

+ (void)presentCustomAlertViewWithTitle:(NSString *)title
                                message:(NSString *)message
                               delegate:(id<UIAlertViewDelegate>)delegate
                      cancelButtonTitle:(NSString *)cancelButtonTitle
                      otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;
@end
