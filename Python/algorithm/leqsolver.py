#! /usr/bin/python3
# -*- coding: utf-8 -*-

import sys
import numpy as np
from numpy import matlib as matlib
from numpy import linalg as np_linalg
import scipy as sp
from scipy import linalg as sp_linalg

def cholesky(M,b,ind=0,*eps):
  if M.ndim != 2 or M.shape[0] != M.shape[1]:
    print("Error: Input matrix is not square matrix!")
    sys.exit()
  if ind == 0:
    R = np_linalg.cholesky(M)
    x_temp = np_linalg.solve(R.T,b)
    return np_linalg.solve(R,x_temp)
  elif ind == 1:
    [M_Tik, b_Tik] = cal_tikhonov(M,b,eps)
    R_Tik = np_linalg.cholesky(M_Tik)
    x_temp = np_linalg.solve(R_Tik.T,b_Tik)
    return np_linalg.solve(R_Tik,x_temp)
  else:
    print("Error: Tikhonov index is wrong!")
    sys.exit()


def cal_tikhonov(M,b,eps):
    I = matlib.eye(M.shape[0])
    T = np.matmul(M.T,M)
    M_Tik = np.multiply(eps,I) + T
    b_Tik = np.matmul(T,b)
    return M_Tik, b_Tik


if __name__ == '__main__':
  n = int(input('Please input the dimension of Hilbert matrix: '))
  H = sp_linalg.hilbert(n)
  x0 = matlib.ones([n,1])
  b = np.matmul(H,x0)
  #x = cholesky(H,b)
  x = cholesky(H,b,1,1.0e-12)
  print(H,'\n\n',x)
  