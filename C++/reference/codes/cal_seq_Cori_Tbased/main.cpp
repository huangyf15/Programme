#include "NumSeq.h"
#include "NumericSeq.h"
#include "Fibonacci.h"
#include "Pell.h"

void test1() {
  Fibonacci<1> fib;
  cout << "beginning at element 1 for 1 element: " << fib << endl;

  Fibonacci<16> fib2;
  cout << "beginning at element 1 for 16 element: " << fib2 << endl;

  Fibonacci<12,8> fib3;
  cout << "beginning at element 12 for 8 element: " << fib3 << endl;
}

void test2() {
  const int pos = 8;

  Fibonacci<1> fib;
  display(fib, pos);

  Pell<1> pell;
  display(pell, pos);
}

void test3() {
  NumericSequence<fibonacci> ns_fib(12);
  cout << ns_fib << endl;
}


int main() {
  test1();
  test2();
  test3();
  return 0;
}