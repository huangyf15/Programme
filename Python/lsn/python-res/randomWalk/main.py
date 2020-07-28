# import necessary modules
import numpy as np
import matplotlib.pyplot as plt

# generate the random walk
timeStep = 10000
X_0 = np.array([[0],[0]])
delta_X = np.random.normal(0,1,(2,timeStep))
X = np.concatenate((X_0, np.cumsum(delta_X, axis=1)),axis=1)

# do the plotting
plt.plot(X[0], X[1], 'ro-')
plt.title('Random Walk')
plt.show()

# save the figure
plt.savefig('randomWalk.pdf')
