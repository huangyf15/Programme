from module import translate, read_seq

# input the dna and prt sequence
dna = read_seq('dna.txt')
prt = read_seq('protein.txt')

print('DNA = ' + dna)
print('')
print('protein = ' + prt)
print('')

if prt == translate(dna[20:938])[:-1]:
  print('The translation is correct!')
else:
  print('The translation has sth wrong with it!')
