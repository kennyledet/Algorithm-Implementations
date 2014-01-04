//
//  BubbleSort_test
//
//  Created by intoxicated on 1/4/14.
//  Copyright (c) 2014 intoxicated. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BubbleSort.h"

#define integer(x) [NSNumber numberWithInt:x]

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        NSMutableArray * array = [[NSMutableArray alloc]
                                  initWithArray:@[integer(5), integer(9), integer(2), integer(7),
                                                  integer(1), integer(8)]];
        NSLog(@"Before sorted: %@", array);
        
        [BubbleSort sort:array];
        
        NSLog(@"After sorted: %@", array);
    }
    return 0;
}

