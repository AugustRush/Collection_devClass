//
//  NSArray+SLExt.m
//  BodyScaleProduction
//
//  Created by Go Salo on 14-3-17.
//  Copyright (c) 2014年 Go Salo. All rights reserved.
//

#import "NSArray+SLExt.h"

@implementation NSArray (SLExt)

- (id)firstObject {
    if (self.count > 0) {
        return self[0];
    } else {
        return nil;
    }
}

@end
