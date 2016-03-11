import numbers
from compiler import CompileError

class BasicNode:
    def __init__(self,marker):
        #self.is_output = False 
        self.marker = marker#marker must be hashable
        #self.dests = []
        #self.depth = None#graph depth decided in compilation
    #def add_dest(self,dest):
    #    self.dests.append(dest)
    def __hash__(self):
        return self.marker
    def __eq__(self,other):
        return False if not isinstance(other,BasicNode) else self.marker == other.marker
    #def __repr__(self):
    #    return str(self.marker)
    #__str__ = __repr__

class UnOpNode(BasicNode):
    def __init__(self,marker,sourcenode,oper):
        super().__init__(marker)
        #self.is_output = False

        self.source = sourcenode

        #sourcenode.add_dest(self)

        self.oper = oper

class BinOpNode(BasicNode):
    def __init__(self,marker,leftnode,rightnode,oper):
        super().__init__(marker)
        #self.is_output = False

        self.left = leftnode
        self.right = rightnode

        #leftnode.add_dest(self)
        #rightnode.add_dest(self)

        self.oper = oper
        
'''class InputNode(BasicNode):
    def __init__(self,info):
        super().__init__()
        pass
    '''
class ConstNode(BasicNode):
    def __init__(self,marker,value):
        super().__init__(marker)
        self.val = value