#nice object for storing a number with a value
class NumVal:
    def __init__(self,num,value):
        self.num = num
        self.value = value
    def __hash__(self):
        return (self.num << 4) ^ self.value.__hash__()
    def __lt__(self,other):
        return self.num < other.num
    def __le__(self,other):
        return self.num <= other.num
    def __eq__(self,other):
        return self.num == other.num
    def __ne__(self,other):
        return self.num != other.num
    def __gt__(self,other):
        return self.num > other.num
    def __ge__(self,other):
        return self.num >= other.num
    def __repr__(self):
        return "(num: %s value: %s)"%(self.num,self.value)
    def __str__(self):
        return self.__rep__()