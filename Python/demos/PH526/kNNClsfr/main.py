from module import *
from sklearn import datasets
from sklearn.neighbors import KNeighborsClassifier

## Sample 1
# generate the synthetic data
predictors, outcomes = generate_synth_data()

# assign the necessary parameters for test
k = 2
filename = 'fig/knn_synth_2.pdf'
limits = (-3, 4, -3, 4); h = 0.1

# make and plot the prediction grid
(xx, yy, prediction_grid) = make_prediction_grid(
    predictors, outcomes, limits, h, k, method=2)
plot_prediction_grid(xx, yy, prediction_grid,
    predictors, outcomes, filename)

# get the prediction's precision
##! The precision depends on both the way of generation
##!   (i.e. the initial distribution of outcomes) and 
##!   the rule to determine the majority.
##! In fact, the value of precision is a deterministic 
##!   function of the previous two factors, which means
##!    that:
##! 1. the so-called "prediction" is indeed determin-
##!    istic, and
##! 2. it is sure that there is an optimized solution 
##!    for this functional problem (kNN classification).

my_predictions = np.array(
    [knn_predict(p, predictors, outcomes, k)
      for p in predictors])
print("For 2D points:")
print("  my prediction's precision is",
    100 * np.mean(my_predictions == outcomes))

## Sample 2

# get and plot the synthetic data
iris = datasets.load_iris()
predictors = iris.data[:, 0:2]
outcomes = iris.target
colorset = ['ro', 'go', 'bo']
for n in range(3):
  plt.plot(predictors[outcomes==n][:,0], predictors[outcomes==n][:,1], colorset[n])
plt.savefig('fig/iris.pdf')

# assign the necessary parameters for test
k = 5;
filename = 'fig/iris_grid.pdf';
limits = (4, 8, 1.5, 4.5); h = 0.1

# compare the prediction's precision
knn = KNeighborsClassifier(n_neighbors = 5)
knn.fit(predictors, outcomes)
sk_predictions = knn.predict(predictors)
my_predictions = np.array(
    [knn_predict(p,predictors,outcomes,k=5,method=2)
      for p in predictors])

print("For iris data:")
print("  my prediction's precision is",
    100 * np.mean(my_predictions == outcomes))
print("  sk prediction's precision is",
    100 * np.mean(sk_predictions == outcomes))
print("  agreement between my_* and sk_*  is",
    100 * np.mean(sk_predictions == my_predictions))
