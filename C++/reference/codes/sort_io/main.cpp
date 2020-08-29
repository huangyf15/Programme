#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
#include <iterator>

using namespace std;

template <typename elemType>
void display(const vector<elemType> &vec, ostream &os = cout) {
  typename vector<elemType>::const_iterator iter = vec.begin();
  typename vector<elemType>::const_iterator end_it = vec.end();
  for ( ; iter != end_it; ++iter)
    os << *iter << ' ';
  os << endl;
};

void trad_impl() {
  string word;
  vector<string> text;

  cout << "Please input strings: " << endl;
  while (cin >> word)
    text.push_back(word);

  sort(text.begin(), text.end());
  display(text);

  cin.clear();
}

void ioiter_impl() {
  cout << "Please input strings again: " << endl;
  
  istream_iterator<string> is(cin);
  istream_iterator<string> eof;
  vector<string> text;
  copy(is, eof, back_inserter(text));
  sort(text.begin(), text.end());

  ostream_iterator<string> os(cout, " ");
  copy(text.begin(), text.end(), os);

  cin.clear();
}

int main() {
  trad_impl();
  ioiter_impl();
  return 0;
}