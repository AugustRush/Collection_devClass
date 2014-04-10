//
//  CALayer+XibConfiguration.h
//  schoolfellow
//
//  Created by EasyitsApp on 13-12-4.
//  Copyright (c) 2013年 www.easyits.net. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CALayer (XibConfiguration)

// This assigns a CGColor to borderColor.
@property(nonatomic, assign) UIColor *borderUIColor;
@property(nonatomic, assign) UIColor *shadowUIColor;

@end
