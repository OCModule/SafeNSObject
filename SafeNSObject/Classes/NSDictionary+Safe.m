//
//  NSDictionary+Safe.m
//  Categorys
//
//  Created by Steve on 14/12/2017.
//

#import "NSObject+Swizzle.h"

@implementation NSDictionary (Safe)

+ (void)load {
#if DEBUG
#else
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self cs_swizzleMethod: @selector(cs_initWithObjects:forKeys:count:) targetClsName:@"__NSPlaceholderDictionary" targetSel: @selector(initWithObjects:forKeys:count:)];
    });
#endif
}

-(instancetype)cs_initWithObjects:(id *)objects forKeys:(id<NSCopying> *)keys count:(NSUInteger)count {
    NSUInteger newCount = 0;
    for (NSUInteger i = 0; i < count; i++) {
        if (!(keys[i] && objects[i])) {
            break;
        }
        newCount++;
    }
    return [self cs_initWithObjects:objects forKeys:keys count:newCount];
}

@end
