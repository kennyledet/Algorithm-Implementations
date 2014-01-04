//
//  Fisher-Yates_test.m
//  Fisher-Yates
//
//  Created by intoxicated on 1/4/14.
//  Copyright (c) 2014 intoxicated. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fisher-yates.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSMutableArray * array = [[NSMutableArray alloc] init];
        
        for (NSInteger i = 0; i < 10; i++)
            [array addObject:[NSNumber numberWithInteger:i]];
        
        [Fisher_yates shuffle:array];
        
        NSLog(@"Shuffle result: %@", array);

    }
    return 0;
}

