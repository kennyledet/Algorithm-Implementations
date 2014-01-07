//
//  Fisher-yates.m
//  Algorithms
//
//  Created by intoxicated on 1/4/14.
//  Copyright (c) 2014 intoxicated. All rights reserved.
//

#import "Fisher-yates.h"

@implementation Fisher_yates

+ (void)shuffle:(NSMutableArray *)array
{
    int swapIndex;
    id temp;
    
    for(int i = (int)array.count - 1; i > 0; --i)
    {
        swapIndex = arc4random() % i;
        
        temp = [array objectAtIndex:i];
        [array replaceObjectAtIndex:i withObject:[array objectAtIndex:swapIndex]];
        [array replaceObjectAtIndex:swapIndex withObject:temp];
    }
}

@end
