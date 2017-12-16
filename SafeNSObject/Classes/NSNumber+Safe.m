//
//  NSNumber+Safe.m
//  Categorys
//
//  Created by Steve on 14/12/2017.
//

#import "NSObject+Swizzle.h"

@implementation NSNumber (Safe)
+ (void)load {
#if DEBUG
#else
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self cs_swizzleMethod: @selector(cs_isEqualToNumber:) targetClsName: @"__NSCFNumber" targetSel: @selector(isEqualToNumber:)];
        [self cs_swizzleMethod: @selector(cs_compare:) targetClsName: @"__NSCFNumber" targetSel: @selector(compare:)];
    });
#endif
}

- (BOOL)cs_isEqualToNumber:(NSNumber *)number {
    if (!number) {
        return NO;
    }
    return [self cs_isEqualToNumber:number];
}

- (NSComparisonResult)cs_compare:(NSNumber *)number {
    if (!number) {
        return NSOrderedAscending;
    }
    return [self cs_compare:number];
}

@end
