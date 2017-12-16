//
//  NSString+Safe.m
//  Categorys
//
//  Created by Steve on 14/12/2017.
//

#import "NSObject+Swizzle.h"

@implementation NSString (Safe)

+ (void)load {
#if DEBUG
#else
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self cs_swizzleMethod: @selector(cs_characterAtIndex:) targetClsName: @"__NSCFString" targetSel: @selector(characterAtIndex:)];
        [self cs_swizzleMethod: @selector(cs_substringWithRange:) targetClsName:@"__NSCFString" targetSel: @selector(substringWithRange:)];
    });
#endif
}

- (unichar)cs_characterAtIndex:(NSUInteger)index {
    if (index >= [self length]) {
        return 0;
    }
    return [self cs_characterAtIndex:index];
}

- (NSString *)cs_substringWithRange:(NSRange)range {
    if (range.location + range.length > self.length) {
        return @"";
    }
    return [self cs_substringWithRange:range];
}

@end
