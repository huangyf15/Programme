#! /usr/bin/python3
# -*- coding: utf-8 -*-

import os
import sys
import time
import math
from tqdm import tqdm
import numpy as np
from numpy import matlib as matlib
import scipy as sp
from scipy import linalg as linalg
from matplotlib import pyplot as plt

def CFD01_heat1D():
  # input parameters
  L = 1.0
  gamma_0 = 1
  sigma_0 = 1.0
  Nx = 500
  T = [0,1000,2000,4000,8000]
  Nt = np.max(T)
  ind = 2
  # the discrete variables
  u = matlib.zeros(Nx+1)
  x = matlib.zeros(Nx+1)
  t = matlib.zeros(Nt+1)
  dx = L/Nx
  dt = sigma_0*dx*dx/gamma_0
  for i in range(Nx+1):
    x[0,i] = dx*i
    u[0,i] = IC(x[0,i])
  for i in range(Nt+1):
    t[0,i] = dt*i
  # the plot variables
  leng_T = len(T)
  u_plot = matlib.zeros([leng_T,Nx+1])
  d_T = [0]
  for i in range(leng_T-1):
    d_T.append(T[i+1] - T[i])
  # iteration
  time_start = time.time()
  u0 = matlib.zeros(Nx+1)
  if ind == 1:
    for i in range(leng_T):
      for j in range(d_T[i]):
        t_ord = j + T[i-1]
        u[0,0], u[0,Nx] = BC(t[0,t_ord])
        for k in range(1,Nx):
          u0[0,k] = sigma_0*u[0,k+1] + \
            (1-2*sigma_0)*u[0,k] + sigma_0*u[0,k-1]
        u[0,1:(Nx-1)] = u0[0,1:(Nx-1)]
        u0[0,:] = 0.0
      u_plot[i,:] = u
  elif ind == 2:
    Q = matlib.zeros([Nx+1,Nx+1])
    Q[0,0] = 1
    Q[Nx,Nx] = 1
    for k in range(1,Nx):
      Q[k,k-1] = sigma_0
      Q[k,k] = -1 - 2*sigma_0
      Q[k,k+1] = sigma_0
    for i in range(leng_T):
      for j in range(d_T[i]):
        t_ord = j + T[i-1]
        u0 = -u
        u0[0,0], u0[0,Nx] = BC(t[0,t_ord])
        u = followup(Q,u0.T)
        #u[0,:] = u0[0,:]@linalg.inv(Q.T)
        #u[0,:] = linalg.solve(Q,u0[0,:].T).T
      u_plot[i,:] = u
  time_end = time.time()
  print('Total cost: ',time_end-time_start)
  # plot the figure
  for i in range(leng_T):
    plt.plot(x.T,u_plot[i,:].T,label='$T= %i$' % T[i])
  plt.title('Unsteady problem (dt = %e)' % dt)
  plt.legend(loc='upper left')
  plt.show()

def IC(x):
  if x < 0.3:
    f = 0
  elif x < 0.6:
    f = 1
  elif x <= 1.0:
    f = 1 + 2.5*(x-0.6)
  return f

def BC(t):
  bd_l = 0
  bd_r = 2 + math.sin(math.pi*100*t)
  return bd_l, bd_r

def followup(A,b):
  """Thomas solver of A*x = b, where A is a tri-diagonal matrix

  Returns
  -------
  x : solution of A*x = b
  """
  n = A.shape[0]
  d = matlib.ones([n,1])
  a = matlib.ones([n-1,1])
  c = matlib.ones([n-1,1])
  x = matlib.ones(n)
  for i in range(n-1):
    a[i,0] = A[i+1,i]
    c[i,0] = A[i,i+1]
    d[i,0] = A[i,i]
  d[n-1,0] = A[n-1,n-1]
  for i in range(1,n):
    ad = a[i-1,0]/d[i-1,0]
    d[i,0] = d[i,0] - ad*c[i-1,0]
    b[i,0] = b[i,0] - ad*b[i-1,0]
  x[0,n-1] = b[n-1,0]/d[n-1,0]
  for i in range(n-2,-1,-1):
    x[0,i] = (b[i,0]-c[i,0]*x[0,i+1])/d[i,0]
  return x

if __name__ == "__main__":
  CFD01_heat1D()