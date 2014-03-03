#include <stdio.h>

#define SIZE 10

void print_array( int *array, int size );
int parent( int i );
int left( int i );
int right( int i );
void max_heapify( int * array, int i, int size );
void build_max_heap( int * array, int size );
void heap_sort( int * array, int size );
void max_heapify_iterative( int * array, int i, int size );
int test_sorted_array( int * array, int size );

int main() {
  int array[] = { 10, 9, 8, 7, 6, 5, 4, 3, 2, 1 };

  printf("Unsorted array : \n");
  print_array( array, SIZE );

  heap_sort( array, SIZE );

  printf("Sorted array : \n");
  print_array( array, SIZE );

  printf("Testing if array is actually sorted or not...\n");
  if( test_sorted_array( array, SIZE ) ) {
    printf("Array is sorted.\n");
  } else {
    printf("Array is not sorted.\n");
  }
}

void print_array( int * array, int size ) {
  int i = 0;

  for( i = 0; i < size; i++ ) {
    printf("%d ", array[ i ]);
  }

  printf("\n\n");
}

int parent( int i ) {
  return (int)( ( i + 1 )/ 2 ) - 1;
}

int left( int i ) {
  return i * 2 + 1;
}

int right( int i ) {
  return 2 * i + 2;
}

void max_heapify( int * array, int i, int size ) {
  int l = left( i );
  int r = right( i );
  int largest, temp;

  if( l <= (size - 1) && array[ l ] > array[ i ] ) {
    largest = l;
  } else {
    largest = i;
  }

  if( r <= (size - 1) && array[ r ] > array[ largest ] ) {
    largest = r;
  }

  if( largest != i ) {
    temp = array[ i ];
    array[ i ] = array[ largest ];
    array[ largest ] = temp;
    max_heapify( array, largest, size );
  }

}

void max_heapify_iterative( int * array, int i, int size ) {
  int l, r, largest, temp;

  while( 1 ) {
    l = left( i );
    r = right( i );

    if( l <= (size - 1) && array[ l ] > array[ i ] ) {
      largest = l;
    } else {
      largest = i;
    }

    if( r <= (size - 1) && array[ r ] > array[ largest ] ) {
      largest = r;
    }

    if( largest != i ) {
      temp = array[ i ];
      array[ i ] = array[ largest ];
      array[ largest ] = temp;
      i = largest;
    } else {
      break;
    }
  }
}

void build_max_heap(int * array, int size) {
  int i;
  for( i = (int)( size / 2 ) - 1; i >= 0; i-- ) {
    max_heapify( array, i, size );
  }
}

void heap_sort( int * array, int size ) {
  int i, temp, heap_size = size;
  build_max_heap( array, size );
  for( i = size - 1; i > 0; i-- ) {
    temp = array[ i ];
    array[ i ] = array[ 0 ];
    array[ 0 ] = temp;
    max_heapify( array, 0, --heap_size);
  }
}

int test_sorted_array( int * array, int size ) {
  int i;

  for( i = 0; i < size - 2; i++ ) {
    if( array[ i ] > array[ i + 1 ] ) {
      return 0;
    }
  }

  return 1;
}
