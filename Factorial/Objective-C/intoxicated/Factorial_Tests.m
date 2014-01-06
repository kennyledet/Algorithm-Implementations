//
//  Factorial_Tests.m
//  Factorial Tests
//
//  Created by intoxicated on 1/5/14.
//  Copyright (c) 2014 intoxicated. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Factorial.h"

@interface Factorial_Tests : XCTestCase

@end

@implementation Factorial_Tests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testValidValueForFactorial
{
    XCTAssertTrue([Factorial recursive:2] == 2, @"Fail to get right factorial value");
    XCTAssertTrue([Factorial recursive:10] == 3628800, @"Fail to get right factorial value");
    XCTAssertTrue([Factorial iterative:2] == 2, @"Fail to get right factorial value");
    XCTAssertTrue([Factorial iterative:10] == 3628800, @"Fail to get right factorial value");
}

- (void)testShouldRaiseExceptionForInvalidValue
{
    XCTAssertThrows([Factorial recursive:-1], @"Should raise exception for invalid input");
    XCTAssertThrows([Factorial iterative:-10], @"Should raise exception for invalid input");
}

@end
