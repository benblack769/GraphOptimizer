#pragma once
#include <cstdint>
class abstract_block{
public:
    virtual std::string get_declaration() = 0;
    virtual std::string get_func_code() = 0;
    virtual bool operator ==(const abstract_block & other) = 0;
    virtual uint64_t hash_val() = 0;
};
namespace std {
template <>
  struct hash<abstract_block>
  {
    std::size_t operator()(const abstract_block& k) const{
      return k.hash_val();
    }
  };
}
