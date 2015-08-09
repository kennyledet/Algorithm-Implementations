//
//  MergeSort.h
//  Playground
//
//  Created by Greg Price on 8/9/15.
//  Copyright (c) 2015 Gregory Price. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MergeSort : NSObject

+ (NSMutableArray *)execute:(NSMutableArray *)numbers
                      start:(NSInteger)start
                        end:(NSInteger)end;

@end
