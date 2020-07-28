# write to the file
filename = 'example.txt'
F = open(filename, 'w')
F.write('Python:\nI love Python!')
F.close()

# read from the file
for line in open(filename):
  line = line.rstrip().split(' ')
  print(line)
