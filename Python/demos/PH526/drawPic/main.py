# import necessary modules
import numpy as np
import matplotlib.pyplot as plt

# define variables
x = np.linspace(0, 10, 20)
y1 = x ** 2.0
y2 = x ** 1.5

# do the plotting
plt.plot(x, y1, 'bo-', linewidth = 2, markersize = 8, label = 'alpha = 2.0')
plt.plot(x, y2, 'gs-', linewidth = 2, markersize = 8, label = 'alpha = 1.5')
plt.xlabel('$X$')
plt.ylabel('$Y$')
plt.axis([-0.5, 10.5, -5, 105])
plt.legend(loc = 'upper left')

# save the figure
plt.savefig('myplot.pdf')

