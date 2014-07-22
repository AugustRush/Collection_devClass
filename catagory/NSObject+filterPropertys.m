//
//  NSObject+filterPropertys.m
//  dianlv_ios2
//
//  Created by 刘 平伟 on 13-8-2.
//  Copyright (c) 2013年 VeryCD. All rights reserved.
//

#import "NSObject+filterPropertys.h"

@implementation NSObject (filterPropertys)

- (NSArray *)filterPropertys
{
    NSMutableArray *props = [NSMutableArray array];
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for (i = 0; i<outCount; i++)
    {
        objc_property_t property = properties[i];
        const char* char_f =property_getName(property);
        NSString *propertyName = [NSString stringWithUTF8String:char_f];
        [props addObject:propertyName];
    }
    free(properties);
    return props;
}

-(NSDictionary *)filterPropertyNameAndClassList
{
    NSMutableDictionary *props = [NSMutableDictionary dictionary];
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for (i = 0; i<outCount; i++)
    {
        objc_property_t property = properties[i];
        const char* char_f =property_getName(property);
        const char* char_c =property_getAttributes(property);
        NSString *proArrtribute = [NSString stringWithUTF8String:char_c];
        NSArray *sub = [proArrtribute componentsSeparatedByString:@","];
        NSString *propertyClass = sub[0];
        NSString *propertyName = [NSString stringWithUTF8String:char_f];
        
        if (propertyClass) {
            [props setValue:propertyClass forKey:propertyName];
        }
        
    }
    free(properties);
    return props;
}

-(id)initWithDictionary:(NSDictionary *)dictionary
{
    if ([self init]) {
        
        NSArray *array = [self filterPropertys];
        
        for (NSString *key in dictionary.allKeys) {
            if ([array containsObject:key]) {
                NSString *value = [[dictionary objectForKey:key] isEqual:[NSNull null]]?nil:[dictionary objectForKey:key];
                [self setValue:value forKey:key];
            }
        }
        
    }
    
    return self;

}

@end
