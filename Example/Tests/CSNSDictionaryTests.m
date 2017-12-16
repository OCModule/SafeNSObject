//
//  CSNSDictionaryTests.m
//  Categorys_Tests
//
//  Created by Steve on 16/12/2017.
//  Copyright © 2017 wangchengqvan@gmail.com. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface CSNSDictionaryTests : XCTestCase

@property (strong, nonatomic) NSDictionary *dictionary;

@end

@implementation CSNSDictionaryTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testLiterals {
    id value = nil;
    self.dictionary = @{@"key0":@"value0", @"key1":value, @"key2":@"value2"};
}

@end
