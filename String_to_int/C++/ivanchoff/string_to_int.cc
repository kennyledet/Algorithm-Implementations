#include <sstream>
#include <string>

/*
 * Return int from c++ string
 */

int string_to_int(std::string x){
    std::stringstream s;
    s << x;
    int r;
    s >> r;
    return r;
}
