#include "BinaryTree.h"

using namespace std;

template <typename valType>
bool BTnode<valType>::find_value(const valType &val) const {
  if (val == _val) return true; 
  
  if (val < _val) {
    if (!_lchild)
      return false;
    else
      return _lchild->find_value(val);
  } else {
    if (!_rchild)
      return false;
    else
      return _rchild->find_value(val);
  }
}

template <typename elemType>
ostream &BinaryTree<elemType>::
print(ostream &os, void (BinaryTree::*traversal)(ostream &) const) const {
  (this->*traversal)(os);
  return os;
}
