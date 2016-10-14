//
//  BSTTests.m
//  Algorithms
//
//  Created by Greg Price on 8/9/15.
//  Copyright (c) 2015 Gregory Price. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "BST.h"

@interface BSTTests : XCTestCase

@end

@implementation BSTTests

- (void)testIterativeTreeBuild {
    BST *tree = [[BST alloc] initWithValue:2];
    [tree addLeafIteratively:[[BST alloc] initWithValue:5]];
    [tree addLeafIteratively:[[BST alloc] initWithValue:4]];
    [tree addLeafIteratively:[[BST alloc] initWithValue:10]];
    [tree addLeafIteratively:[[BST alloc] initWithValue:8]];
    [tree print];
}

- (void)testRecursiveTreeBuild {
    BST *tree = [[BST alloc] initWithValue:2];
    [tree addLeafRecursively:tree leaf:[[BST alloc] initWithValue:3]];
    [tree addLeafRecursively:tree leaf:[[BST alloc] initWithValue:8]];
    [tree addLeafRecursively:tree leaf:[[BST alloc] initWithValue:15]];
    [tree addLeafRecursively:tree leaf:[[BST alloc] initWithValue:9]];
    [tree addLeafRecursively:tree leaf:[[BST alloc] initWithValue:2]];
    [tree print];
}

- (void)testPrint {
    BST *tree = [[BST alloc] initWithValue:2];
    [tree addLeafRecursively:tree leaf:[[BST alloc] initWithValue:3]];
    [tree addLeafRecursively:tree leaf:[[BST alloc] initWithValue:8]];
    [tree addLeafRecursively:tree leaf:[[BST alloc] initWithValue:15]];
    [tree addLeafRecursively:tree leaf:[[BST alloc] initWithValue:9]];
    [tree addLeafRecursively:tree leaf:[[BST alloc] initWithValue:2]];
    [tree print];
}

- (void)testContainsNode {
    BST *tree = [[BST alloc] initWithValue:2];
    [tree addLeafRecursively:tree leaf:[[BST alloc] initWithValue:3]];
    [tree addLeafRecursively:tree leaf:[[BST alloc] initWithValue:8]];
    [tree addLeafRecursively:tree leaf:[[BST alloc] initWithValue:15]];
    [tree addLeafRecursively:tree leaf:[[BST alloc] initWithValue:9]];
    [tree addLeafRecursively:tree leaf:[[BST alloc] initWithValue:2]];
    XCTAssertTrue([tree containsNodeRecursively:tree value:9]);
    
}

- (void)testContainsNodeIter {
    BST *tree = [[BST alloc] initWithValue:2];
    [tree addLeafRecursively:tree leaf:[[BST alloc] initWithValue:3]];
    [tree addLeafRecursively:tree leaf:[[BST alloc] initWithValue:8]];
    [tree addLeafRecursively:tree leaf:[[BST alloc] initWithValue:15]];
    [tree addLeafRecursively:tree leaf:[[BST alloc] initWithValue:9]];
    [tree addLeafRecursively:tree leaf:[[BST alloc] initWithValue:2]];
    [tree print];
    
    XCTAssertTrue([tree containsNodeIteratively:tree value:9]);
}

- (void)testMinMax {
    BST *tree = [[BST alloc] initWithValue:2];
    [tree addLeafRecursively:tree leaf:[[BST alloc] initWithValue:3]];
    [tree addLeafRecursively:tree leaf:[[BST alloc] initWithValue:8]];
    [tree addLeafRecursively:tree leaf:[[BST alloc] initWithValue:15]];
    [tree addLeafRecursively:tree leaf:[[BST alloc] initWithValue:9]];
    [tree addLeafRecursively:tree leaf:[[BST alloc] initWithValue:2]];
    XCTAssert([tree minimum] == 2);
    XCTAssert([tree maximum] == 15);
}

- (void)testTransplant {
    BST *tree = [[BST alloc] initWithValue:2];
    BST *leaf = [[BST alloc] initWithValue:3];
    [tree addLeafIteratively:leaf];
    [tree addLeafIteratively:[[BST alloc] initWithValue:8]];
    [tree print];
    [tree transplant:tree leaf:leaf replacement:[[BST alloc] initWithValue:20]];
    [tree print];
    
}

- (void)testIsBalanced {
    BST *tree = [[BST alloc] initWithValue:2];
    [tree addLeafIteratively:[[BST alloc] initWithValue:1]];
    [tree addLeafIteratively:[[BST alloc] initWithValue:3]];
    BOOL isBalanced = [tree isBalanced:tree];
    XCTAssert(isBalanced);
}

- (void)testTreeDelete {
    BST *tree = [[BST alloc] initWithValue:2];
    BST *leaf = [[BST alloc] initWithValue:3];
    BST *leaf2 = [[BST alloc] initWithValue:4];
    BST *leaf3 = [[BST alloc] initWithValue:5];
    [tree addLeafIteratively:leaf];
    [tree addLeafIteratively:leaf2];
    [tree addLeafIteratively:leaf3];
    [tree addLeafIteratively:[[BST alloc] initWithValue:6]];
    [tree addLeafIteratively:[[BST alloc] initWithValue:15]];
    [tree addLeafIteratively:[[BST alloc] initWithValue:6]];
    [tree addLeafIteratively:[[BST alloc] initWithValue:12]];
    [tree print];
    [tree deleteFromTree:tree leaf:leaf3];
    [tree print];
}

@end
