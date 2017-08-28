//
//  NSObject+Swizzling.m
//  PracticeDemo2
//
//  Created by wanhouhong on 2017/8/25.
//  Copyright © 2017年 wanhouhong. All rights reserved.
//

#import "NSObject+Swizzling.h"
#import <objc/runtime.h>

@implementation NSObject (Swizzling)

+ (void)swizzleSelector:(SEL)originalSelector withSwizzledSelector:(SEL)swizzledSelector
{
    Class class = [self class];
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    // 尝试添加方法实现
    BOOL didAddMethod = class_addMethod(class,originalSelector,
                                        method_getImplementation(swizzledMethod),
                                        method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) { // 尝试添加方法实现->成功
        class_replaceMethod(class,swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else { //尝试添加方法实现->失败:说明已经存在这个方法,则可以直接交换方法的实现
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@end
