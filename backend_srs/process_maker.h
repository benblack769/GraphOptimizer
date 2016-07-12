#include "process.h"
#include <forward_list>
#include <memory>
#include <unordered_set>

struct hash_key{
    process * proc;
    bool operator == (hash_key other) const{
        return proc->is_equal(other.proc);
    }
};
namespace std {
    template <>
    struct hash<hash_key>
    {
        std::size_t operator()(const hash_key& k) const{
            return k.proc->hash_val();
        }
    };
}
class default_process_generator{
public:
    virtual process * store_proc(process & proc){
        process * stored_proc = identical_proc(proc);
        if(stored_proc != nullptr){
            return stored_proc;
        }
        else{
            
        }
    }
protected:
    std::forward_list<std::unique_ptr<process>> arg;
    std::unordered_set<hash_key> proc_set;
    process * identical_proc(process & proc){
        auto proc_it = proc_set.find(hash_key{&proc});
        return (proc_it == proc_set.end()) ? nullptr : proc_it->proc;
    }
    void add_proc(process & proc){
        arg.emplace_front(new process(proc));
        proc_set.insert(hash_key{&proc});
    }
};
