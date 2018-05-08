//
//  NSMutableString+Safe.m
//  Categorys
//
//  Created by Steve on 14/12/2017.
//

#import "NSObject+Swizzle.h"

@implementation NSMutableString (Safe)

+ (void)load {
#if DEBUG
#else
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self hookSelector:@selector(appendString:)];
        [self hookSelector:@selector(appendFormat:)];
        [self hookSelector:@selector(setString:)];
        [self hookSelector:@selector(insertString:atIndex:)];
    });
#endif
}

+ (void)hookSelector:(SEL)sel {
    NSString *clsName = @"__NSCFConstantString";
    SEL newSel = NSSelectorFromString([NSString stringWithFormat:@"cs_%@", NSStringFromSelector(sel)]);
    [self cs_swizzleMethod:newSel targetClsName:clsName targetSel:sel];
}


- (void)cs_appendString:(NSString *)aString {
    if (!aString) {
        return;
    }
    [self cs_appendString:aString];
}

- (void)cs_appendFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2) {
    if (!format) {
        return;
    }
    va_list arguments;
    va_start(arguments, format);
    NSString *formatStr = [[NSString alloc]initWithFormat:format arguments:arguments];
    [self cs_appendFormat:@"%@",formatStr];
    va_end(arguments);
}

- (void)cs_setString:(NSString *)aString {
    if (!aString) {
        return;
    }
    [self cs_setString:aString];
}

- (void)cs_insertString:(NSString *)aString atIndex:(NSUInteger)index {
    if (index > [self length]) {
        return;
    }
    if (!aString) {
        return;
    }
    [self cs_insertString:aString atIndex:index];
}

@end
