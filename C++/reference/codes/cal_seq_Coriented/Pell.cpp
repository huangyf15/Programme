#include "Pell.h"

using namespace std;

vector<unsigned int> Pell::_elems;

void Pell::gen_elems(int pos) const {
  if (_elems.empty()) {
    _elems.push_back(1);
    _elems.push_back(2);
  }

  if (_elems.size() <= pos) {
    int ix = _elems.size();
    int n_2 = _elems[ix-2], n_1 = _elems[ix-1];

    int elem;
    for (; ix <= pos; ++ix) {
      elem = n_2 + 2 * n_1; 
      _elems.push_back(elem);
      n_2 = n_1; n_1 = elem;
    }
  }
}
