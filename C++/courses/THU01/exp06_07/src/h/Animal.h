#ifndef EXP07_ANIMAL_H_
#define EXP07_ANIMAL_H_

#include <iostream>

using namespace std;

class Animal {
 public:
  int number;
  int getNumber() { return number; }
  Animal() { cout << "Animal construction." << endl; }
  ~Animal() { cout << "Animal destruction." << endl; }

 protected:
  int age;
};

class Dog : public Animal {
 public:
  Dog() {
    number = 0;
    number++;
    cout << "Dog construction. Number = " << getNumber() << endl;
  }
  ~Dog() {
    number--;
    cout << "Dog destruction. Number = " << getNumber() << endl;
  }
  void SetAge(int n) { age = n; }
};

#endif