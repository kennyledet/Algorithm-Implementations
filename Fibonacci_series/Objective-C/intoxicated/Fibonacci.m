//
//  Fibonacci.m
//  Algorithms
//
//  Created by intoxicated on 1/4/14.
//  Copyright (c) 2014 intoxicated. All rights reserved.
//

#import "Fibonacci.h"

#define integer(x) [NSNumber numberWithLong:x]

static Fibonacci * instance;

@interface Fibonacci ()
@property (nonatomic, strong) NSMutableArray * array;
@end

@implementation Fibonacci

+ (id)initFibWith:(NSInteger)size
{
    @synchronized(self)
    {
        if (instance == NULL){
            instance = [[self alloc] init];
            instance.array = [[NSMutableArray alloc] initWithCapacity:size+1];
            for(int i = 0; i < size+1; i++)
                [instance.array addObject:[NSNull null]];
        }
    }
    
    return instance;
}

- (void)resetWithSize:(NSInteger)size
{
    instance.array = [[NSMutableArray alloc] initWithCapacity:size+1];
    for(int i = 0; i < size+1; i++)
        [instance.array addObject:[NSNull null]];
}

/**
 * Basic recursive Fibonnacci nth number
 * O(n!)
 */
- (long)recursive:(NSInteger)nth
{
    if(nth < 2)
        return nth;
    return [self recursive:nth-1] + [self recursive:nth-2];
}

/**
 * Improved recursive Fibonacci by memorizing
 * perform O(n) additions
 */
- (long)memorization:(NSInteger)nth
{
    if(nth < 2)
        return nth;
    else
    {
        if([instance.array objectAtIndex:nth] == [NSNull null])
        {
            [instance.array insertObject:integer([self memorization:nth-1] + [self memorization:nth-2])
                          atIndex:nth];
        }
        return [[instance.array objectAtIndex:nth] integerValue];
    }
}

/**
 * Same as above but savin some space by using dynamic programming
 * running O(n) space O(n)
 */
- (long)iter1:(NSInteger)nth
{
    [instance.array replaceObjectAtIndex:0 withObject:integer(0)];
    [instance.array replaceObjectAtIndex:1 withObject:integer(1)];
    
    for(int i = 2; i <= nth; ++i)
    {
        [instance.array replaceObjectAtIndex:i withObject:
         integer([[instance.array objectAtIndex:i-1] integerValue] +
                 [[instance.array objectAtIndex:i-2] integerValue])];
    }
    return [[instance.array objectAtIndex:nth] integerValue];
}

/**
 * This one only requires to remember previous two number to get
 * next fibonacci number
 * running O(n) space O(1)
 */
- (long)iter2:(NSInteger)nth
{
    NSInteger prev = 1;
    NSInteger curr = 0;
    NSInteger next;
    for(int i = 1; i <= nth; i++)
    {
        next = curr + prev;
        prev = curr;
        curr = next;
    }
    return curr;
}


@end
