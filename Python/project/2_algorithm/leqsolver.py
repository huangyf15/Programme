#! /usr/bin/python3
# -*- coding: utf-8 -*-
"""Linear equation solvers.

NAME
  leqsolver

DESCRIPTION

  Direct method
  =============

    cholesky - one based on cholesky decomposition
    gauss - one based on L-U decomposition

  Iteration method
  ================

    jacobi - Jacobi iteration method
    gs_sor - Gauss-Seidel/SOR iteration method
    conjgrad - conjugate gradient method
"""

import os
import sys
from tqdm import tqdm
from time import sleep
import math
import numpy as np
from numpy import matlib as matlib
import scipy as sp
from scipy import linalg as linalg
from matplotlib import pyplot as plt


def cholesky(A, b, ind=0, eps=1e-15):
  """Cholesky decomposition method to solve A*x = b

  Solve L in A = L*L.T, and then L*y = b, L.T*x = y

  Parameters
  ----------
  A,b : array_like
        coefficient matrix and RHS vector
  ind : int, optional
        index for Tikhonov regularization method
        - When ind = 0 (default), preprocessing is omitted.
  eps : float, optional
        perturbation value in Tikhonov regularization 
        method

  Returns
  -------
  x : solution of A*x = b

  """
  test_compatibility(A,b)
  if ind == 1:
    [A,b] = cal_tikhonov(A,b,eps)
  elif ind != 0:
    print("Error: Preprocessing index is wrong!")
    sys.exit()
  L = linalg.cholesky(A,lower=True)
  x_temp = linalg.solve(L,b)
  return linalg.solve(L.T,x_temp)

def gauss(A, b, ind=0, eps=1e-15):
  """Gauss L-U decomposition method to solve A*x = b

  Solve P,L,U in A = P*L*U, and then P*L*y = b, U*x = y

  Parameters
  ----------
  A,b : array_like
        coefficient matrix and RHS vector
  ind : int, optional
        index for Tikhonov regularization method
        - When ind = 0 (default), preprocessing is omitted.
  eps : float, optional
        perturbation value in Tikhonov regularization 
        method

  Returns
  -------
  x : solution of A*x = b

  """
  test_compatibility(A,b)
  if ind == 1:
    [A,b] = cal_tikhonov(A,b,eps)
  elif ind != 0:
    print("Error: Preprocessing index is wrong!")
    sys.exit()
  P,L,U = linalg.lu(A)
  x_temp = linalg.solve(P@L,b)
  return linalg.solve(U,x_temp)

def cal_tikhonov(A, b, eps):
  I = matlib.eye(A.shape[0])
  T = A.T@A
  A_Tik = eps*I + T
  b_Tik = A.T@b
  return A_Tik, b_Tik


def jacobi(A, b, M=3e6, eps=1e-15):
  """Jacobi iteration method to solve A*x = b

  Parameters
  ----------
  A,b : array_like
        coefficient matrix and RHS vector
  M : int, optional
        maximum of iteration step
  eps : float, optional
        threshold of convergence

  Returns
  -------
  x : solution of A*x = b

  """
  test_compatibility(A,b)
  # extract the required info
  n = A.shape[0]
  D = np.diag(np.diag(A))
  L = -np.tril(A,-1)
  U = -np.triu(A,1)
  # construct the iteration equation
  f = linalg.inv(D)@b
  B = linalg.inv(D)@(L+U)
  # do the iteration
  x_old = matlib.zeros([n,1])
  x_new = B@x_old + f
  niter = 0
  while (linalg.norm(x_new-x_old) > eps and niter < M):
    x_old = x_new
    x_new = B@x_old + f
    niter = niter + 1
  return x_new, niter

def gs_sor(A, b, omg=1.0, M=3e6, eps=1e-15):
  """Gauss-Seidel/SOR iteration method to solve A*x = b

  Parameters
  ----------
  A,b : array_like
        coefficient matrix and RHS vector
  omg : float, optional
        relaxation factor. When omg = 1.0 (default),
        SOR method reduces to Gauss-Seidel method.
  M : int, optional
        maximum of iteration step
  eps : float, optional
        threshold of convergence

  Returns
  -------
  x : solution of A*x = b

  """
  test_compatibility(A,b)
  # extract the required info
  n = A.shape[0]
  D = np.diag(np.diag(A))
  L = -np.tril(A,-1)
  U = -np.triu(A,1)
  # construct the iteration equation
  f = omg*linalg.inv(D-omg*L)@b
  B = linalg.inv(D-omg*L)@((1-omg)*D + omg*U)
  # do the iteration
  x_old = matlib.zeros([n,1])
  x_new = B@x_old + f
  niter = 1
  while (linalg.norm(x_new-x_old) > eps and niter < M):
    x_old = x_new
    x_new = B@x_old + f
    niter = niter + 1
  return x_new, niter


