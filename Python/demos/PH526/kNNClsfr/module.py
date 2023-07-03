import numpy as np
import scipy.stats as ss
import matplotlib.pyplot as plt
from matplotlib.colors import ListedColormap as clrL

def generate_synth_data(n=50):
  '''
  Create two sets of points from bivariate normal distributions.
  '''
  points = np.concatenate((ss.norm(0,1).rvs((n,2)),
                           ss.norm(1,1).rvs((n,2))),
                           axis=0)
  outcomes = np.concatenate((np.repeat(0, n),
                             np.repeat(1, n)))
  return (points, outcomes)


def distance(p1, p2):
  '''
  I: p1 and p2 are np.array s
  Func: find the distance between points p1 and p2
  '''
  return np.sqrt(np.sum(np.power(p2 - p1, 2)))


def majority_vote(votes, method = 1):
  '''
  I: votes a list that consists of different vote
  Func: return the most common element in votes
  '''
  if method == 1:
    mode, count = ss.mstats.mode(votes)
    return mode
  else:
    import random
    vote_counts = {}
    for vote in votes:
      if vote in vote_counts:
        vote_counts[vote] += 1
      else:
        vote_counts[vote] = 1
    winners = []
    max_counts = max(vote_counts.values())
    for vote, count in vote_counts.items():
      if count == max_counts:
        winners.append(vote)
    return random.choice(winners)


def find_nearest_neighbors(p, points, k=5):
  '''
  I: p the central point, points the other points
  Func: find the k-nearest neighbors of point p and return their indices.
  '''
  distances = np.zeros(points.shape[0])
  for i in range(len(distances)):
    distances[i] = distance(p, points[i])
  ind = np.argsort(distances)
  return ind[:k]


def knn_predict(p, points, outcomes, k=5, method=1):
  '''
  I: p the central point, points the other points, outcomes the marks of each point
  Func: find k-nearest neighors and predict the class of based on majority vote
  '''
  assert len(points) == len(outcomes), 'Error: Inconsistent length between points and outcomes.'
  ind = find_nearest_neighbors(p, points, k)
  return majority_vote(outcomes[ind], method)


def make_prediction_grid(predictors, outcomes, 
    limits, h, k, method=1):
  '''
  Classify each point on the prediction grid.
  '''
  assert len(limits) == 4, \
    'Error: Length of limits is not equal to 4.'
  (x_min, x_max, y_min, y_max) = limits
  xs = np.arange(x_min, x_max, h)
  ys = np.arange(y_min, y_max, h)
  (xx, yy) = np.meshgrid(xs, ys)
  prediction_grid = np.zeros(xx.shape, dtype = int)
  for i,x in enumerate(xs):
    for j,y in enumerate(ys):
      p = np.array([x,y])
      prediction_grid[j,i] = \
        knn_predict(p, predictors, outcomes, k,
          method)
  return (xx, yy, prediction_grid)


def plot_prediction_grid(xx, yy, prediction_grid,
    predictors, outcomes, filename):
  '''
  Plot KNN predictions for every point on the grid.
  '''
  background_colormap = clrL(
      ["hotpink","lightskyblue", "yellowgreen"])
  observation_colormap = clrL(["red","blue","green"])
  plt.figure(figsize = (10,10))
  plt.pcolormesh(xx, yy, prediction_grid,
      cmap = background_colormap, alpha = 0.5)
  plt.scatter(predictors[:,0],predictors[:,1],s = 50,
      cmap = observation_colormap, c = outcomes)
  plt.xlabel('Variable 1'); plt.ylabel('Variable 2')
  plt.xticks(()); plt.yticks(())
  plt.xlim(np.min(xx), np.max(xx))
  plt.ylim(np.min(yy), np.max(yy))
  plt.savefig(filename)

