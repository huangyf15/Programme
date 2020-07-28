from module import *
import pandas as pd
import matplotlib.pyplot as plt
import os

# generate the data frame
stats = pd.DataFrame(columns = ('language', 'author',
                        'title', 'length', 'unique'))
title_num = 1

# extract the file paths
book_dir = './Books'
for language in os.listdir(book_dir):
  lang_dir = book_dir + '/' + language
  for author in os.listdir(lang_dir):
    author_dir = lang_dir + '/' + author
    for title in os.listdir(author_dir):
      inputfile = author_dir + '/' + title
      # fill in the data frame
      text = read_book(inputfile)
      (num_unique, counts) = word_stats(count_words(text))
      stats.loc[title_num] = language, author.capitalize(), title.replace('.txt', ''), sum(counts), num_unique
      title_num += 1

plt.figure(figsize = (10,10))
subset = stats[stats.language == 'English']
plt.loglog(subset.length, subset.unique, 'o', label = 'English', color = 'crimson')
subset = stats[stats.language == 'French']
plt.loglog(subset.length, subset.unique, 'o', label = 'French', color = 'forestgreen')
subset = stats[stats.language == 'German']
plt.loglog(subset.length, subset.unique, 'o', label = 'German', color = 'orange')
subset = stats[stats.language == 'Portuguese']
plt.loglog(subset.length, subset.unique, 'o', label = 'Portuguese', color = 'blueviolet')

plt.legend(['English', 'French', 'German', 'Portuguese'])
plt.xlabel('Book length')
plt.ylabel('Number of unique words')
plt.savefig('lang_plot.pdf')
plt.show()

