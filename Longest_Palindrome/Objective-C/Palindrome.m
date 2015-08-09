//
//  Palindrome.m
//  Algorithms
//
//  Created by Greg Price on 8/9/15.
//  Copyright (c) 2015 Gregory Price. All rights reserved.
//

#import "Palindrome.h"

@implementation Palindrome

+ (NSString *)longest:(NSString *)str {
    NSString *longest = @"";
    NSInteger left;
    NSInteger right;
    for (int i = 0; i < [str length]; i++) {
        left =  i - 1;
        right = i + 1;
        NSInteger before = [longest length];
        NSString *lp = [str substringWithRange:NSMakeRange(i, 1)];
        while ((left >= 0) && right < [str length]) {
            NSString *lc = [str substringWithRange:NSMakeRange(left, 1)];
            NSString *rc = [str substringWithRange:NSMakeRange(right, 1)];
            if ([lc isEqualToString:rc]) {
                lp = [NSString stringWithFormat:@"%@%@%@", lc, lp, rc];
            }
            left--;
            right++;
        }
        if ([lp length] > before) {
            longest = lp;
        }
    }
    
    return longest;
}


@end
