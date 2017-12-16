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
        [self cs_swizzleMethod:@selector(cs_initWithObjects:count:) targetClsName:@"__NSPlaceholderArray" targetSel:@selector(initWithObjects:count:)];
        [self cs_swizzleMethod:@selector(cs_objectAtIndex:) targetClsName:@"__NSArrayI" targetSel:@selector(objectAtIndex:)];
        [self cs_swizzleMethod:@selector(cs_arrayByAddingObject:) targetClsName:@"__NSArrayI" targetSel:@selector(arrayByAddingObject:)];
        [self cs_swizzleMethod:@selector(cs_objectAtIndexedSubscript:) targetClsName:@"__NSArrayI" targetSel:@selector(objectAtIndexedSubscript:)];
    });
#endif
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
