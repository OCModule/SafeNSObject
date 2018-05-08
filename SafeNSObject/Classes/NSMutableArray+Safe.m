//
//  NSMutableArray+Safe.m
//  Categorys
//
//  Created by Steve on 14/12/2017.
//

#import "NSObject+Swizzle.h"

@implementation NSMutableArray (Safe)

+ (void)load {
#if DEBUG
#else
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{        
        [self hookSelector:@selector(objectAtIndex:)];
        [self hookSelector:@selector(objectAtIndexedSubscript:)];
        [self hookSelector:@selector(addObject:)];
        [self hookSelector:@selector(insertObject:atIndex:)];
        [self hookSelector:@selector(removeObjectAtIndex:)];
        [self hookSelector:@selector(replaceObjectAtIndex:withObject:)];
    });
#endif
}

+ (void)hookSelector:(SEL)sel {
    NSString *clsName = @"__NSArrayM";
    SEL newSel = NSSelectorFromString([NSString stringWithFormat:@"cs_%@", NSStringFromSelector(sel)]);
    [self cs_swizzleMethod:newSel targetClsName:clsName targetSel:sel];
}

- (id)cs_objectAtIndex: (NSUInteger)index {
    if (index >= [self count]) {
        return nil;
    }
    return [self cs_objectAtIndex:index];
}

- (id)cs_objectAtIndexedSubscript: (NSUInteger)index {
    if (index >= [self count]) {
        return nil;
    }
    return [self cs_objectAtIndex:index];
}

- (void)cs_addObject:(id)anObject {
    if (!anObject) {
        return;
    }
    [self cs_addObject:anObject];
}

- (void)cs_insertObject:(id)anObject atIndex:(NSUInteger)index {
    if (index > [self count]) {
        return;
    }
    if (!anObject) {
        return;
    }
    [self cs_insertObject:anObject atIndex:index];
}

- (void)cs_removeObjectAtIndex:(NSUInteger)index {
    if (index >= [self count]) {
        return;
    }
    return [self cs_removeObjectAtIndex:index];
}

- (void)cs_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject {
    if (index >= [self count]) {
        return;
    }
    if (!anObject) {
        return;
    }
    [self cs_replaceObjectAtIndex:index withObject:anObject];
}

@end
