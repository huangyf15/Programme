#ifndef EXP06_EMPLOYEE_H_
#define EXP06_EMPLOYEE_H_

#include <iostream>

using namespace std;

class Employee {
 public:
  Employee(char *n='\0', char *add='\0', char *ct='\0', char *cd='\0')
      : name(n), address(add), city(ct), code(cd) {}

  void display() {
    cout << "Name: " << name << endl;
    cout << "Address: " << address << endl;
    cout << "City: " << city << endl;
    cout << "Code: " << code << endl;
  }

  void change_name(char *nm) { name = nm; }

 private:
  char *name;
  char *address;
  char *city;
  char *code;
};

#endif