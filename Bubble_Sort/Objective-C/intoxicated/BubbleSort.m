//
//  BubbleSort.m
//  Algorithms
//
//  Created by intoxicated on 1/4/14.
//  Copyright (c) 2014 intoxicated. All rights reserved.
//
//  Bubblesort

#import "BubbleSort.h"

@interface BubbleSort()

+ (void)swap:(NSMutableArray *)array firstIndex:(NSInteger)fi secondIndex:(NSInteger)si;

@end

@implementation BubbleSort

+ (void)swap:(NSMutableArray *)array firstIndex:(NSInteger)fi secondIndex:(NSInteger)si
{
    NSNumber * temp = [array objectAtIndex:fi];

    [array replaceObjectAtIndex:fi withObject:[array objectAtIndex:si]];
    [array replaceObjectAtIndex:si withObject:temp];
}

+ (void)sort:(NSMutableArray *)array
{
    NSInteger count = array.count;

    do
    {
        for(int i = 1; i < count ; ++i)
        {
            if([[array objectAtIndex:i-1] intValue] > [[array objectAtIndex:i] intValue])
                [self swap:array firstIndex:i secondIndex:i-1];
        }
        count = count - 1;
    }while(count > 0);
}

@end
