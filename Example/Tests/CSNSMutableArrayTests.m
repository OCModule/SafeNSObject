//
//  CSNSMutableArrayTests.m
//  Categorys_Tests
//
//  Created by Steve on 15/12/2017.
//  Copyright © 2017 wangchengqvan@gmail.com. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface CSNSMutableArrayTests : XCTestCase

@property (strong, nonatomic) NSMutableArray *array;

@end

@implementation CSNSMutableArrayTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.array = [NSMutableArray arrayWithObjects:@"0", @"1", @"2", nil];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testObjectAtIndex {
    id value = [self.array objectAtIndex:10];
    XCTAssert(value == nil);
    value = self.array[10];
    XCTAssert(value == nil);
}

- (void)testAddObject {
    id value = nil;
    [self.array addObject:value];
}

- (void)testInsertObject {
    id value = nil;
    [self.array insertObject:value atIndex:10];
}

- (void)testRemoveObjectAtIndex {
    [self.array removeObjectAtIndex:10];
}

- (void)testReplaceObjectAtIndex {
    id value = nil;
    [self.array replaceObjectAtIndex:10 withObject:value];
}

- (void)testArrayByAddingObject {
    id value = nil;
    [self.array arrayByAddingObject:value];
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
