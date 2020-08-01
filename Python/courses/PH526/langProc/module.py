from collections import Counter

def read_book(title_path):
  '''
  Read a book and return it as a string.
  '''
  with open(title_path, 'r', encoding = 'utf8') as current_file:
    text = current_file.read()
    text.replace('\n','').replace('\r','')
  return text


def word_stats(word_counts):
  '''
  Return num of unique words and word frequencies.
  '''
  num_unique = len(word_counts)
  counts = word_counts.values()
  return (num_unique, counts)


def count_words(text, method = 1):
  '''
  Count the num of times each word occurs in text (str). Return dictionary where keys are unique words and values are word.
  '''
  text = text.lower()
  skips = ['.', ',', ';', ':', '?', '!', '(', ')',
           '[', ']', '<', '>', '|', '/', '"', "'",
           '~', '`', '@', '#', '$', '%', '^', '&',
           '*', '+', '-']
  for ch in skips:
    text = text.replace(ch, '')
  if method == 1:
    word_counts = {}
    for word in text.split(' '):
      if word in word_counts:
        word_counts[word] += 1
      else:
        word_counts[word] = 1
  else:
    word_counts = Counter(text.split(" "))
  return word_counts

