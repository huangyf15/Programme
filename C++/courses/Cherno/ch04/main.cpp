#include <iostream>

#define LOG(x) std::cout << x << std::endl

void increment(int& value) {
  value++;
};

int main() {
  int var = 8;
  int* ptr = &var;
  *ptr = 10;
  int** pptr = &ptr;
  LOG(var<<*ptr<<*pptr);

  int& ref = var;
  increment(var);
  LOG(ref);

  std::cin.get();
}