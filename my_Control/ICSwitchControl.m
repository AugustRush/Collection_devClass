//
//  ICSwitchControl.m
//  Test XCTest
//
//  Created by 刘平伟 on 14-5-9.
//  Copyright (c) 2014年 刘平伟. All rights reserved.
//

#import "ICSwitchControl.h"

@interface ICSwitchControl ()

@property (nonatomic, copy) ICSwitchControlCompleteSelectedBlock completeSelectedBlock;
@property (nonatomic, retain) NSMutableDictionary *StateColorDict;

@end

@implementation ICSwitchControl
{
    UILabel *_leftTL;
    UILabel *_rightTL;
    UIView *_DOT;
}

-(id)init
{
    return [self initWithFrame:CGRectZero];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initConfig];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initConfig];
    }
    return self;
}

-(void)initConfig
{
    //    self.backgroundColor = [UIColor blackColor];
    
    UILabel *leftL = [[UILabel alloc] init];
    leftL.backgroundColor = [UIColor clearColor];
    leftL.textColor = [UIColor whiteColor];
    leftL.textAlignment = 1;
    [self addSubview:leftL];
    _leftTL = leftL;
    
    UILabel *rightL = [[UILabel alloc] init];
    rightL.backgroundColor = [UIColor clearColor];
    rightL.textColor = [UIColor whiteColor];
    rightL.textAlignment = 1;
    [self addSubview:rightL];
    _rightTL = rightL;
    
    _DOT = [[UIView alloc] init];
    _DOT.backgroundColor = [UIColor redColor];
    _DOT.layer.borderColor = [UIColor clearColor].CGColor;
    _DOT.layer.borderWidth = 2;
    [self addSubview:_DOT];

    _isOn = NO;
    self.currentState = ICSwitchControlStateOff;
    self.style = ICSwitchControlStyleDefault;
    self.StateColorDict = [NSMutableDictionary dictionary];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
//    self.layer.cornerRadius = CGRectGetHeight(self.frame)/2;
    _leftTL.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame));
    _rightTL.frame = CGRectMake(CGRectGetWidth(self.frame)/2, 0, CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame));
    _leftTL.font = [UIFont systemFontOfSize:CGRectGetHeight(self.frame)/3];
    _rightTL.font = [UIFont systemFontOfSize:CGRectGetHeight(self.frame)/3];
    _DOT.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame));
    _DOT.transform = CGAffineTransformMakeScale(.92, .92);
}

-(void)setStyle:(ICSwitchControlStyle)style
{
    _style = style;

    switch (_style) {
        case ICSwitchControlStyleDefault:
            _DOT.layer.cornerRadius = 0;
            self.layer.cornerRadius = 0;
            break;
        case ICSwitchControlStyleRoundCorner:
            _DOT.layer.cornerRadius = CGRectGetHeight(self.frame)/2;
            self.layer.cornerRadius = CGRectGetHeight(self.frame)/2;

            break;
            
        default:
            break;
    }
}

-(void)setBackgroundColor:(UIColor *)backgroundColor
{
    [self setBackgroundColor:backgroundColor forState:ICSwitchControlStateOn];
    [self setBackgroundColor:backgroundColor forState:ICSwitchControlStateOff];
    [self setBackgroundColor:backgroundColor forState:ICSwitchControlStateHightlight];
}

-(void)setBackgroundColor:(UIColor *)backgroundColor forState:(ICSwitchControlState)state
{
    [self.StateColorDict setObject:backgroundColor forKey:@(state)];
    [self setCurrentState:_currentState];
}

-(void)setCurrentState:(ICSwitchControlState)currentState
{
    _currentState = currentState;
    
    [UIView animateWithDuration:.3 animations:^{
       self.layer.backgroundColor = self.StateColorDict[@(currentState)] ? [self.StateColorDict[@(currentState)] CGColor] : NULL;
    }];
}

-(void)setIsOn:(BOOL)isOn
{
    _isOn = isOn;
    self.currentState = isOn ? ICSwitchControlStateOn:ICSwitchControlStateOff;
    [UIView animateWithDuration:0.1
                     animations:^{
                         _DOT.center = self.isOn ? CGPointMake(CGRectGetWidth(self.frame)/4*3, CGRectGetHeight(self.frame)/2):CGPointMake(CGRectGetWidth(self.frame)/4, CGRectGetHeight(self.frame)/2);
                     } completion:^(BOOL finished) {
                         self.completeSelectedBlock ? self.completeSelectedBlock(self):NULL;
                     }];

}

-(void)setPannelColor:(UIColor *)pannelColor
{
    _pannelColor = pannelColor;
    _DOT.backgroundColor = _pannelColor;
}

-(void)setTitleColor:(UIColor *)titleColor
{
    _titleColor = titleColor;
    _leftTL.textColor = titleColor;
    _rightTL.textColor = titleColor;
}

-(void)setCompleteSelectedBlock:(ICSwitchControlCompleteSelectedBlock)completeSelectedBlock
{
    _completeSelectedBlock = completeSelectedBlock;
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint p = [[touches anyObject] locationInView:self];
    if (p.x - CGRectGetWidth(_DOT.frame)/2 >= 0 && (p.x + CGRectGetWidth(_DOT.frame)/2 <= CGRectGetWidth(self.frame))) {
        _DOT.center = CGPointMake(p.x, CGRectGetHeight(self.frame)/2);
    }
    self.currentState = ICSwitchControlStateHightlight;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint p = [[touches anyObject] locationInView:self];
    
    self.isOn = p.x > CGRectGetWidth(self.frame)/2 ? YES:NO;
}

-(void)setLeftTitle:(NSString *)left RightTitle:(NSString *)right
{
    _leftTitle = left;
    _rightTitle = right;
    _leftTL.text = left;
    _rightTL.text = right;
}

@end
