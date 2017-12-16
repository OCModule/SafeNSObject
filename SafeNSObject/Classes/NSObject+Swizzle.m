//
//  NSObject+Swizzle.m
//  Categorys
//
//  Created by Steve on 14/12/2017.
//

#import "NSObject+Swizzle.h"
#import <objc/runtime.h>

@implementation NSObject (Swizzle)

+ (void)cs_swizzleMethod: (SEL)srcSel targetSel: (SEL)targetSel {
    [self cs_swizzleMethod:srcSel targetClsName:NSStringFromClass(self) targetSel:targetSel];
}

+ (void)cs_swizzleMethod: (SEL)srcSel targetClsName: (NSString *)targetClsName targetSel: (SEL)targetSel {
    [self cs_swizzleMethod: NSStringFromClass(self) srcSel:srcSel targetClsName: targetClsName targetSel: targetSel];
}

+ (void)cs_swizzleMethod: (NSString *)srcClsName srcSel: (SEL)srcSel targetClsName: (NSString *)targetClsName targetSel: (SEL)targetSel {
    Class srcCls = NSClassFromString(srcClsName);
    Class targetCls = NSClassFromString(targetClsName);
    if (srcCls !=nil && srcSel != nil && targetCls != nil && targetSel != nil) {
        Method srcMethod = class_getInstanceMethod(srcCls, srcSel);
        Method targetMethod = class_getInstanceMethod(targetCls, targetSel);
        method_exchangeImplementations(srcMethod, targetMethod);
    }
}

@end
