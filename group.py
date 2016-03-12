class Group:
    def __init__(self,data,plat):
        self.data = data
        self.platform = plat

    def assign(self,other):
        self.data = other.data

    '''the convinence operator overloads interface'''
    def __mul__(self,other):
        return self.make_new_bin(other,self.platform.mathlib.mul)
    def __add__(self,other):
        return self.make_new_bin(other,self.platform.mathlib.add)
    def __sub__(self,other):
        return self.make_new_bin(other,self.platform.mathlib.sub)
    def __truediv__(self,other):
        return self.make_new_bin(other,self.platform.mathlib.div)

    def make_new_bin(self,other,oper):
        #allows scalar operations on vector groups
        if self.platform != other.platform:
            raise CompileError("groups of differnt platforms combined, not allowed")
        elif len(self) == 1:
            mydat = self.data[0]
            newd = [self.platform.generate_bin(oper,mydat,do) for do in other.data]
        elif len(other) == 1:
            otherdat = other.data[0]
            newd = [self.platform.generate_bin(oper,ds,otherdat) for ds in self.data]
        else:
            if len(self) != len(other):
                raise CompileError("groups of different sizes (not one) operated on")
            newd = [self.platform.generate_bin(oper,ds,do) for ds,do in zip(self.data,other.data)]
        return Group(newd,self.platform)

    def make_new_un(self,oper):
        #allows scalar operations on vector groups
        newd = [self.platform.generate_un(oper,d) for d in self.data]
        return Group(newd,self.platform)

    def __len__(self):
        return len(self.data)
    '''This is considered an iterator that returns a sequence of Groups that contain a single item, a specific data location'''
    def __next__(self):
        return Group([next(self.d_iter)],self.platform)
    def __iter__(self):
        self.d_iter = iter(self.data)
        return self
    def __getitem__(self,loc):
        #todo see if you can get the slice syntax working
        d_slice = self.data.__getitem__(loc)
        if isinstance(d_slice, list):
            return Group([d_slice],self.platform)# for d in d_slice]
        else:
            return Group([d_slice],self.platform)
    def __setitem__(self,loc,newd):
        if len(newd) == 1:
            self.data[loc] = newd.data[0]
        else:
            raise CompileError("setitem called with attept to set data equal to multiple data")
    def extend(self,other):
        self.data += other.datas

def concatenate(groups):
    if len(groups) == 0:
        return Group([],None)# prevents zero data groups

    newdata = []
    plat = groups[0].platform
    for g in groups:
        newdata.extend(g.data)
        if g.platform != plat:
            raise CompileError("Concatenation of groups of different platforms not allowed")

    return Group(newdata,plat)

def run(times,function,num_outs,start_inputs,newinputs):
    final_outs = [[] for on in range(num_outs)]
    if times == 0:
        return final_outs
    #newinputs is assumed to be a list of lists of inputs
    new_fn = platform.compile_fun(function,newinputs[0],start_inputs)

    for t in range(times):
        outs = new_fn.run_once(newinputs[t])
        #moves final output to final_outs
        for on in range(num_outs):
            final_outs[on].append(outs[on])

    return final_outs
