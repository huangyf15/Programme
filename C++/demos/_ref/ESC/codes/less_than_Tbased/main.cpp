#include <iostream>
#include <string>
#include <functional>
#include <algorithm>

using namespace std;

template <typename elemType>
class LessThan {
 public:
  LessThan(const elemType &val) : _val(val) {}
  bool operator () (const elemType &_value) const { return _value < _val; }

  void val(const elemType &newval) { _val = newval; }
  elemType val() const { return _val; }

 private:
  elemType _val;
};

template <typename elemType, typename Comp = less<elemType>>
class LessThanPred {
 public:
  LessThanPred(const elemType &val) : _val(val) {}
  bool operator () (const elemType &val) const { return compare(val, _val); }

  void val(const elemType &newval) { _val = newval; }
  elemType val() const { return _val; }

 private:
  Comp compare; // need instantiation while using functor (which is a class type)
  elemType _val;
};

class StringLen {
 public:
  bool operator () (const string &s1, const string &s2) const {
    return s1.size() < s2.size();
  }
};

int main() {
  LessThan<int> lti(1024);
  LessThan<string> lts("Pooh");
  cout << lti(100) << " " << lts("A") << endl;

  LessThanPred<int> ltpi(1024);
  LessThanPred<string, StringLen> ltps("Pooh");
  cout << ltpi(100) << " " << ltps("A") << endl;

  return 0;
}