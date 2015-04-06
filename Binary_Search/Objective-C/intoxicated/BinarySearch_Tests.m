//
//  BinarySearch_Tests.m
//  BinarySearch Tests
//
//  Created by intoxicated on 1/5/14.
//  Copyright (c) 2014 intoxicated. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BinarySearch.h"

#define INT(x) [NSNumber numberWithInt:x]

@interface BinarySearch_Tests : XCTestCase
@property (nonatomic,strong) NSMutableArray * array;
@property (nonatomic,strong) NSMutableArray * array2;
@end

@implementation BinarySearch_Tests

- (void)setUp
{
    [super setUp];
    _array = [[NSMutableArray alloc] initWithArray:@[INT(0),INT(1),INT(3),INT(4),INT(5),INT(6),INT(7)]];
}

- (void)tearDown
{
    _array = nil;
    _array2 = nil;
    [super tearDown];
}

- (void)testNormalBehaviors
{
    XCTAssertTrue(2 == [BinarySearch search:_array For:3], @"Error: Index mismatch");
    XCTAssertTrue(4 == [BinarySearch search:_array For:5], @"Error: Index mismatch");
    XCTAssertTrue(5 == [BinarySearch search:_array For:6], @"Error: Index mismatch");
    XCTAssertTrue(0 == [BinarySearch search:_array For:0], @"Error: Index mismatch");
}

- (void)testIndexNotFound
{
    XCTAssertTrue(-1 == [BinarySearch search:_array For:10], @"Error: returns wrong value");
    XCTAssertTrue(-1 == [BinarySearch search:_array For:-1], @"Error: returns wrong value");
}

@end
