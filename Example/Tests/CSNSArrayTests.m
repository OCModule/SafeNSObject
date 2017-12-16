//
//  CSNSArrayTests.m
//  Categorys_Tests
//
//  Created by Steve on 15/12/2017.
//  Copyright © 2017 wangchengqvan@gmail.com. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface CSNSArrayTests : XCTestCase

@property (strong, nonatomic) NSArray *array;

@end

@implementation CSNSArrayTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.array = @[@"0", @"1", @"2"];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInitWithObjects:(id *)objects count:(NSUInteger)count {
    self.array = [[NSArray alloc] initWithObjects:@"hai",@"how",@"are",@"you",nil];
}

- (void)testObjectAtIndex {
    id value = [self.array objectAtIndex:10];
    XCTAssert(value == nil);
    value = self.array[10];
    XCTAssert(value == nil);
}

- (void)testArrayByAddingObject {
    id value = nil;
    [self.array arrayByAddingObject:value];
}

- (void)testLiterals {
    id value = nil;
    self.array = @[@"0", @"1", @"2", value ,@"4"];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
