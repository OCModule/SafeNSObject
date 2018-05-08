//
//  NSMutableDictionary+Safe.m
//  Categorys
//
//  Created by Steve on 14/12/2017.
//

#import "NSObject+Swizzle.h"

@implementation NSMutableDictionary (Safe)

+ (void)load {
#if DEBUG
#else
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self hookSelector:@selector(removeObjectForKey:)];
        [self hookSelector:@selector(setObject:forKey:)];
        [self hookSelector:@selector(setObject:forKeyedSubscript:)];
    });
#endif
}

+ (void)hookSelector:(SEL)sel {
    NSString *clsName = @"__NSDictionaryM";
    SEL newSel = NSSelectorFromString([NSString stringWithFormat:@"cs_%@", NSStringFromSelector(sel)]);
    [self cs_swizzleMethod:newSel targetClsName:clsName targetSel:sel];
}

- (void)cs_removeObjectForKey: (id)aKey {
    if (!aKey) {
        return;
    }
    [self cs_removeObjectForKey: aKey];
}

- (void)cs_setObject: (id _Nullable)anObject forKey: (id <NSCopying> _Nonnull)aKey {
    if (!anObject) {
        return;
    }
    if (!aKey) {
        return;
    }
    [self cs_setObject: anObject forKey: aKey];
}


- (void)cs_setObject:(id _Nullable)anObject forKeyedSubscript:(id<NSCopying> _Nonnull)aKey {
    if (!anObject) {
        return;
    }
    if (!aKey) {
        return;
    }
    [self cs_setObject:anObject forKeyedSubscript:aKey];
}

@end
