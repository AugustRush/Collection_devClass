//
//  ViewUtilFactory.m
//  BodyScaleProduction
//
//  Created by Go Salo on 14-3-21.
//  Copyright (c) 2014年 Go Salo. All rights reserved.
//

#import "ViewUtilFactory.h"

@interface WhiteBackgroundView : UIView

@end

@implementation WhiteBackgroundView

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
//{
//    NSLog(@"%s", __FUNCTION__);
//    return self;
//}

- (void)cancelTap:(UITapGestureRecognizer *)tap {
    [self removeFromSuperview];
  
}

@end

@implementation ViewUtilFactory {
    UIView *_alertView; //  确定取消alertview
}

+ (instancetype)sharedInstance {
    static ViewUtilFactory *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[ViewUtilFactory alloc] init];
    });
    
    return _sharedClient;
}

+ (void)presentAlertViewWithTitle:(NSString *)title
                          message:(NSString *)message
                         delegate:(id<UIAlertViewDelegate>)delegate
                cancelButtonTitle:(NSString *)cancelButtonTitle
                otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:delegate
                                          cancelButtonTitle:cancelButtonTitle
                                          otherButtonTitles:otherButtonTitles, nil];
    [alert show];
}

+ (void)presentCustomAlertViewWithTitle:(NSString *)title
                                message:(NSString *)message
                               delegate:(id<UIAlertViewDelegate>)delegate
                      cancelButtonTitle:(NSString *)cancelButtonTitle
                      otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION {
    [[ViewUtilFactory sharedInstance] createCustomAlertViewWithTitle:title message:message delegate:delegate cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles, nil];
}

+ (void)presentTakePhotoAlertViewWithTarget:(id)target takeAction:(SEL)takeAction localAction:(SEL)localAction {
    [[ViewUtilFactory sharedInstance] createTakePhotoAlertViewWithTarget:target takeAction:takeAction localAction:localAction];

}

+ (void)presentAlertViewWithTitle:(NSString *)title sureButtonTitle:(NSString *)sureButtonTitle cancelButtonTitle:(NSString *)cancelButtonTitle target:(id)target sureAction:(SEL)sureAction {
    [[ViewUtilFactory sharedInstance] createAlertViewWithTitle:title sureButtonTitle:sureButtonTitle cancelButtonTitle:cancelButtonTitle target:target sureAction:sureAction];
}

#pragma mark - Private Method
- (void)createAlertViewWithTitle:(NSString *)title sureButtonTitle:(NSString *)sureButtonTitle cancelButtonTitle:(NSString *)cancelButtonTitle target:(id)target sureAction:(SEL)sureAction {
    WhiteBackgroundView *backgroundView = [[WhiteBackgroundView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_HEIGHT, SCREEN_HEIGHT)];
    UIView *whiteView = [[UIView alloc] initWithFrame:CGRectMake(34, (SCREEN_HEIGHT - 158) / 2, 255, 113)];
    whiteView.layer.cornerRadius = 8;
    whiteView.backgroundColor = [UIColor whiteColor];
    backgroundView.backgroundColor = [UIColor clearColor];
    [backgroundView addSubview:whiteView];
    [[[UIApplication sharedApplication] keyWindow] addSubview:backgroundView];
    _alertView = backgroundView;
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 15, whiteView.width, 30)];
    titleLabel.text = title;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:14.0f];
    titleLabel.textColor = [UIColor colorWithWhite:188 / 255.0f alpha:1];
    [whiteView addSubview:titleLabel];
    
    UIButton *sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [sureButton setBackgroundImage:[UIImage imageNamed:@"registerbutton_backgroundimage.png"] forState:UIControlStateNormal];
    [sureButton setFrame:CGRectMake(15, titleLabel.bottom + 15, 109, 31)];
    [sureButton setTitleColor:[UIColor colorWithRed:5 / 255.0f green:138 / 255.0f blue:233 / 255.0f alpha:1] forState:UIControlStateNormal];
    [sureButton setTitle:@"注册" forState:UIControlStateNormal];
    [sureButton addTarget:self action:@selector(cancelButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [sureButton addTarget:target action:sureAction forControlEvents:UIControlEventTouchUpInside];
    [whiteView addSubview:sureButton];
    
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelButton setBackgroundImage:[UIImage imageNamed:@"cancelbutton_backgroundimage.png"] forState:UIControlStateNormal];
    [cancelButton setFrame:CGRectMake(whiteView.width - 15 - 109, titleLabel.bottom + 15, 109, 31)];
    [cancelButton setTitleColor:[UIColor colorWithWhite:188 / 255.0f alpha:1] forState:UIControlStateNormal];
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [whiteView addSubview:cancelButton];
    [cancelButton addTarget:self action:@selector(cancelButtonAction:) forControlEvents:UIControlEventTouchUpInside];

}

