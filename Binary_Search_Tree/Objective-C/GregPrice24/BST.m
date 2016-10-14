//
//  BST.m
//  Algorithms
//
//  Created by Greg Price on 5/28/15.
//  Copyright (c) 2015 Gregory Price. All rights reserved.
//

#import "BST.h"

@interface BST()

@property (assign) NSInteger value;
@property (assign) NSInteger height;
@property (nonatomic) BST *left;
@property (nonatomic) BST *right;
@property (nonatomic) BST *parent;
@property (nonatomic) BST *root;

@end

@implementation BST

- (instancetype)initWithValue:(NSInteger)value {
    self = [super init];
    if (self) {
        _value = value;
        _root = self;
    }
    return self;
}

- (NSInteger)minimum {
    BST *tractor = self;
    while (tractor.left != nil) {
        tractor = tractor.left;
    }
    return tractor.value;
}

- (NSInteger)maximum {
    BST *tractor = self;
    while (tractor.right != nil) {
        tractor = tractor.right;
    }
    return tractor.value;
}

- (BOOL)isBalanced:(BST *)tree {
    BOOL retval = true;
    if (tree != nil) {
        [self isBalanced:tree.left];
        if ((tree.left.left != nil) && (tree.right.right == nil)) {
            retval = false;
        }
        
        if ((tree.right.right != nil) && (tree.left.left == nil)) {
            retval = false;
        }
        [self isBalanced:tree.right];
    }
    return retval;
}


- (void)addLeafIteratively:(BST *)leaf {
    BST *runner = self.root;
    BST *trailer = nil;
    while (runner != nil) {
        trailer = runner;
        if (leaf.value <= runner.value) {
            runner = runner.left;
        } else {
            runner = runner.right;
        }
    }
    
    if (leaf.value <= trailer.value) {
        trailer.left = leaf;
    } else {
        trailer.right = leaf;
    }
    
    leaf.parent = trailer;
}

- (BST *)addLeafRecursively:(BST *)tree
                       leaf:(BST *)leaf {
    if (tree != nil) {
        if (leaf.value < tree.value) {
            tree.left = [self addLeafRecursively:tree.left
                                            leaf:leaf];
        } else {
            tree.right = [self addLeafRecursively:tree.right
                                             leaf:leaf];
        }
        return tree;
    }
    
    leaf.parent = tree;
    
    return leaf;
}

- (BOOL)containsNodeRecursively:(BST *)tree value:(NSInteger)value {
    BOOL cn = false;
    if (!tree) {
        cn = false;
    }
    if (tree.value == value) {
        cn = true;
    }
    if (tree.left) {
        cn = [self containsNodeRecursively:tree.left value:value];
    }
    if (tree.right) {
        cn = [self containsNodeRecursively:tree.right value:value];
    }
    
    return cn;
}

- (BST *)minumumNode:(BST *)tree {
    while (tree.left != nil) {
        tree = tree.left;
    }
    return tree;
}

- (BST *)maximumNode:(BST *)tree {
    while (tree.right != nil) {
        tree = tree.right;
    }
    return tree;
}

- (BOOL)containsNodeIteratively:(BST *)tree value:(NSInteger)value {
    BOOL cn = false;
    BST *tractor = tree;
    while (tractor != nil) {
        if (tractor.value == value) {
            cn = true;
            break;
        }
        if (value < tractor.value) {
            tractor = tractor.left;
        } else {
            tractor = tractor.right;
        }
    }
    return cn;
}

- (void)transplant:(BST *)tree
              leaf:(BST *)leaf
       replacement:(BST *)replacement {
    if (leaf.parent == nil) {
        tree.root = replacement;
    }
    else if (leaf == leaf.parent.left) {
        leaf.parent.left = replacement;
    } else {
        leaf.parent.right = replacement;
    }
    
    if (replacement) {
        replacement.parent = leaf.parent;
    }
}

- (void)deleteFromTree:(BST *)tree
                  leaf:(BST *)leaf {
    if (leaf.left == nil) {
        [self transplant:tree
                    leaf:leaf
             replacement:leaf.right];
    } else if (leaf.right == nil) {
        [self transplant:tree
                    leaf:leaf
             replacement:leaf.left];
    } else {
        BST *left = [self minumumNode:leaf.right];
        if (left.parent != leaf) {
            [self transplant:tree
                        leaf:left
                 replacement:left.right];
            left.right = leaf.right;
            leaf.right.parent = left;
        }
        
        [self transplant:tree
                    leaf:leaf
             replacement:left];
        left.left = leaf.left;
        left.left.parent = left;
    }
    
}

- (void)print {
    [self print:self];
}

- (void)print:(BST *)tree {
    if (tree != nil) {
        [self print:tree.left];
        NSLog(@"node = %lu", tree.value);
        [self print:tree.right];
    }
}

@end
