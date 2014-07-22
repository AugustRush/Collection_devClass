//
//  NSObject+filterPropertys.h
//  dianlv_ios2
//
//  Created by 刘 平伟 on 13-8-2.
//  Copyright (c) 2013年 VeryCD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSObject (filterPropertys)

//get property name list
- (NSArray *)filterPropertys;

//get property name and class key-value dictionary

-(NSDictionary *)filterPropertyNameAndClassList;


-(id)initWithDictionary:(NSDictionary *)dictionary;

@end
