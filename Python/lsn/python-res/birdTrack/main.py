from module import *
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import cartopy.crs as ccrs
import cartopy.feature as cfeature
import datetime

# read and modify the bird data for later use
birdData = pd.read_csv('data/bird_tracking.csv')
timestamps = []
for k in range(len(birdData)):
  timestamps.append(datetime.datetime.strptime(
      birdData.date_time.iloc[k][:-3],
      "%Y-%m-%d %H:%M:%S")
  )
birdData['timestamp'] = pd.Series(timestamps, index = birdData.index)

# plot the trajectory
## use the common method
bird_names = pd.unique(birdData.bird_name)
plt.figure(figsize = (7,7))
for bird_name in bird_names:
  iloc = birdData.bird_name == bird_name
  x = birdData.longitude[iloc]
  y = birdData.latitude[iloc]
  plt.plot(x, y, '.', label = bird_name)
plt.xlabel('Longitude')
plt.ylabel('Latitude')
plt.legend(loc = 'lower right')
plt.savefig('fig/traj.pdf')
plt.close()

## use the Cartopy Library
proj = ccrs.Mercator()
plt.figure(figsize = (10,10))
ax = plt.axes(projection = proj)
ax.set_extent((-25.0, 20.0, 52.0, 10.0))
ax.add_feature(cfeature.LAND)
ax.add_feature(cfeature.OCEAN)
ax.add_feature(cfeature.COASTLINE)
ax.add_feature(cfeature.BORDERS, linestyle = ':')
for bird_name in bird_names:
  iloc = birdData.bird_name == bird_name
  x = birdData.longitude[iloc]
  y = birdData.latitude[iloc]
  plt.plot(x, y, '.', label = bird_name,
      transform = ccrs.Geodetic())
plt.legend(loc = 'upper left')
plt.savefig('fig/traj_map.pdf')
plt.close()

# compute and plot the elapsed time with each obsevation
times = birdData.timestamp[birdData.bird_name == 'Eric']
elapsed_time = [time - times[0] for time in times]
elapsed_days = np.array(elapsed_time) / datetime.timedelta(days=1)

plt.plot(elapsed_days)
plt.xlabel('Observation')
plt.ylabel('Elapsed time (days)')
plt.savefig('fig/timeplot.pdf')
plt.close()

# compute and plot the mean daily speed
next_day = 1
inds = []
daily_mean_speed = []
for (i, t) in enumerate(elapsed_days):
  if t < next_day:
    inds.append(i)
  else:
    daily_mean_speed.append(np.mean(birdData.speed_2d[inds]))
    next_day += 1
    inds = []

plt.figure(figsize = (8,6))
plt.plot(daily_mean_speed)
plt.xlabel('Day')
plt.ylabel('Mean speed (m/s)')
plt.savefig('fig/dms.pdf')
plt.close()

