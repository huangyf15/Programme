#ifndef __STACK_H__
#define __STACK_H__

#include <string>
#include <vector>
#include <algorithm>

using namespace std;

class Stack {
 public:
  bool push(const string &);
  bool pop(string &elem);
  bool peek(string &elem);

  bool empty() { return _stack.empty(); }
  bool full() { return _stack.size() == _stack.max_size(); }
  int size() { return _stack.size(); }

  void display();
  bool find(const string &);
  int count(const string &);

 private:
  vector<string> _stack;  
};

#endif