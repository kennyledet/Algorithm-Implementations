//
//  InsertionSort.m
//  Algorithms
//
//  Created by R3alFr3e on 1/16/14.
//  Copyright (c) 2014 R3alFr3e. All rights reserved.
//

#import "InsertionSort.h"

@implementation InsertionSort

/**
 * Insertion Sort
 *
 * @param array to be sorted by insertion sort
 */
+ (void)sort:(NSMutableArray *)array
{
    for(int i = 0; i < array.count; i++)
    {
        for(int j = i; j > 0; j--)
        {
            if([[array objectAtIndex:j] integerValue] < [[array objectAtIndex:j-1] integerValue])
            {
                id obj = [array objectAtIndex:j-1];
                [array replaceObjectAtIndex:j-1 withObject:[array objectAtIndex:j]];
                [array replaceObjectAtIndex:j withObject:obj];
            }
            else
                break;
        }
    }
}

@end
