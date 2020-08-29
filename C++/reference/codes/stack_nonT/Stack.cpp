#include "Stack.h"

#include <iostream>
#include <string>
#include <vector>

using namespace std;

bool Stack::push(const string &elem) {
  if (full())
    return false;

  _stack.push_back(elem);
  return true;
}

bool Stack::pop(string &elem) {
  if (empty())
    return false;

  elem = _stack.back();
  _stack.pop_back();
  return true;
}

bool Stack::peek(string &elem) {
  if (empty())
    return false;

  elem = _stack.back();
  return true;
}

void Stack::display() {
  for (auto _s : _stack)
    cout << _s << ' ';
  cout << endl;
}

bool Stack::find(const string &elem) {
  if (empty())
    return false;
  
  for (auto _s : _stack)
    if (_s == elem)
      return true;
  return false;
}

int Stack::count(const string &elem) {
  int count_num = 0;

  if (empty())
    return count_num;
  
  for (auto _s : _stack)
    if (_s == elem)
      ++count_num;

  return count_num;
}