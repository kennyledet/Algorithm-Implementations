//
//  BinarySearch.m
//  Algorithms
//
//  Created by intoxicated on 1/5/14.
//  Copyright (c) 2014 intoxicated. All rights reserved.
//

#import "BinarySearch.h"

@implementation BinarySearch

/**
 * Recursive Binary Search
 * @param array unsorted array of NSNumber objects
 * @param value desire integer value to look for
 * @return -1 if value is not found in the array, otherwise return index of the value
 */
+ (NSInteger)search:(NSArray *)array For:(NSInteger)value
{
    if(array.count == 0)
        return -1;
    
    NSInteger mid = array.count / 2;
    NSInteger midValue = [[array objectAtIndex:mid] integerValue];
    NSInteger temp;
    
    if(midValue > value)
        return [self search:[NSArray arrayWithArray:[array subarrayWithRange:NSMakeRange(0, mid)]] For:value];
    else if(midValue < value)
    {
        temp = [self search:[NSArray arrayWithArray:[array subarrayWithRange:NSMakeRange(mid+1, mid)]] For:value];
        
        if(temp < 0)
            return -1;
        else
            return temp + mid + 1;
    }
    
    return mid;
}


@end
