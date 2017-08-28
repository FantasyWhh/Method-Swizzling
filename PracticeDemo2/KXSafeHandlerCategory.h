//
//  KXSafeHandlerCategory.h
//  PracticeDemo2
//
//  Created by wanhouhong on 2017/8/25.
//  Copyright © 2017年 wanhouhong. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
    Release模式下，利用method swizzling在运行时替换数组和字典某些操作为相应的安全方法，防止因为服务器异常产生的一些空值或者越界造成程序crash
 */
@interface NSMutableDictionary (Swizzling)

@end

@interface NSMutableArray (Swizzling)

@end

@interface NSDictionary (Swizzling)

@end

@interface NSArray (Swizzling)

@end
