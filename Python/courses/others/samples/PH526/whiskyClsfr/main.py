from module import *
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.cluster.bicluster import SpectralCoclustering

# read in the data
whisky = pd.read_csv('data/whiskies.txt')
whisky['Region'] = pd.read_csv('data/regions.txt')
flavors = whisky.iloc[:, 2:14]

# compute and plot the correlation matrix
corr_flavors = pd.DataFrame.corr(flavors)
plt.figure(figsize = (10,10))
plt.pcolor(corr_flavors)
plt.colorbar()
plt.savefig('fig/corr_flavors.pdf')

corr_whisky = pd.DataFrame.corr(flavors.transpose())
plt.figure(figsize = (10,10))
plt.pcolor(corr_whisky)
plt.axis('tight')
plt.colorbar()
plt.savefig('fig/corr_whisky.pdf')

# cluster whiskies by flavor profile
model = SpectralCoclustering(n_clusters=6, random_state=0)
model.fit(corr_whisky)

# compare corr matrix after clustering
whisky['Group'] = pd.Series(
    model.row_labels_, index = whisky.index)
whisky = whisky.iloc[np.argsort(model.row_labels_)]
whisky = whisky.reset_index(drop = True)
correlations = np.array(pd.DataFrame.corr(
    whisky.iloc[:, 2:14].transpose()))

plt.figure(figsize = (14,7))
plt.subplot(121)
plt.pcolor(corr_whisky)
plt.title('Original')
plt.axis('tight')
plt.subplot(122)
plt.pcolor(correlations)
plt.title('Rearranged')
plt.axis('tight')
plt.savefig('fig/correlations.pdf')