def conjgrad(A, b, ind=0, M=3e6, eps=1e-15):
  """Conjugate gradient method to solve A*x = b

  Parameters
  ----------
  A,b : array_like
        coefficient matrix and RHS vector
  ind : int, optional
        index for various preprocessing methods
        - When ind = 0 (default), preprocessing is omitted.
  M : int, optional
        maximum of iteration step
  eps : float, optional
        threshold of convergence

  Returns
  -------
  x : solution of A*x = b

  """
  test_compatibility(A,b)
  n = A.shape[0]
  if ind in [1]:
    [A,b,F] = cal_iterpre(A,b)
  elif ind != 0:
    print("Error: Preprocessing index is wrong!")
    sys.exit()
  x_old = matlib.zeros([n,1])
  r_old = b - A@x_old
  p_old = r_old
  d = np.dot(r_old.T,r_old)/np.dot(p_old.T,A@p_old)
  x_new = x_old + p_old@d
  r_new = r_old - (A@p_old)@d
  f = np.dot(r_new.T,r_new)/np.dot(r_old.T,r_old)
  p_new = r_new + p_old@f
  niter = 1
  while (linalg.norm(x_new-x_old) > eps and niter < M):
    x_old = x_new
    p_old = p_new
    r_old = r_new
    d = np.dot(r_old.T,r_old)/np.dot(p_old.T,A@p_old)
    x_new = x_old + p_old@d
    r_new = r_old - (A@p_old)@d
    f = np.dot(r_new.T,r_new)/np.dot(r_old.T,r_old)
    p_new = r_new + p_old@f
    niter = niter + 1
    print(niter,linalg.norm(x_new-x_old))
  if ind == 1:
    x_new = F.T@x_new
  return x_new, niter

def cal_iterpre(A, b, ind=1):
  if ind == 1:
    F_Jac = np.diag(pow(np.diag(A),0.5))
    A_Jac = F_Jac@(A@F_Jac.T)
    b_Jac = F_Jac.T@b
  return A_Jac, b_Jac, F_Jac

def test_compatibility(A,b):
  if A.ndim != 2 or A.shape[0] != A.shape[1]:
    print("Error: Input matrix is not 2D square matrix!")
    sys.exit()
  elif b.shape[1] != 1 or b.shape[0] != A.shape[0]:
    print("Error: RHS vector is not compatible with coefficient matrix!")
    sys.exit()


def test_direct_solver(f,n):
  H = linalg.hilbert(n)
  x0 = matlib.ones([n,1])
  b = H@x0
  x = np.arange(-14,-10,0.05)
  y = []
  for xi in tqdm(x):
    yi = f(H,b,ind=1,eps=10**xi)
    y.append(linalg.norm(x0-yi,ord=np.inf))
    sleep(0.01)
  plt.title(f.__name__.capitalize()+" results for "+ \
      "$H_{"+str(n)+"}\bf{x}=\bf{b}$")
  plt.xlabel("log(Tikhonov perturbation)")
  plt.ylabel("Infinite-norm error")
  plt.plot(x,y)
  plt.show()

def test_simpleit_solver(n):
  H = linalg.hilbert(n)
  x0 = matlib.ones([n,1])
  b = H@x0
  x = np.arange(0.1,2.0,0.1)
  y1 = []
  y2 = []
  #x1, niter = jacobi(H,b)
  #print(x1,niter)
  for xi in tqdm(x):
    x1, niter = gs_sor(H,b,omg=xi,eps=1e-15)
    y1.append(math.log(linalg.norm(x0-x1,ord=np.inf),10))
    y2.append(niter)
    sleep(0.01)
  fig, left_axis = plt.subplots()
  right_axis = left_axis.twinx()
  plt.title("SOR results for $H_{"+str(n)+"}\bf{x}=\bf{b}$")
  left_axis.plot(x,y1,'ro-')
  left_axis.set_xlabel("Relaxation coefficient")
  left_axis.set_ylabel("log(Infinite-norm error)",color='r')
  left_axis.tick_params(axis='y',colors='r')
  right_axis.plot(x,y2,'bo-')
  right_axis.set_xlabel("Same")
  right_axis.set_ylabel("Iteration step",color='b')
  right_axis.tick_params(axis='y',colors='b')
  plt.show()

def test_conjgrad_solver(n):
  H = linalg.hilbert(n)
  x0 = matlib.ones([n,1])
  b = H@x0
  x = [0,1]
  y1 = []
  y2 = []
  for xi in tqdm(x):
    x1, niter = conjgrad(H,b,ind=xi,eps=1e-15)
    y1.append(linalg.norm(x0-x1,ord=np.inf))
    y2.append(niter)
    sleep(0.01)
  fig, left_axis = plt.subplots()
  right_axis = left_axis.twinx()
  plt.title("Conjugate gradient results for "+ \
      "$H_{"+str(n)+"}\bf{x}=\bf{b}$")
  left_axis.plot(x,y1,'ro-')
  left_axis.set_xlabel("Preprocessing index")
  left_axis.set_ylabel("Infinite-norm error",color='r')
  left_axis.tick_params(axis='y',colors='r')
  right_axis.plot(x,y2,'bo-')
  right_axis.set_xlabel("Same")
  right_axis.set_ylabel("Iteration step",color='b')
  right_axis.tick_params(axis='y',colors='b')
  plt.show()


if __name__ == '__main__':
  #test_direct_solver(gauss,40)
  test_simpleit_solver(10)
  #test_conjgrad_solver(10)