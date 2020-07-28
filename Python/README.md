# Roads to Python3

## File Structure

 `lsn` 目录下为学习阶段的示例程序，有如下子文件夹：

* `python-intro`: [计算机科学和 PYTHON 编程导论（自主模式）](http://www.xuetangx.com/courses/course-v1:MITx+6_00_1x+sp/courseware/Week_1/videosequence:Lecture_1/)
* `python-res`: [Using Python for Research](https://courses.edx.org/courses/course-v1:HarvardX+PH526x+2T2018/course/)
* `python-app`: [Analytics in Python](https://courses.edx.org/courses/course-v1:ColumbiaX+BAMM.101x+3T2018/course/)
* `python-micro`: [Introduction to Python: Creating Scalable, Robust, Interactive Code](https://courses.edx.org/courses/course-v1:Microsoft+DEV330x+3T2018/course/)

## Dependencies

### Intro

* `NumPy`：模块包名称为 `numpy`，这里是 [`NumPy`-intro](http://www.numpy.org/)。
* `SciPy`：模块包名称为 `scipy`，这里是 [`SciPy`-intro](http://www.scipy.org/)。
* `StatsModels`：模块包名称为 `statsmodels`，这里是 [`StatsModels`-intro](http://www.statsmodels.org/stable/index.html)。
* `Pandas`：模块包名称为 `pandas`，这里是 [`Pandas`-intro](http://pandas.pydata.org/)。
* `Matplotlib`：模块包名称为 `matplotlib`，这里是 [`Matplotlib`-intro](https://matplotlib.org/)。
* `Cartopy`：模块包名称为 `cartopy`，这里是 [`Cartopy`-intro](https://scitools.org.uk/cartopy/docs/latest/index.html)。
* `NetworkX`：模块包名称为 `networkx`，这里是 [`NetworkX`-intro](http://networkx.github.io/)。
* `SciKitLearn`：模块包名称为 `scikit-learn`，这里是 [`SciKitLearn`-intro](http://scikit-learn.org/stable/)。

### Import

载入上述模块的常用代码如下

``` python
# import NumPy
import numpy as np

# import SciPy
import scipy as sp
import scipy.stats as ss

# import StatsModels
import statsmodels as sm

# import Pandas
import pandas as pd

# import Matplotlib
import matplotlib.pyplot as plt
import matplotlib.colors as colors
from mpl_toolkits.mplot3d import Axes3D

# import Cartopy
import cartopy.crs as ccrs
import cartopy.feature as cfeature

# import NetworkX
import networkx as nx

# import SciKitLearn
import sklearn
```
