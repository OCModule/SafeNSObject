//
//  CSNSMutableDictionaryTests.m
//  Categorys_Tests
//
//  Created by Steve on 16/12/2017.
//  Copyright © 2017 wangchengqvan@gmail.com. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface CSNSMutableDictionaryTests : XCTestCase

@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end

@implementation CSNSMutableDictionaryTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.dictionary = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"valu0", @"key0", @"valu1", @"key1", nil];

}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testRemoveObjectForKey {
    id key = nil;
    [self.dictionary removeObjectForKey:key];
}

- (void)testSetObject {
    id key = nil;
    id value = nil;
    [self.dictionary setObject:value forKey:key];
    self.dictionary[key] = value;
}

@end
