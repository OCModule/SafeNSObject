//
//  NSArray+Safe.m
//  Categorys
//
//  Created by Steve on 14/12/2017.
//

#import "NSObject+Swizzle.h"

@implementation NSArray (Safe)

+ (void)load {
#if DEBUG
#else
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *clsName = @"__NSPlaceholderArray";
        [self hookSelector: @selector(initWithObjects:count:) targetName: clsName];
        clsName = @"__NSArrayI";
        [self hookSelector: @selector(objectAtIndex:) targetName: clsName];
        [self hookSelector: @selector(arrayByAddingObject:) targetName: clsName];
        [self hookSelector: @selector(objectAtIndexedSubscript:) targetName: clsName];
    });
#endif
}

+ (void)hookSelector:(SEL)sel targetName: (NSString *)aName {
    SEL newSel = NSSelectorFromString([NSString stringWithFormat:@"cs_%@", NSStringFromSelector(sel)]);
    [self cs_swizzleMethod:newSel targetClsName:aName targetSel:sel];
}


- (instancetype)cs_initWithObjects:(id *)objects count:(NSUInteger)count {
    NSUInteger newCnt = 0;
    for (NSUInteger i = 0; i < count; i++) {
        if (!objects[i]) {
            break;
        }
        newCnt++;
    }
    return [self cs_initWithObjects:objects count:newCnt];
}


- (id)cs_objectAtIndex: (NSUInteger)index {
    if (index >= [self count]) {
        return nil;
    }
    return [self cs_objectAtIndex:index];
}

- (NSArray *)cs_arrayByAddingObject:(id)anObject {
    if (!anObject) {
        return self;
    }
    return [self cs_arrayByAddingObject:anObject];
}

- (id)cs_objectAtIndexedSubscript: (NSUInteger)index {
    if (index >= [self count]) {
        return nil;
    }
    return [self cs_objectAtIndex:index];
}

@end
