from module import *
from sklearn.linear_model import LinearRegression

# set parameters
n = 500
beta_0 = 5
beta_1 = 2
beta_2 = -1
random_seed = 1

try_ex_1 = False
simple_test = False
try_ex_2 = False
np.random.seed(random_seed)

# Generate example data for single regression
if try_ex_1:
  x = 10 * ss.uniform.rvs(size=n)
  y = beta_0 + beta_1 * x + ss.norm.rvs(loc=0, scale =1, size=n)
  print('')
  print('In example 1:')
  print('')
  print('For random seed', random_seed, ':')
  print('  mean(x) =', np.mean(x))
  print('  mean(y) =', np.mean(y))
  print('')
  plt.figure()
  plt.plot(x, y, 'o')
  xx = np.array([0,8,10])
  plt.plot(xx, beta_0 + beta_1 * xx)
  plt.xlabel('x')
  plt.ylabel('y')
  plt.savefig('fig/reg_ex_1_data.pdf')
  plt.close()

  # A simple test
  if simple_test:
    rss = []
    slopes = np.arange(-10, 15, 0.001)
    for slope in slopes:
      rss.append(compute_rss(estimate_y(x, beta_0, slope), y))
    ind_min = np.argmin(rss)
    plt.plot(slopes, rss)
    plt.xlabel('Slope')
    plt.ylabel('RSS')
    print('')
    print('For RSS estimation:')
    print('  Esitimate for the slope: ', slopes[ind_min])
    print('')
    plt.savefig('fig/reg_ex_1_RSStest.pdf')
    plt.close()

  # Use StatsModels lib for linear regression
  mod = sm.OLS(y, x)
  est = mod.fit()
  print(est.summary())
  X = sm.add_constant(x)
  mod = sm.OLS(y, X)
  est = mod.fit()
  print(est.summary())

# Use SciKitLearn for regression
if try_ex_2:
  # regression and plotting
  x_1 = 10 * ss.uniform.rvs(size=n)
  x_2 = 10 * ss.uniform.rvs(size=n)
  y = beta_0 + beta_1 * x_1 + beta_2 * x_2 + \
      ss.norm.rvs(loc=0, scale =1, size=n)
  X = np.stack([x_1, x_2], axis = 1)
  fig = plt.figure()
  ax = fig.add_subplot(111, projection='3d')
  ax.scatter(X[:,0], X[:,1], c=y)
  ax.set_xlabel('$x_1$')
  ax.set_ylabel('$x_2$')
  ax.set_zlabel('$y$')
  plt.savefig('fig/reg_ex_2_data.pdf')
  plt.close()
  lm = LinearRegression(fit_intercept=True)
  lm.fit(X, y)
  print('')
  print('In example 2:')
  print('                <beta_0,  beta_1,  beta_2>')
  print('  accurate    : ', beta_0, beta_1, beta_2)
  print('  prediction  : ', lm.intercept_, lm.coef_[0], lm.coef_[1])
  print('')
  # accuracy estimation
  X_train, X_test, y_train, y_test = \
      train_test_split(X, y, train_size=0.5, random_state=1)
  lm = LinearRegression(fit_intercept=True)
  lm.fit(X_train, y_train)
  print('')
  print('  Accuracy for test data =', lm.score(X_test, y_test))