- (void)createTakePhotoAlertViewWithTarget:(id)target takeAction:(SEL)takeAction localAction:(SEL)localAction {
    WhiteBackgroundView *alertView = [[WhiteBackgroundView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:alertView action:@selector(cancelTap:)];
    [tap setNumberOfTouchesRequired:1];
    [alertView addGestureRecognizer:tap];
    
    UIView *whiteView = [[UIView alloc] initWithFrame:CGRectMake(15, (SCREEN_HEIGHT - 158) / 2, 290, 158)];
    whiteView.layer.cornerRadius = 8;
    whiteView.backgroundColor = [UIColor whiteColor];
    alertView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
    [alertView addSubview:whiteView];
    
    [[[UIApplication sharedApplication] keyWindow] addSubview:alertView];
    
    UIImage *imageTake = [UIImage imageNamed:@"xiangji_normal.png"];
    UIImage *imageTakeHightlight = [UIImage imageNamed:@"xiangji_hightlight.png"];
    UIImage *imageLocal = [UIImage imageNamed:@"wenjian_normal.png"];
    UIImage *imageLocalHightlight = [UIImage imageNamed:@"wenjian_hightlight.png"];
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:imageTake forState:UIControlStateNormal];
    [leftButton setImage:imageTakeHightlight forState:UIControlStateHighlighted];
    [leftButton setFrame:CGRectMake(40, 40, imageTake.size.width, imageTake.size.height)];
    [leftButton addTarget:target action:takeAction forControlEvents:UIControlEventTouchUpInside];
    [leftButton addTarget:self action:@selector(dismisViewAction:) forControlEvents:UIControlEventTouchUpInside];
    [whiteView addSubview:leftButton];
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:imageLocal forState:UIControlStateNormal];
    [rightButton setImage:imageLocalHightlight forState:UIControlStateHighlighted];
    [rightButton setFrame:CGRectMake(whiteView.frame.size.width - 40 - imageLocal.size.width, 40, imageLocal.size.width, imageLocal.size.height)];
    [rightButton addTarget:self action:@selector(dismisViewAction:) forControlEvents:UIControlEventTouchUpInside];
    [rightButton addTarget:target action:localAction forControlEvents:UIControlEventTouchUpInside];
    [whiteView addSubview:rightButton];
}

- (void)createCustomAlertViewWithTitle:(NSString *)title
                                message:(NSString *)message
                               delegate:(id<UIAlertViewDelegate>)delegate
                      cancelButtonTitle:(NSString *)cancelButtonTitle
                      otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION {
    UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [backgroundView setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.4]];
    [[[UIApplication sharedApplication] keyWindow] addSubview:backgroundView];
    _alertView = backgroundView;
    
    UIView *whiteView = [[UIView alloc] initWithFrame:CGRectMake(15, 142, 290, 190)];
    whiteView.backgroundColor = [UIColor whiteColor];
    whiteView.layer.cornerRadius = 6;
    [backgroundView addSubview:whiteView];
    
    UIImage *image = [UIImage imageNamed:@"default_photo_females.png"];
    UIImageView *photoImageView = [[UIImageView alloc] initWithImage:image];
    [photoImageView setFrame:CGRectMake(15, 15, 59, 59)];
    [whiteView addSubview:photoImageView];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 28, 182, 35)];
    titleLabel.numberOfLines = 2;
    [titleLabel setTextColor:[UIColor colorWithWhite:188 / 255.0f alpha:1]];
    [titleLabel setFont:[UIFont systemFontOfSize:14.0f]];
    titleLabel.text = title;
    [whiteView addSubview:titleLabel];
    
    UILabel *messageLabel = [[UILabel alloc] initWithFrame:CGRectMake(28, 85, 264, 200)];
    messageLabel.numberOfLines = 2;
    [messageLabel setTextColor:[UIColor colorWithWhite:188 / 255.0f alpha:1]];
    [messageLabel setFont:[UIFont systemFontOfSize:14.0f]];
    messageLabel.text = message;
    [whiteView addSubview:messageLabel];
    [messageLabel sizeToFit];
    
    UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelButton setBackgroundImage:[UIImage imageNamed:@"cancelbutton_backgroundimage.png"] forState:UIControlStateNormal];
    [cancelButton setFrame:CGRectMake((whiteView.width - 109) / 2, messageLabel.bottom + 25, 109, 31)];
    [cancelButton setTitleColor:[UIColor colorWithWhite:188 / 255.0f alpha:1] forState:UIControlStateNormal];
    [cancelButton setTitle:cancelButtonTitle forState:UIControlStateNormal];
    [whiteView addSubview:cancelButton];
    [cancelButton addTarget:self action:@selector(cancelButtonAction:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark - Actions
- (void)cancelButtonAction:(id)sender {
    [_alertView removeFromSuperview];
    _alertView = nil;
}

- (void)dismisViewAction:(UIButton *)button {
    [button.superview.superview removeFromSuperview];
}

@end
    