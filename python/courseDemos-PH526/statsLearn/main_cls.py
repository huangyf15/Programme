from module import *
from sklearn.linear_model import LogisticRegression

# Set the parameters
n = 1000
h = 1.5
sd1 = 1
sd2 = 1.5

# Generate and plot the data
x1, y1, x2, y2 = gen_data(n, h, sd1, sd2)
plot_data(x1, y1, x2, y2)
plt.savefig('fig/cls_data.pdf')
plt.close()

# Make the logistic regression
clf = LogisticRegression()
X = np.vstack((np.vstack((x1, y1)).T, np.vstack((x1, y1)).T))
y = np.hstack((np.repeat(1, n), np.repeat(2, n)))
X_train, X_test, y_train, y_test = \
    train_test_split(X, y, train_size=0.5, random_state=1)
clf.fit(X_train, y_train)
clf.score(X_test, y_test)

# Compute and plot the redictive probabilities across the grid
plt.figure(figsize=(5,10))
ax = plt.subplot(211)
plot_probs(ax, clf, 0)
plt.title('Pred. prob for class 1')
ax = plt.subplot(212)
plot_probs(ax, clf, 1)
plt.title('Pred. prob for class 2')
plt.savefig('fig/cls_pred.pdf')
plt.close()
