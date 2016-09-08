#pragma once
#include <string>

class CompCode
{
protected:
    void *handle = nullptr;
public:
    CompCode();
    ~CompCode();
    CompCode(std::string so_name);
    void * get_obj(std::string fn);
    void init(std::string so_name);
};
