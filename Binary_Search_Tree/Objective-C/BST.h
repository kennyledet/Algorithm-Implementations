//
//  BST.h
//  Algorithms
//
//  Created by Greg Price on 5/28/15.
//  Copyright (c) 2015 Gregory Price. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BST : NSObject

- (instancetype)initWithValue:(NSInteger)value;
- (void)addLeafIteratively:(BST *)leaf;
- (BST *)addLeafRecursively:(BST *)tree
                       leaf:(BST *)leaf;
- (BOOL)containsNodeRecursively:(BST *)tree value:(NSInteger)value;
- (BOOL)containsNodeIteratively:(BST *)tree value:(NSInteger)value;
- (void)transplant:(BST *)tree
              leaf:(BST *)leaf
       replacement:(BST *)replacement;

- (void)deleteFromTree:(BST *)tree
                  leaf:(BST *)leaf;
- (BOOL)isBalanced:(BST *)tree;
- (void)print;

@property (readonly) NSInteger minimum;
@property (readonly) NSInteger maximum;

- (BST *)minumumNode:(BST *)tree;
- (BST *)maximumNode:(BST *)tree;

@end
