#include <sstream>
#include <sstream>
//using namespace std;
template <class T>
int string_to_int(const T &x){
    std::stringstream s;
    s << x;
    int r;
    s >> r;
    return r;
}
