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
        [self cs_swizzleMethod:@selector(cs_objectAtIndex:) targetClsName:@"__NSArrayM" targetSel:@selector(objectAtIndex:)];
        [self cs_swizzleMethod:@selector(cs_objectAtIndexedSubscript:) targetClsName:@"__NSArrayM" targetSel:@selector(objectAtIndexedSubscript:)];
        [self cs_swizzleMethod:@selector(cs_addObject:) targetClsName:@"__NSArrayM" targetSel: @selector(addObject:)];
        [self cs_swizzleMethod:@selector(cs_insertObject:atIndex:) targetClsName: @"__NSArrayM" targetSel:@selector(insertObject:atIndex:)];
        [self cs_swizzleMethod:@selector(cs_removeObjectAtIndex:) targetClsName: @"__NSArrayM" targetSel: @selector(removeObjectAtIndex:)];
        [self cs_swizzleMethod:@selector(cs_replaceObjectAtIndex:withObject:) targetClsName: @"__NSArrayM" targetSel: @selector(replaceObjectAtIndex:withObject:)];
    });
#endif
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
