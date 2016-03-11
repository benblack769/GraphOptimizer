import time
class CompileError(Exception):
    pass
startt = time.clock()
def print_debug(*args):
    global startt
    if __debug__:
        tot_t = time.clock() - startt
        print(*args)
        print("took ",tot_t," ms")
        startt = time.clock()