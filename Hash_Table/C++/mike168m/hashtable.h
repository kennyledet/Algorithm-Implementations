#ifndef _HASH_TABLE
#define _HASH_TABLE

// A hash table implemented using Horner's rule and separate chaining

#include <vector>
#include <list>
#include <string>
#include <iostream>
#include <algorithm>

class Hashtable
{
private:
    unsigned int size;
    std::vector<std::list<std::string>> table;

    // calculate hash using horner's rule for values of type std::string
    unsigned int calculateHash(const std::string& key) const {
        unsigned hash = 0;

        for (char ch: key) {
            hash = 37 * hash + static_cast<unsigned>(ch);
        }

        return hash % size;
    }

    // check the linked list for a value
    // return true if found and false other wise
    inline bool checkList(std::list<std::string>& linkedList, const std::string& value) const {
        if (std::find(begin(linkedList), end(linkedList), value) != end(linkedList)) {
            return true;
        }
        return false;
    }

    // Prints an std::list
    inline void print(const std::list<std::string>& list, std::ostream& os = std::cout) const {
        for (auto& val : list) { os << "[" << val << "]->"; }
    }

public:
    // Constructor - tableSize is the size of the table
    // the defualt size is 11
    explicit Hashtable(int tableSize = 11)
        :size(tableSize)
    {
        table = std::vector<std::list<std::string>>(tableSize);
    }

    // adds an element to the table
    void insert(const std::string& value) {
        auto& chainList = table[calculateHash(value)];

        // check if value exists in linked list
        if (!checkList(chainList, value)) {
            chainList.push_back(value);
        }
    }

    // Removes an element from the table
    void remove(const std::string& value) {
        auto& chainList = table[calculateHash(value)];

        if (std::find(begin(chainList), end(chainList), value) != end(chainList)) {
            // element found remove it
            chainList.remove(value);
            std::cout << "value removed\n";
        }
    }

    // Prints the hash table
    void print(std::ostream& os = std::cout) const {
        for (auto& val : table) {
            print(val, os);
        }
        os << "\n";
    }
};

#endif // _HASH_TABLE
