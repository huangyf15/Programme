# example of function object as parameters
def applyToEach(L, f):
  '''
  I: L is a object list, f a function
  O: f mutates L by replacing each element e, of L by f(e)
  '''
  for i in range(len(L)):
    L[i] = f(L[i])

# example of list of function objects as parameters
def applyFuns(L, strL, x):
  '''
  I: L is a function object list, strL its string 
      version, and x the preimage
  O: output L[:](x) with messages using strL
  '''
  for e in range(len(L)):
    print(strL[e], '(',x,') = ', L[e](x))

# compute the multiplication
def mul(a, b):
  if b == 1:
    return a
  else:
    return a + mul(a, b-1)

# compute the factorial
def fact(n):
  '''
  I: n is an int > 0
  O: returns n!
  '''
  if n == 1:
    return n
  return n*fact(n-1)

# compute the Fibonacci element
def fib(n):
  '''
  I: n is an int >= 0
  O: returns Fibonacci of n
  '''
  assert type(n) == int and n >= 0
  if n == 0 or n == 1:
    return 1
  else:
    return fib(n-1) + fib(n-2)

# solve the Hanoi-tower problem
def hanoiTower(n, fr, to, spare):
  '''
  I: n the num of plates, from the place named 
      "string fr" to string to using string spare
  O: returns the procedure telling how to move 
      the plates
  '''
  def printMove(fr, to):
    print('move from ' + str(fr) + ' to ' + str(to))

  if n == 1:
    printMove(fr, to)
  else:
    hanoiTower(n-1, fr, spare, to)
    hanoiTower(1, fr, to, spare)
    hanoiTower(n-1, spare, to, fr)


# test whether a sentence is palindrome
def isPalindrome(s):
  '''
  I: s is a string
  O: returns a bool telling whether s is palindrome
  '''
  def toChars(s):
    s = s.lower()
    ans = ''
    for c in s:
      if c in 'abcdefghijklmnopqrstuvwxyz':
        ans = ans + c
    return ans

  def isPal(s):
    if len(s) == 1:
      return True
    else:
      return s[0] == s[-1] and isPal(s[1:-1])

  return isPal(toChars(s))

