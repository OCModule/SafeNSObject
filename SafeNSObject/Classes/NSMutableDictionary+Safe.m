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
        [self cs_swizzleMethod: @selector(cs_removeObjectForKey:) targetClsName: @"__NSDictionaryM" targetSel: @selector(removeObjectForKey:)];
        [self cs_swizzleMethod: @selector(cs_setObject:forKey:) targetClsName: @"__NSDictionaryM" targetSel: @selector(setObject:forKey:)];
        [self cs_swizzleMethod: @selector(cs_setObject:forKeyedSubscript:) targetClsName: @"__NSDictionaryM" targetSel: @selector(setObject:forKeyedSubscript:)];
    });
#endif
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
