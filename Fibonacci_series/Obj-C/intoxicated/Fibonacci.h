//
//  Fibonacci.h
//  Algorithms
//
//  Created by intoxicated on 1/4/14.
//  Copyright (c) 2014 intoxicated. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fibonacci : NSObject

+ (id)initFibWith:(NSInteger)size;

- (void)resetWithSize:(NSInteger)size;

- (long)recursive:(NSInteger)nth;
- (long)memorization:(NSInteger)nth;
- (long)iter1:(NSInteger)nth;
- (long)iter2:(NSInteger)nth;

@end
