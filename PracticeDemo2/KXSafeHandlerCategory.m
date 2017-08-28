//
//  KXSafeHandlerCategory.m
//  PracticeDemo2
//
//  Created by wanhouhong on 2017/8/25.
//  Copyright © 2017年 wanhouhong. All rights reserved.
//

#import "KXSafeHandlerCategory.h"
#import "NSObject+Swizzling.h"
#import <objc/runtime.h>

@implementation NSMutableDictionary (Swizzling)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {
//#ifdef DEBUG
       // 开发debug模式下需要抛出异常crash
//#else
            [objc_getClass("__NSDictionaryM") swizzleSelector:@selector(setObject:forKey:) withSwizzledSelector:@selector(safeSetObject:forKey:)];
            [objc_getClass("__NSDictionaryM") swizzleSelector:@selector(setValue:forKey:) withSwizzledSelector:@selector(safeSetValue:forKey:)];
            [objc_getClass("__NSDictionaryM") swizzleSelector:@selector(removeObjectForKey:) withSwizzledSelector:@selector(safeRemoveObjectForKey:)];
//#endif
        }
    });
}

- (void)safeSetObject:(id)obj forKey:(NSString *)key {
    if (obj && key) {
        [self safeSetObject:obj forKey:key];
    }
    else {
        NSLog(@" call -可变字典插入Object异常: Key或vale为nil或null");
    }
}

- (void)safeSetValue:(id)value forKey:(NSString *)key {
    if (key) {
        [self safeSetValue:value forKey:key];
    }
    else {
        NSLog(@" call -可变字典插入Value异常: Key为nil或null");
    }
}

- (void)safeRemoveObjectForKey:(NSString *)key {
    if (key) {
        [self safeRemoveObjectForKey:key];
    }
    else NSLog(@" call -可变字典移除Object异常:Key为nil或null");
}

@end

@implementation NSMutableArray (Swizzling)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {
//#ifdef DEBUG
            // 开发debug模式下需要抛出异常crash
//#else
            [objc_getClass("__NSArrayM") swizzleSelector:@selector(addObject:) withSwizzledSelector:@selector(safeAddObject:)];
            [objc_getClass("__NSArrayM") swizzleSelector:@selector(removeObjectAtIndex:) withSwizzledSelector:@selector(safeRemoveObjectAtIndex:)];
            [objc_getClass("__NSArrayM") swizzleSelector:@selector(insertObject:atIndex:) withSwizzledSelector:@selector(safeInsertObject:atIndex:)];
            [objc_getClass("__NSArrayM") swizzleSelector:@selector(objectAtIndex:) withSwizzledSelector:@selector(safeObjectAtIndex:)];
//#endif
        }
    });
}

- (void)safeAddObject:(id)obj {
    if (obj) {
        [self safeAddObject:obj];
    } else NSLog(@" call -可变数组添加Object异常:Object为nil或null");
}

- (void)safeRemoveObjectAtIndex:(NSInteger)index {
    if (self.count == 0) {
        NSLog(@" call -可变数组移除Object异常：数组为空");
        return;
    }
    if (index < 0 || index >= self.count) {
        NSLog(@" call -可变数组移除Object异常：数组越界");
        return;
    }
    [self safeRemoveObjectAtIndex:index];
}

- (void)safeInsertObject:(id)obj atIndex:(NSInteger)index {
    if (obj) {
        if (index >= 0 && index <= self.count) {
            [self safeInsertObject:obj atIndex:index];
        } else NSLog(@" call -可变数组插入Object异常:数组越界");
    } else NSLog(@" call -可变数组插入Object异常:Object为nil或null");
}

- (id)safeObjectAtIndex:(NSInteger)index {
    if (self.count == 0) {
        NSLog(@" call -可变数组查找Object异常：数组为空");
        return nil;
    }
    if (index < 0 || index >= self.count) {
        NSLog(@" call -可变数组查找Object异常：数组越界");
        return nil;
    }
    return [self safeObjectAtIndex:index];
}

@end

@implementation NSDictionary (Swizzling)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {
//#ifdef DEBUG
            // 开发debug模式下需要抛出异常crash
//#else
            [objc_getClass("__NSDictionaryI") swizzleSelector:@selector(objectForKey:) withSwizzledSelector:@selector(safeGetObjectForKey:)];
//#endif
        }
    });
}

- (id)safeGetObjectForKey:(NSString *)key {
    if (key) {
        id value = [self safeGetObjectForKey:key];
        return value;
    }
     NSLog(@" call -字典查找Object异常:Key为nil或null");
     return nil;
}

@end

@implementation NSArray (Swizzling)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {
//#ifdef DEBUG
            // 开发debug模式下需要抛出异常crash
//#else
            [objc_getClass("__NSArray0") swizzleSelector:@selector(objectAtIndex:) withSwizzledSelector:@selector(emptySafeObjectAtIndex:)];
            [objc_getClass("__NSArrayI") swizzleSelector:@selector(objectAtIndex:) withSwizzledSelector:@selector(safeObjectAtIndex:)];
//#endif
        }
    });
}

- (id)emptySafeObjectAtIndex:(NSInteger)index {
    NSLog(@" call -数组查找Object异常：数组为空");
    return nil;
}

- (id)safeObjectAtIndex:(NSInteger)index {
    if (index < 0 || index >= self.count) {
        NSLog(@" call -数组查找Object异常：数组越界");
        return nil;
    }
    return [self safeObjectAtIndex:index];
}

@end
