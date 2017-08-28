//
//  NSObject+Swizzling.h
//  PracticeDemo2
//
//  Created by wanhouhong on 2017/8/25.
//  Copyright © 2017年 wanhouhong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Swizzling)

/**
 method swizzling 在运行时交换两个方法实现

 @param originalSelector 原始方法
 @param swizzledSelector 替换方法
 */
+ (void)swizzleSelector:(SEL)originalSelector withSwizzledSelector:(SEL)swizzledSelector;

@end
