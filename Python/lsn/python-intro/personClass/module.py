import datetime

# Person
class Person(object):

  def __init__(self, name):
    """create a person called name"""
    self.name = name
    self.birthday = None
    self.lastName = name.split(' ')[-1]

  def getLastName(self):
    """return self's last name"""
    return self.lastName

  def setBirthday(self,month,day,year):
    """sets self's birthday to birthDate"""
    self.birthday = datetime.date(year,month,day)

  def getAge(self):
    """returns self's current age in days"""
    if self.birthday == None:
      raise ValueError
    return int((datetime.date.today() - self.birthday).days
                /365.0)

  def __lt__(self, other):
    """return True if self's name is lexicographically
       less than other's name, and False otherwise"""
    if self.lastName == other.lastName:
      return self.name < other.name
    return self.lastName < other.lastName

  def __str__(self):
    """return self's name"""
    return self.name

class MITPerson(Person):

  nextIdNum = 0 # next ID number to assign

  def __init__(self, name):
    Person.__init__(self, name) # initialize Person attributes
    # new MITPerson attribute: a unique ID number
    self.idNum = MITPerson.nextIdNum
    MITPerson.nextIdNum += 1

  def getIdNum(self):
    return self.idNum

  # sorting MIT people uses their ID number, not name!
  def __lt__(self, other):
    return self.idNum < other.idNum

# Student
class Student(MITPerson):
  pass

class UnderGrad(Student):

  def __init__(self, name, classYear):
    MITPerson.__init__(self, name)
    self.year = classYear

  def getClass(self):
    return self.year

class Grad(Student):

  def __init__(self, name, classYear):
    MITPerson.__init__(self, name)
    self.year = classYear

  def getClass(self):
    return self.year

class TransferStu(Student):
  pass

def isStudent(obj):
  return isinstance(obj, Student)

# Grades
class Grades(object):
  """A mapping from students to a list of grades"""
  def __init__(self):
    """Create empty grade book"""
    self.students = []  # list of Student objects
    self.grades = {}    # maps idNum -> list of grades
    self.isSorted = True # true if self.students is sorted

  def addStudent(self, student):
    """Assumes: student is of type Student
       Add student to the grade book"""
    if student in self.students:
      raise ValueError('Duplicate student')
    self.students.append(student)
    self.grades[student.getIdNum()] = []
    self.isSorted = False

  def addGrade(self, student, grade):
    """Assumes: grade is a float
       Add grade to the list of grades for student"""
    try:
      self.grades[student.getIdNum()].append(grade)
    except KeyError:
      raise ValueError('Student not in grade book')

  def getGrades(self, student):
    """Return a list of grades for student"""
    try:    # return copy of student's grades
      return self.grades[student.getIdNum()][:]
    except KeyError:
      raise ValueError('Student not in grade book')

  def allStudents(self):
    """Return a list of the students in the grade book"""
    if not self.isSorted:
      self.students.sort()
      self.isSorted = True
    for s in self.students: # use generator to get the list
      yield s
#    return self.students[:] # return copy of list of students

def gradeReport(course):
  """Assumes: course is of type Grades"""
  report = []
  for s in course.allStudents():
    tot = 0.0
    numGrades = 0
    for g in course.getGrades(s):
      tot += g
      numGrades += 1
    try:
      average = tot/numGrades
      report.append(str(s) + '\'s mean grade is '
                    + str(average))
    except ZeroDivisionError:
      report.append(str(s) + ' has no grades')
  return '\n'.join(report)

