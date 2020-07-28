#include<iostream>
using namespace std;
void swapVal(int a, int b) { 
  int temp = a;
  a = b;
  b = temp;
}

void swapRef(int &a, int &b) { 
  int temp = a;
  a = b;
  b = temp;
}

void swapFalse(int *pa, int *pb) { 
  int *temp = pa;
  pa = pb;
  pb = temp;
}

int main() {
  int x = 5, y = 10;
  cout <<"x = "<< x <<" y = "<< y << endl;
  swapVal(x,y);
  cout <<"x = "<< x <<" y = "<< y << endl;
  swapRef(x,y);
  cout <<"x = "<< x <<" y = "<< y << endl;
  swapFalse(&x,&y);
  cout <<"x = "<< x <<" y = "<< y << endl;
  return 0;
}
