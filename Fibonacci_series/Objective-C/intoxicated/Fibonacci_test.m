//
//  main.m
//  Fibonacci
//
//  Created by intoxicated on 1/4/14.
//  Copyright (c) 2014 intoxicated. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fibonacci.h"

#define SIZE 15 //change this to see difference
                //first recursive method would take much longer if size exceeds 45

#define RESET(obj) [obj resetWithSize:SIZE];

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Fibonacci * test = [Fibonacci initFibWith:SIZE];
        
        NSDate *methodStart = [NSDate date];
        NSLog(@"Recursive %d th Fibonacci: %lu", SIZE,[test recursive:SIZE]);
        NSDate *methodFinish = [NSDate date];
        NSTimeInterval executionTime = [methodFinish timeIntervalSinceDate:methodStart];
        NSLog(@"Execution Time = %f", executionTime);
        
        RESET(test);
        
        methodStart = [NSDate date];
        NSLog(@"Memorized Recursive %dth Fibonacci: %lu", SIZE, [test memorization:SIZE]);
        methodFinish = [NSDate date];
        executionTime = [methodFinish timeIntervalSinceDate:methodStart];
        NSLog(@"Execution Time = %f", executionTime);
        
        RESET(test);

        methodStart = [NSDate date];
        NSLog(@"Speed up more! %dth Fibonacci: %lu", SIZE, [test iter1:SIZE]);
        methodFinish = [NSDate date];
        executionTime = [methodFinish timeIntervalSinceDate:methodStart];
        NSLog(@"Execution Time = %f", executionTime);
        
        RESET(test);
        
        methodStart = [NSDate date];
        NSLog(@"FASTER! %dth Fibonacci: %lu", SIZE, [test iter2:SIZE]);
        methodFinish = [NSDate date];
        executionTime = [methodFinish timeIntervalSinceDate:methodStart];
        NSLog(@"Execution Time = %f", executionTime);
        
        
        
    }
    return 0;
}

