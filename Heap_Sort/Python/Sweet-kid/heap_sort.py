#!/usr/bin/env python

def heap_sort( array ) :
    heap_size = len( array )
    build_max_heap( array )
    for i in range( len( array ) - 1, 0, -1 ):
        temp = array[ 0 ]
        array[ 0 ] = array[ i ]
        array[ i ] = temp
        heap_size -= 1
        max_heapify( array, 0, heap_size )

def build_max_heap( array ):
    for i in range( int( len(array) / 2 ) - 1, -1, -1 ):
        max_heapify( array, i, len( array ) )

def max_heapify( array, i, size ):
    l = left( i )
    r = right( i )
    largest = i;

    if( l < size and array[ l ] > array[ i ] ):
        largest = l

    if( r < size and array[ r ] > array[ largest ] ):
        largest = r

    if( largest != i ):
        temp = array[ i ]
        array[ i ] = array[ largest ]
        array[ largest ] = temp
        max_heapify( array, largest, size )

def parent( i ):
    return int( ( i + 1 ) / 2 ) - 1

def left( i ):
    return 2 * i + 1

def right( i ):
    return 2 * i + 2

def print_array( array ):
    for i in range( 0, len(array) ):
        print array[ i ],

    print "\n\n"
