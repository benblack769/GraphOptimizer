import pickle
import gzip
import group
import numpy as np
from c_platform import Platform
import c_lib
import compiler
import random
import math
import copy

def load_data():
    """Return the MNIST data as a tuple containing the training data,
    the validation data, and the test data.

    The ``training_data`` is returned as a tuple with two entries.
    The first entry contains the actual training images.  This is a
    numpy ndarray with 50,000 entries.  Each entry is, in turn, a
    numpy ndarray with 784 values, representing the 28 * 28 = 784
    pixels in a single MNIST image.

    The second entry in the ``training_data`` tuple is a numpy ndarray
    containing 50,000 entries.  Those entries are just the digit
    values (0...9) for the corresponding images contained in the first
    entry of the tuple.

    The ``validation_data`` and ``test_data`` are similar, except
    each contains only 10,000 images.
    """
    f = gzip.open('testdata/mnist.pkl.gz', 'rb')
    training_data, validation_data, test_data = pickle.load(f,encoding='latin1')
    f.close()
    return (training_data, validation_data, test_data)

def load_data_wrapper():
    """Return a tuple containing ``(training_data, validation_data,
    test_data)``. Based on ``load_data``, but the format is more
    convenient for use in our implementation of neural networks.

    In particular, ``training_data`` is a list containing 50,000
    2-tuples ``(x, y)``.  ``x`` is a 784-dimensional numpy.ndarray
    containing the input image.  ``y`` is a 10-dimensional
    numpy.ndarray representing the unit vector corresponding to the
    correct digit for ``x``.

    ``validation_data`` and ``test_data`` are lists containing 10,000
    2-tuples ``(x, y)``.  In each case, ``x`` is a 784-dimensional
    numpy.ndarry containing the input image, and ``y`` is the
    corresponding classification, i.e., the digit values (integers)
    corresponding to ``x``.

    Obviously, this means we're using slightly different formats for
    the training data and the validation / test data.  These formats
    turn out to be the most convenient for use in our neural network
    code."""
    tr_d, va_d, te_d = load_data()
    training_data = [(list(x),vectorized_result(y)) for x,y in zip(tr_d[0],tr_d[1])]
    validation_data = [(list(x),(y)) for x,y in zip(va_d[0],va_d[1])]
    test_data = [(list(x),(y)) for x,y in zip(te_d[0],te_d[1])]
    return (training_data, validation_data, test_data)

def vectorized_result(j):
    """Return a 10-dimensional unit vector with a 1.0 in the jth
    position and zeroes elsewhere.  This is used to convert a digit
    (0...9) into a corresponding desired output from the neural
    network."""
    e = [0.0]*10
    e[j] = 1.0
    return e


def sigmoid(g):
    one = g.platform.add_const(1.0)
    zero = g.platform.add_const(0.0)
    g = zero - g
    return one / (one + g.make_new_un(g.platform.mathlib.approx_exp))

def sig_deriv(sigged_val):
    one = sigged_val.platform.add_const(1.0)
    return sigged_val * (one - sigged_val)

def dot_prod(vec1,vec2):
    sum = vec1.platform.add_const(0.0)
    for v1,v2 in zip(vec1,vec2):
        sum = sum + v1 * v2
    return sum

def mat_vec_prod(mat,vec):
    sum = vec.platform.add_group(len(mat))
    for n in range(len(mat)):
        sum[n] = dot_prod(mat[n],vec)
    return sum

def forward_prop(bias,weights,prevact):
    act = bias + mat_vec_prod(weights, prevact)
    return sigmoid(act)

def back_prop(err,weights,prevactivs):
    sum = prevactivs.platform.add_const([0.0]*len(prevactivs))
    for i in range(len(err)):
        sum = sum + weights[i] * err[i]

    return sum * sig_deriv(prevactivs)

def grad_descent(err,weights,bias,prevact,lambda_g):
    for i in range(len(err)):
        adj_err = err[i]*lambda_g
        weights[i] = weights[i] - adj_err * prevact

    bias.assign(bias - err * lambda_g)

