//
//  PalindromeTests.m
//  Algorithms
//
//  Created by Greg Price on 8/9/15.
//  Copyright (c) 2015 Gregory Price. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Palindrome.h"

@interface PalindromeTests : XCTestCase

@end

@implementation PalindromeTests


- (void)testLongestPalindrome {
    NSString *longestPalindrome = [Palindrome longest:@"cggcgvgamanaplanacanalpanamazrtfc"];
    XCTAssert([longestPalindrome isEqualToString:@"amanaplanacanalpanama"]);
}

@end
