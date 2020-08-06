#include "computeFib.h"

#include <iostream>

using namespace std;

int fib(int n) {
  cout << "Processing fib(" << n << ")...\n";
  if (n < 3) {
    cout << "Return 1!\n";
    return 1;
  } else {
    cout << "Call fib(" << n-1 << ") and fib(" << n-2 <<")...\n";
    return fib(n-1) + fib(n-2);
  }
}

void computeFib() {
  int n, answer;
  cout << "Please input the index:" << endl;
  cin >> n;
  answer = fib(n);
  cout << answer << " is the " << n << "th Fibonacci number.\n";
}