def back_desc(err,weights,bias,prevact,lambda_g):
    preverr = back_prop(err,weights,prevact)
    grad_descent(err,weights,bias,prevact,lambda_g)
    return preverr

def basic_train(lambda_g,HidBias,OutBias,IHWeights,HOWeights,InActivs,OutExpected):
    #forward propogation
    HidActivs = forward_prop(HidBias,IHWeights,InActivs)
    OutActivs = forward_prop(OutBias,HOWeights,HidActivs)

    #error getting
    OutErr = OutActivs - OutExpected

    #enables backpropogation
    HidErr = back_desc(OutErr,HOWeights,OutBias,HidActivs,lambda_g)
    grad_descent(HidErr,IHWeights,HidBias,InActivs,lambda_g)

    return HidBias,OutBias,IHWeights,HOWeights,HidActivs

def basic_test(HidBias,OutBias,IHWeights,HOWeights,InActivs):
    #forward propogation
    HidActivs = forward_prop(HidBias,IHWeights,InActivs)
    OutActivs = forward_prop(OutBias,HOWeights,HidActivs)

    return OutActivs

def count_correct(outexp,outreal):
    count_cor = 0
    for exp,real in zip(outexp,outreal):
        if exp == real:
            count_cor += 1

    return count_cor

def make_rand_weights(plat,insize,outsize):
    weightrand = lambda: random.normalvariate(0.0,1.0/math.sqrt(insize))
    return [plat.add_const([weightrand()
                for n in range(insize)])
                    for i in range(outsize)]

def make_basic_net(data,in_size,out_size,hid_size,lambda_c):
    random.seed(2)
    plat = Platform("net",c_lib)
    InActiv = plat.add_group(in_size)
    HidActiv = plat.add_group(hid_size)
    OutActiv = plat.add_group(out_size)

    HidErr = plat.add_group(hid_size)
    OutErr = plat.add_group(out_size)

    HidBias = plat.add_const([0.0]*hid_size)
    OutBias = plat.add_const([0.0]*out_size)

    IHWeights = make_rand_weights(plat,in_size,hid_size)
    HOWeights = make_rand_weights(plat,hid_size,out_size)
    old_IH = [copy.copy(og) for og in IHWeights]
    old_HO = [copy.copy(og) for og in HOWeights]

    old_hb = copy.copy(HidBias)
    old_ob = copy.copy(OutBias)

    lambda_g = plat.add_const(lambda_c)
    InActivs = plat.add_group(in_size)
    OutExpected = plat.add_group(out_size)
    print("\n\n\n\nfinished!\n\n\n\n\n\n\n")
    out_HidBias,out_OutBias,out_IHWeights,out_HOWeights,out_hidact = basic_train(lambda_g,HidBias,OutBias,IHWeights,HOWeights,InActiv,OutExpected)
    final_out = basic_test(out_HidBias,out_OutBias,out_IHWeights,out_HOWeights,InActiv)

    train_kern = plat.make_kernel([InActiv,OutExpected],[old_hb,old_ob]+old_IH+old_HO,[out_HidBias,out_OutBias]+out_IHWeights+out_HOWeights,[],[])
    test_kern = plat.make_kernel([InActiv],[],[],[final_out],[old_hb,old_ob]+old_IH+old_HO)

    plat.compile()
    '''plat.init_consts()
    num_epocs = 10
    for e in range(num_epocs):
        plat.run(train_kern,[[d[0],d[1]] for d in data[0]])

        plat.run(test_kern,[[vd[0]] for vd in data[1]])

        test_outs = test_kern.get_outputs()
        test_kern.clear_outputs()

        corr = count_correct([dv[1] for dv in data[1]],
                        [t.index(max(t)) for t in test_outs])

        perc_cor = corr / len(data[1])

        print("In epoc: ",e)
        print("Guessed ",perc_cor,"% correctly")'''


data = load_data_wrapper()
compiler.print_debug("data loaded")
make_basic_net(data,784,10,30,0.01)
