from c_platform import Platform
from compiler import print_debug
import c_lib as refrence_lib
import math
plat = Platform("test",refrence_lib)

test_size = 10
test_list = [float(x) for x in range(test_size)]
cl1 = [float(3)]*test_size
cl2 = [float(5)]*test_size

med_group1 = plat.add_const(cl1)
med_group2 = plat.add_const(cl2)
in_group = plat.add_group(test_size)
in_group2 = plat.add_group(test_size)

def test_fn_test(inter1,inter2,add):
    return inter1 + inter1,inter2 + inter1,add + inter2
def test_fn(inter1,inter2,add,add2):
    arg1 = inter2 * add + add * add + inter1 * inter2
    arg2 = arg1 * inter1
    out = inter1 + add * inter2 + inter2 + inter1 * inter1 + inter2 * inter2 + add
    exp_thing = add#add.make_new_un(refrence_lib.approx_exp)
    return inter1+inter2,inter2 + add + add2,out+exp_thing
def pytest_fn(inter1,inter2,add,add2):
    arg1 = inter2 * add + add * add + inter1 * inter2
    arg2 = arg1 * inter1
    out = inter1 + add * inter2 + inter2 + inter1 * inter1 + inter2 * inter2 + add
    exp_thing = add#math.exp(10)
    return inter1+inter2,inter2 + add + add2,out+exp_thing

def get_l(i):
    return [x for x in range(test_size)]

int1,int2,out = test_fn(med_group1,med_group2,in_group,in_group2)

print("data run")
test_kern = plat.make_kernel([in_group,in_group2],[med_group1,med_group2],[int1,int2],[out],[])

print("kernel made")
plat.compile()
print("compiled")
plat.init_consts()
print("initted")
times_run = 300
plat.run(test_kern,[[get_l(i),get_l(i+1)] for i in range(times_run)])

outs = test_kern.get_outputs()
#for oi in range(times_run):
#    outs[oi] = [d for d in outs[oi]]
print_debug("refrence test completed")
#print(outs)
#print([f for f in plat.get_data(med_group1)])
#print([f for f in plat.get_data(med_group2)])
#print([f for f in plat.get_data(in_group)])

tot_out = []
inter_l1 = cl1
inter_l2 = cl2
for i in range(times_run):
    pyout = [0]*test_size
    newl = get_l(i)
    newl2 = get_l(i+1)
    for x in range(test_size):
        inter_l1[x],inter_l2[x],pyout[x] = pytest_fn(inter_l1[x],inter_l2[x],newl[x],newl2[x])
    tot_out.append(pyout)

if tot_out == outs:
    print("same")
else:
    print("differnt")
    print(outs)
    print()
    print(tot_out)

print_debug("python implementation completed")
