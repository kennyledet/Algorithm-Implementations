#include <iostream>
#include "hashtable.h"

int main() {
	Hashtable table;
	table.insert("abc");
	table.insert("yoga"); 
	table.insert("abc"); // adding value again not allowed

	table.remove("xyz"); // value not removed -- does not exist in chain
	table.remove("abc"); // value removed
}