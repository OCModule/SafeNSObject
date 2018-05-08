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
        [self hookSelector: @selector(isEqualToNumber:)];
        [self hookSelector: @selector(compare:)];
    });
#endif
}

+ (void)hookSelector:(SEL)sel {
    NSString *clsName = @"__NSCFNumber";
    SEL newSel = NSSelectorFromString([NSString stringWithFormat:@"cs_%@", NSStringFromSelector(sel)]);
    [self cs_swizzleMethod:newSel targetClsName:clsName targetSel:sel];
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
