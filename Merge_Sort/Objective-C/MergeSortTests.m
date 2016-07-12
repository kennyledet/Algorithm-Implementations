//
//  MergeSortTests.m
//  Playground
//
//  Created by Greg Price on 8/9/15.
//  Copyright (c) 2015 Gregory Price. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "MergeSort.h"

@interface MergeSortTests : XCTestCase

@end

@implementation MergeSortTests


- (void)testMergeSort {
    [self measureBlock:^{
        NSMutableArray *numbers = [NSMutableArray arrayWithObjects:@5, @3, @7, @9, @6, @50, @1, @12, nil];
        NSArray *sortie = @[@50, @12, @9, @7, @6, @5, @3, @1];
        numbers = [MergeSort execute:numbers start:0 end:8];
        XCTAssertEqualObjects([numbers copy], sortie);
    }];
}


@end
