def findRoot(base, power, eps):
  '''
  ===== function findRoot(base, power, eps) =====
  M: to use bisection search to find the root
  I: base and eps int of float, power an int
    epsilon > 0 & power >= 1
  O: returns a float y s.t. y**power is within eps of x
  If such a real float does not exit, it return None
  =================== end doc ===================
  '''
  if base < 0 and power%2 == 0:
    print('Value does not exist!')
    return None
  low = min(-1,base)
  high = max(1,base)
  ans = (high + low)/2.0
  while abs(ans**power - base) >= eps:
    if ans**power < base:
      low = ans
    else:
      high = ans
    ans = (high + low)/2.0
  return ans

print(findRoot.__doc__)

print('========== Find the root ==========')
baseInput = float(input('Enter the base value (>= 1): '))
expInput = int(input('Enter the integer power: '))
epsInput = float(input('Enter the precision: '))
print(findRoot(baseInput, expInput, epsInput))
