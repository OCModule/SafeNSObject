//
//  CSNSStringTests.m
//  Categorys_Tests
//
//  Created by Steve on 16/12/2017.
//  Copyright © 2017 wangchengqvan@gmail.com. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface CSNSStringTests : XCTestCase

@property (strong, nonatomic) NSString *string;

@end

@implementation CSNSStringTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.string = @"abc";
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCharacterAtIndex {
    [self.string characterAtIndex:10];
}

@end
