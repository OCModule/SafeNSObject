//
//  NSObject+Swizzle.h
//  Categorys
//
//  Created by Steve on 14/12/2017.
//

#import <Foundation/Foundation.h>

@interface NSObject (Swizzle)

+ (void)cs_swizzleMethod: (SEL)srcSel targetSel: (SEL)targetSel;

+ (void)cs_swizzleMethod: (SEL)srcSel targetClsName: (NSString *)targetClsName targetSel: (SEL)targetSel;

+ (void)cs_swizzleMethod: (NSString *)srcClsName srcSel: (SEL)srcSel targetClsName: (NSString *)targetClsName targetSel: (SEL)targetSel;

@end
