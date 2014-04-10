//
//  CALayer+XibConfiguration.m
//  schoolfellow
//
//  Created by EasyitsApp on 13-12-4.
//  Copyright (c) 2013年 www.easyits.net. All rights reserved.
//

#import "CALayer+XibConfiguration.h"

@implementation CALayer (XibConfiguration)

-(void)setBorderUIColor:(UIColor*)color
{
    self.borderColor = color.CGColor;
}

-(UIColor *)borderUIColor
{
    return [UIColor colorWithCGColor:self.borderColor];
}

- (void)setShadowUIColor:(UIColor *)color
{
    self.shadowColor = color.CGColor;
}

- (UIColor *)shadowUIColor
{
    return [UIColor colorWithCGColor:self.shadowColor];
}

@end
