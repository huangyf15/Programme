#include "NumSeq.h"
#include "Fibonacci.h"
#include "Pell.h"

void test1() {
  Fibonacci fib;
  cout << "beginning at element 1 for 1 element: " << fib << endl;

  Fibonacci fib2(16);
  cout << "beginning at element 1 for 16 element: " << fib2 << endl;

  Fibonacci fib3(8, 12);
  cout << "beginning at element 12 for 8 element: " << fib3 << endl;
}

void test2() {
  const int pos = 8;

  Fibonacci fib;
  display(fib, pos);

  Pell pell;
  display(pell, pos);
}

int main() {
  test1();
  test2();
  return 0;
}