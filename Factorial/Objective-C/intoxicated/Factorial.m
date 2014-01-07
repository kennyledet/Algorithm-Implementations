//
//  Factorial.m
//  Algorithms
//
//  Created by intoxicated on 1/5/14.
//  Copyright (c) 2014 intoxicated. All rights reserved.
//

#import "Factorial.h"

@implementation Factorial

/**
 * Recursive factorial
 * @param value to calculate factorial
 */
+ (NSInteger)recursive:(NSInteger)value
{
    if(value == 0)
        return 1;
    
    if(value < 0)
        [NSException raise:@"invalid value" format:@"invalid value for factorial"];
    
    return value * [self recursive:value-1];
}

/**
 * Iterative factorial
 * @param value to calculate factorial
 */
+ (NSInteger)iterative:(NSInteger)value
{
    if(value < 0)
        [NSException raise:@"invalid value" format:@"invalid value for factorial"];

    NSInteger ret = 1;
    for(int i = 1; i <= value; ++i)
        ret *= i;
    
    return ret;
}

@end
