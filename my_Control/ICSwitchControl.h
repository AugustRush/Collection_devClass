//
//  ICSwitchControl.h
//  Test XCTest
//
//  Created by 刘平伟 on 14-5-9.
//  Copyright (c) 2014年 刘平伟. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ICSwitchControlCompleteSelectedBlock)(id sender);

typedef NS_ENUM(NSInteger, ICSwitchControlState) {
    ICSwitchControlStateOn = 0,
    ICSwitchControlStateOff,
    ICSwitchControlStateHightlight,
};

typedef NS_ENUM(NSUInteger, ICSwitchControlStyle) {
    ICSwitchControlStyleDefault,
    ICSwitchControlStyleRoundCorner,
};

@interface ICSwitchControl : UIControl

@property (nonatomic, assign) BOOL isOn;
@property (nonatomic, copy ,readonly) NSString *leftTitle;
@property (nonatomic, copy, readonly) NSString *rightTitle;
@property (nonatomic, assign, readonly) ICSwitchControlState currentState;
@property (nonatomic, assign) ICSwitchControlStyle style;
@property (nonatomic, retain) UIColor *pannelColor;
@property (nonatomic, retain) UIColor *titleColor;


-(void)setCompleteSelectedBlock:(ICSwitchControlCompleteSelectedBlock)completeSelectedBlock;
-(void)setLeftTitle:(NSString *)left RightTitle:(NSString *)right;
-(void)setBackgroundColor:(UIColor *)backgroundColor forState:(ICSwitchControlState)state;

@end
