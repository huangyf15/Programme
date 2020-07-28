#include <iostream>
using namespace std;

// fun0() 具有二义性，需要用类名限定进行访问；与此同时，这里也存在同名隐藏。

// Question: 如何通过 Derive 类对象调用基类函数 fun0()？
// Answer: 用虚基类机制可以解决这一问题，成员对象亦然。

class Base0 { // 定义基类 Base0
public:
  Base0(int var) : var0(var) { }
  Base0() : Base0(0) { }
  int var0;
  void fun0() {
    cout << "Member of Base0" << endl;
  }
};
class Base1: virtual public Base0 { // 定义派生类 Base1
public:
  Base1(int var) : Base0(var) { }
  Base1() : Base1(0) { }
  int var1;
  void fun0() {
    cout << "Member of Base1" << endl;
  }
};
class Base2: virtual public Base0 { // 定义派生类 Base2
public:
  Base2(int var) : Base0(var) { }
  Base2() : Base2(0) { }
  int var2;
  void fun0() {
    cout << "Member of Base2" << endl;
  }
};

class Derived: public Base1, public Base2{ // 定义派生类 Derived
public:
  Derived(int var) : Base0(var), Base1(var), Base2(var) { }
  Derived() : Derived(0) { }
  int var;
  void fun0() {
    cout << "Member of Derived" << endl;
  }
};

int main() {    //程序主函数
  Derived d;
  d.Base0::fun0();
  d.Base1::fun0();
  d.Base2::fun0();
  d.fun0();
  d.var0 = 2;
  return 0;
}
