from module import *

print('')
print('===== class Person =====')
me = Person('William Eric Grimson')
print('me.name = '+ str(me))
foo = 'William Eric Grimson'
print(foo.split(' '))
print(foo.split(' ')[-1])
print('me.getLastName() = '+ str(me.getLastName()))
me.setBirthday(1,2,1927)
print('me.birthday = ' + str(me.birthday))
print('me.getAge() = ' + str(me.getAge()))
her = Person('Cher')
print('her.getLastName() = '+ str(her.getLastName()))
plist = [me, her]
print('')
print('Before sorting:')
for p in plist: print(str(p))
plist.sort()
print('')
print('After sorting:')
for p in plist: print(str(p))

print('')
print('===== class MITPerson(Person) =====')
p1 = MITPerson('Eric')
p2 = MITPerson('John')
p3 = MITPerson('John')
p4 = Person('John')
print('p1: '+ str(p1))
print('p2: '+ str(p2))
print('p3: '+ str(p3))
print('p4: '+ str(p4))
print('p1.idNum = '+ str(p1.getIdNum()))
print('p2.idNum = '+ str(p2.getIdNum()))
print('p1 < p2: ' + str(p1 < p2))
print('p3 < p2: ' + str(p3 < p2))
print('p4 < p1: ' + str(p4 < p1))

print('')
print('===== class Student(MITPerson) =====')
s1 = UnderGrad('Fred', 2016)
s2 = Grad('Angela', 2015)
print('is s1 Student?: ' + str(isStudent(s1)))
print('is s2 Student?: ' + str(isStudent(s2)))

print('')
print('===== class Grade(object) =====')
# create students
ug1 = UnderGrad('Jane Doe', 2014)
ug2 = UnderGrad('John Doe', 2015)
ug3 = UnderGrad('David Henry', 2003)
g1 = Grad('John Henry', 2013)
g2 = Grad('George Steinbrenner', 2008)
# add students to six00
six00 = Grades()
six00.addStudent(g1)
six00.addStudent(ug2)
six00.addStudent(ug1)
six00.addStudent(g2)
# add grade to six00
for s in six00.allStudents():
  six00.addGrade(s, 75)
six00.addGrade(g1, 100)
six00.addGrade(g2, 25)
# add students without grade to six00
six00.addStudent(ug3)
# print the student out
print('-- Student list --')
for s in six00.allStudents():
  print(s)
# print the report out
print('-- Grade report --')
print(gradeReport(six00))
print('')
