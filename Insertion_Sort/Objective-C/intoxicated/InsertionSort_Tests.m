//
//  InsertionSort_Tests.m
//  InsertionSort Tests
//
//  Created by R3alFr3e on 1/16/14.
//  Copyright (c) 2014 R3alFr3e. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "InsertionSort.h"

@interface InsertionSort_Tests : XCTestCase

@end

@implementation InsertionSort_Tests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testInsertionSort
{
    NSMutableArray * array = [[NSMutableArray alloc] initWithArray:@[@1,@54,@5,@8,@2,@6]];
    [InsertionSort sort:array];
    NSMutableArray * sortedArray = [NSMutableArray arrayWithArray:@[@1,@2,@5,@6,@8,@54]];
    
    XCTAssertEqualObjects(array, sortedArray, @"Array didn't get sorted");
    
}

@end
