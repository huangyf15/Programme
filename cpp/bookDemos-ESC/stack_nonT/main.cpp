#include "Stack.h"

#include <iostream>

using namespace std;

int main() {
  Stack st;
  string s_temp;
  st.push("a");
  st.push("b");
  st.push("c");
  st.push("a");
  st.push("a");
  st.push("d");

  cout << "pop: " << st.pop(s_temp) << " " << s_temp << endl;
  st.display();
  cout << "peek: " << st.pop(s_temp) << " " << s_temp  << endl;
  st.display();
  cout << "size: " << st.size() << endl;
  cout << "is empty? " << st.empty() << endl;
  cout << "is full? " << st.full() << endl;
  cout << "find e? " << st.find("e") << endl;
  cout << "count a: " << st.count("a") << endl;

  return 0;
}