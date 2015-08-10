//
//  MergeSort.m
//  Playground
//
//  Created by Greg Price on 8/9/15.
//  Copyright (c) 2015 Gregory Price. All rights reserved.
//

#import "MergeSort.h"

@implementation MergeSort

+ (NSMutableArray *)execute:(NSMutableArray *)numbers
                      start:(NSInteger)start
                        end:(NSInteger)end {
    if (start < end) {
        long middle = (start + end) / 2;
        numbers = [self execute:numbers start:start end:middle];
        numbers = [self execute:numbers start:middle + 1 end:end];
        numbers = merge(numbers, (int)start, (int)middle, (int)end);
    }
    return numbers;
}

NSMutableArray *merge(NSMutableArray *list, int start, int middle, int end) {
    int reverseNavigator = middle - 1;
    while (reverseNavigator >= 0) {
        int trailer = reverseNavigator;
        int forwardNavigator = trailer + 1;
        for (int i = forwardNavigator; i < end; i++) {
            if (list[trailer] < list[i]) {
                id temp = list[trailer];
                list[trailer] = list[i];
                list[i] = temp;
                trailer++;
            } else {
                break;
            }
        }
        reverseNavigator--;
    }
    return list;
}

@end
