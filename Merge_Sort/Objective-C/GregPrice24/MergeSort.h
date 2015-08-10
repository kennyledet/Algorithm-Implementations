//
//  MergeSort.h
//  Playground
//
//  Created by Greg Price on 8/9/15.
//  Copyright (c) 2015 Gregory Price. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 In computer science, merge sort (also commonly spelled mergesort) is an O(n log n) comparison-based sorting algorithm. Most implementations produce a stable sort, which means that the implementation preserves the input order of equal elements in the sorted output. Mergesort is a divide and conquer algorithm that was invented by John von Neumann in 1945.
     Source: https://en.wikipedia.org/wiki/Merge_sort
 
Merge sort is one of the first algorithms encountered by computer science students in a college setting. It is imperative that the movement of objects in this sort as well as various other sorts is understood completely to succeed in computer science as well as excel in job interviews (at least in california, maybe new england).
 */


@interface MergeSort : NSObject

+ (NSMutableArray *)execute:(NSMutableArray *)numbers
                      start:(NSInteger)start
                        end:(NSInteger)end;

@end
