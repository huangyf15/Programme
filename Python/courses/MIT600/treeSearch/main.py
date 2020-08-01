from module import *

n5 = binaryTree(5)
n2 = binaryTree(2)
n1 = binaryTree(1)
n4 = binaryTree(4)
n8 = binaryTree(8)
n6 = binaryTree(6)
n7 = binaryTree(7)
n3 = binaryTree(3)

n5.setLeftBranch(n2)
n2.setParent(n5)
n5.setRightBranch(n8)
n8.setParent(n5)
n2.setLeftBranch(n1)
n1.setParent(n2)
n2.setRightBranch(n4)
n4.setParent(n2)
n8.setLeftBranch(n6)
n6.setParent(n8)
n6.setRightBranch(n7)
n7.setParent(n6)
n4.setLeftBranch(n3)
n3.setParent(n4)


def find6(node):
  return node.getValue() == 6

def find10(node):
  return node.getValue() == 10

def find2(node):
  return node.getValue() == 2

def lt6(node):
  return node.getValue() > 6

print('DFS')
print(DFSBinary(n5, find6))

print('')
print('BFS')
print(BFSBinary(n5, find6))


print('')
print('DFS path')
pathTo6 = DFSBinaryPath(n5, find6)
print([e.getValue() for e in pathTo6])


# =========================================

def sumValues(lst):
  vals = [e[0] for e in lst]
  return sum(vals)

def sumWeights(lst):
  wts = [e[1] for e in lst]
  return sum(wts)

def WeightsBelow10(lst):
  return sumWeights(lst) <= 10

def WeightsBelow6(lst):
  return sumWeights(lst) <= 6

def atLeast15(lst):
  return sumValues(lst) >= 15

a = [6,3]
b = [7,2]
c = [8,4]
d = [9,5]

# treeTest = buildDTree([], [a,b,c,d])
treeTest = buildDTree([], [d,c,b,a])

print('')
print('DFS decision tree')
foobar = DFSDTree(treeTest, sumValues, WeightsBelow10)
print(foobar.getValue())

print('')
print('BFS decision tree')
foobarnew = BFSDTree(treeTest, sumValues, WeightsBelow10)
print(foobarnew.getValue())

print('')
print('DFS decision tree good enough')
foobar = DFSDTreeGoodEnough(treeTest, sumValues, WeightsBelow10, atLeast15)
print(foobar.getValue())

print('')
print('BFS decision tree good enough')
foobarnew = BFSDTreeGoodEnough(treeTest, sumValues, WeightsBelow10,atLeast15)
print(foobarnew.getValue())


# =========================================

stuff = [a,b,c,d]

val, taken = DTImplicit(stuff, 10)

print('')
print('implicit decision search')
print('value of stuff')
print(val)
print('actual stuff')
print(taken)

