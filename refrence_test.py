from c_platform import Platform
from compiler import print_debug
import c_lib as refrence_lib
import math
plat = Platform("test",refrence_lib)

test_size = 5
cl1 = [float(3)]*test_size
cl2 = [float(5)]*test_size

med_group1 = plat.add_init_group(cl1)
med_group2 = plat.add_init_group(cl2)
in_group = plat.add_input_group(test_size)
in_group2 = plat.add_input_group(test_size)

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
    return [x +i for x in range(test_size)]

int1,int2,out = test_fn(med_group1,med_group2,in_group,in_group2)

print_debug("data run")
test_kern = plat.make_kernel([in_group,in_group2],[med_group1,med_group2],[int1,int2],[out],[])

print_debug("kernel made")
plat.compile()
print_debug("compiled")
plat.init_vals()
print_debug("initted")
times_run = 5
plat.run(test_kern,[[get_l(i),get_l(i+1)] for i in range(times_run)])

outs = list(test_kern.get_outputs())
c_tot_outs = []
for o in outs:
    c_tot_outs += o

print_debug("refrence test completed")

tot_out = []
inter_l1 = cl1
inter_l2 = cl2
for i in range(times_run):
    pyout = [0]*test_size
    newl = get_l(i)
    newl2 = get_l(i+1)
    for x in range(test_size):
        inter_l1[x],inter_l2[x],pyout[x] = pytest_fn(inter_l1[x],inter_l2[x],newl[x],newl2[x])
    tot_out += pyout

if tot_out == c_tot_outs:
    print("same")
else:
    print("differnt")
    print(c_tot_outs)
    print()
    print(tot_out)

print_debug("python implementation completed")
