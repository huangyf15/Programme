### Decision trees and tree Search

## Base Class: binaryTree
class binaryTree(object):
  def __init__(self, value):
    self.value = value
    self.leftBranch = None
    self.rightBranch = None
    self.parent = None
  def setLeftBranch(self, node):
    self.leftBranch = node
  def setRightBranch(self, node):
    self.rightBranch = node
  def setParent(self, parent):
    self.parent = parent
  def getValue(self):
    return self.value
  def getLeftBranch(self):
    return self.leftBranch
  def getRightBranch(self):
    return self.rightBranch
  def getParent(self):
    return self.parent
  def __str__(self):
    return self.value


## DFS/BFS and their variants
# Depth First Search
def DFSBinary(root, fcn):
  '''
  I: fcn returns whether the objective is the present node
  '''
  stack = [root]
  while len(stack) > 0:
    print('at node ' + str(stack[0].getValue()))
    if fcn(stack[0]):
      return True
    else:
      temp = stack.pop(0)
      if temp.getRightBranch():
        stack.insert(0, temp.getRightBranch())
      if temp.getLeftBranch():
        stack.insert(0, temp.getLeftBranch())
  return False

# Breadth First Search
def BFSBinary(root, fcn):
  '''
  I: fcn returns whether the objective is the present node
  '''
  queue = [root]
  while len(queue) > 0:
    print('at node ' + str(queue[0].getValue()))
    if fcn(queue[0]):
      return True
    else:
      temp = queue.pop(0)
      if temp.getLeftBranch():
        queue.append(temp.getLeftBranch())
      if temp.getRightBranch():
        queue.append(temp.getRightBranch())
  return False

# suppose the tree is ordered
def DFSBinaryOrdered(root, fcn, ltFcn):
  '''
  I: fcn returns whether the objective is the present node,
    ltFcn returns whether the objective is lt the present node
  '''
  stack = [root]
  while len(stack) > 0:
    if fcn(stack[0]):
      return True
    elif ltFcn(stack[0]):
      temp = stack.pop(0)
      if temp.getLeftBranch():
        stack.insert(0, temp.getLeftBranch())
    else:
      temp = stack.pop(0)
      if temp.getRightBranch():
        stack.insert(0, temp.getRightBranch())
  return False

# return the path that got to the goal
def DFSBinaryPath(root, fcn):
  '''
  I: fcn returns whether the objective is the present node
  '''
  stack = [root]
  while len(stack) > 0:
    if fcn(stack[0]):
      return TracePath(stack[0])
    else:
      temp = stack.pop(0)
      if temp.getRightBranch():
        stack.insert(0, temp.getRightBranch())
      if temp.getLeftBranch():
        stack.insert(0, temp.getLeftBranch())
  return False

def TracePath(node):
  if not node.getParent():
    return [node]
  else:
    return [node] + TracePath(node.getParent())

# DFS binary search with no loop
def DFSBinaryNoLoop(root, fcn):
  '''
  I: fcn returns whether the objective is the present node
  '''
  stack = [root]
  seen = []
  while len(stack) > 0:
    print('at node ' + str(stack[0].getValue()))
    if fcn(stack[0]):
      return True
    else:
      temp = stack.pop(0)
      seen.append(temp)
      if temp.getRightBranch():
        if not temp.getRightBranch() in seen:
          stack.insert(0, temp.getRightBranch())
      if temp.getLeftBranch():
        if not temp.getLeftBranch() in seen:
          stack.insert(0, temp.getLeftBranch())
  return False


## Decision tree
#- for efficiency should really generate on the fly, but here will build and then search

# To build a decision tree
def buildDTree(sofar, todo):
  if len(todo) == 0:
    return binaryTree(sofar)
  else:
    withelt = buildDTree(sofar + [todo[0]], todo[1:])
    withoutelt = buildDTree(sofar, todo[1:])
    here = binaryTree(sofar)
    here.setLeftBranch(withelt)
    here.setRightBranch(withoutelt)
    return here

# Implicit decision tree for DFS
def DTImplicit(toConsider, avail):
  if toConsider == [] or avail == 0:
    result = (0, ())
  elif toConsider[0][1] > avail:
    result = DTImplicit(toConsider[1:], avail)
  else:
    nextItem = toConsider[0]
    withVal, withToTake = DTImplicit(toConsider[1:], avail - nextItem[1])
    withVal += nextItem[0]
    withoutVal, withoutToTake = DTImplicit(toConsider[1:], avail)
    if withVal > withoutVal:
      result = (withVal, withToTake + (nextItem,))
    else:
      result = (withoutVal, withoutToTake)
  return result

# Basic decision search
def DFSDTree(root, valueFcn, constraintFcn):
  stack = [root]
  best = None
  visited = 0
  while len(stack) > 0:
    visited += 1
    if constraintFcn(stack[0].getValue()):
      if best == None:
        best = stack[0]
        print(best.getValue())
      elif valueFcn(stack[0].getValue()) > valueFcn(best.getValue()):
        best = stack[0]
        print(best.getValue())
      temp = stack.pop(0)
      if temp.getRightBranch():
        stack.insert(0, temp.getRightBranch())
      if temp.getLeftBranch():
        stack.insert(0, temp.getLeftBranch())
    else:
      stack.pop(0)
  print('visited = ', visited)
  return best

def BFSDTree(root, valueFcn, constraintFcn):
  queue = [root]
  best = None
  visited = 0
  while len(queue) > 0:
    visited += 1
    if constraintFcn(queue[0].getValue()):
      if best == None:
        best = queue[0]
        print(best.getValue())
      elif valueFcn(queue[0].getValue()) > valueFcn(best.getValue()):
        best = queue[0]
        print(best.getValue())
      temp = queue.pop(0)
      if temp.getLeftBranch():
        queue.append(temp.getLeftBranch())
      if temp.getRightBranch():
        queue.append(temp.getRightBranch())
    else:
      queue.pop(0)
  print('visited = ', visited)
  return best

# Decision search that is good enough but need not be the best
def DFSDTreeGoodEnough(root, valueFcn, constraintFcn, stopFcn):
  stack = [root]
  best = None
  visited = 0
  while len(stack) > 0:
    visited += 1
    if constraintFcn(stack[0].getValue()):
      if best == None:
        best = stack[0]
        print(best.getValue())
      elif valueFcn(stack[0].getValue()) > valueFcn(best.getValue()):
        best = stack[0]
        print(best.getValue())
      if stopFcn(best.getValue()):
        print('visited = ', visited)
        return best
      temp = stack.pop(0)
      if temp.getRightBranch():
        stack.insert(0, temp.getRightBranch())
      if temp.getLeftBranch():
        stack.insert(0, temp.getLeftBranch())
    else:
      stack.pop(0)
  print('visited = ', visited)
  return best

def BFSDTreeGoodEnough(root, valueFcn, constraintFcn, stopFcn):
  queue = [root]
  best = None
  visited = 0
  while len(queue) > 0:
    visited += 1
    if constraintFcn(queue[0].getValue()):
      if best == None:
        best = queue[0]
        print(best.getValue())
      elif valueFcn(queue[0].getValue()) > valueFcn(best.getValue()):
        best = queue[0]
        print(best.getValue())
      if stopFcn(best.getValue()):
        print('visited = ', visited)
        return best
      temp = queue.pop(0)
      if temp.getLeftBranch():
        queue.append(temp.getLeftBranch())
      if temp.getRightBranch():
        queue.append(temp.getRightBranch())
    else:
      queue.pop(0)
  print('visited = ', visited)
  return best


