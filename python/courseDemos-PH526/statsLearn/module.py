import numpy as np
import scipy.stats as ss
import statsmodels.api as sm
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
from sklearn.model_selection import train_test_split

def compute_rss(y_estimate, y):
  return sum(np.power(y - y_estimate, 2))

def estimate_y(x, b_0, b_1):
  return b_0 + b_1 * x

def gen_data(n, h, sd1, sd2):
  x1 = ss.norm.rvs(-h, sd1, n)
  y1 = ss.norm.rvs(0, sd1, n)
  x2 = ss.norm.rvs(h, sd2, n)
  y2 = ss.norm.rvs(0, sd2, n)
  return(x1, y1, x2, y2)

def plot_data(x1, y1, x2, y2):
  plt.figure()
  plt.plot(x1, y1, 'o', ms=2)
  plt.plot(x2, y2, 'o', ms=2)
  plt.xlabel('$X_1$')
  plt.ylabel('$X_2$')

def plot_probs(ax, clf, class_no):
  xx1, xx2 = np.meshgrid(np.arange(-5, 5, 0.1), np.arange(-5, 5, 0.1))
  probs = clf.predict_proba(np.stack((xx1.ravel(), xx2.ravel()), axis=1))
  Z = probs[:, class_no]
  Z = Z.reshape(xx1.shape)
  CS = ax.contourf(xx1, xx2, Z)
  cbar = plt.colorbar(CS)
  plt.xlabel('$X_1$')
  plt.ylabel('$X_2$')
