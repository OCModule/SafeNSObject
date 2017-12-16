//
//  CSNSNumberTests.m
//  Categorys_Tests
//
//  Created by Steve on 16/12/2017.
//  Copyright © 2017 wangchengqvan@gmail.com. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface CSNSNumberTests : XCTestCase

@property (strong, nonatomic) NSNumber *number;

@end

@implementation CSNSNumberTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.number = [NSNumber numberWithInt:10];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testIsEqualToNumber {
    id value = nil;
    [self.number isEqualToNumber:value];
}

- (void)testCompare {
    id value = nil;
    [self.number compare:value];
}


@end
