//
//  CSNSMutableStringTests.m
//  Categorys_Tests
//
//  Created by Steve on 16/12/2017.
//  Copyright © 2017 wangchengqvan@gmail.com. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface CSNSMutableStringTests : XCTestCase

@property (strong, nonatomic) NSMutableString *string;

@end

@implementation CSNSMutableStringTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.string = [NSMutableString stringWithString:@"abc"];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAppendString {
    id value = nil;
    [self.string appendString:value];
}

- (void)testAppendFormat {
    id value = nil;
    [self.string appendFormat:value, nil];
}

- (void)testSetString {
    id value = nil;
    [self.string setString:value];
}

- (void)testInsertString {
    id value = nil;
    [self.string insertString:value atIndex:20];
}


- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
