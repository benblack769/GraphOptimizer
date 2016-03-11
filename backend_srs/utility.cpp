#include <iostream>
#include "utility.h"
using namespace std;
string read_file(ifstream & file){
    file.seekg(0, std::ios::end);
    size_t size = file.tellg();
    std::string buffer(size, ' ');
    file.seekg(0);
    file.read(&buffer[0], size);
    return buffer;
}
void save_file(string name,string text){
    ofstream f(name);
    f.write(text.c_str(),text.size()*sizeof(text.front()));
}
void ExitError(string errstr){
    cout << "Error: " << errstr << endl;
    exit(1);
}
