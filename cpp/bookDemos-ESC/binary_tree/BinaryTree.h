#ifndef __BINARYTREE_H__
#define __BINARYTREE_H__

#include <iostream>

using namespace std;

template <typename elemType>
class BinaryTree;

template <typename valType>
class BTnode {
  friend class BinaryTree<valType>;
 public:
  BTnode(const valType &val) : _val(val) {
    _cnt = 1;
    _lchild = nullptr;
    _rchild = nullptr;
  };
  const valType &value() const { return _val; }
  int occurs() const { return _cnt; }

  void insert_value(const valType &val);
  void remove_value(const valType &val, BTnode * &prev);
  bool find_value(const valType &val) const;

  void preorder(BTnode * pt, ostream &os) const;
  void inorder(BTnode * pt, ostream &os) const;
  void postorder(BTnode * pt, ostream &os) const;
  static void lchild_leaf(BTnode *leaf, BTnode *subtree);

 private:
  valType _val;
  int _cnt;
  BTnode *_lchild;
  BTnode *_rchild;
	void display_val(BTnode *pt, ostream &os) const;
};

template <typename elemType>
class BinaryTree {
  friend ostream &operator << (ostream &, const BinaryTree<elemType> &);
 public:
  BinaryTree() : _root(nullptr) {}
  BinaryTree(const BinaryTree &rhs) { copy(_root, rhs._root); }
  ~BinaryTree() { clear(); }
  BinaryTree &operator = (const BinaryTree &);

  bool empty() { return _root == nullptr; }

  void insert(const elemType &elem);
  void remove(const elemType &elem);
  void clear() { if (_root) { clear(_root); _root = nullptr; } }
  bool find(const elemType &elem) const;

  void inorder(ostream &os = *_current_os) const { _root->inorder(_root, os); }
  void postorder(ostream &os = *_current_os) const { _root->postorder(_root, os); }
  void preorder(ostream &os = *_current_os) const { _root->preorder(_root, os); }

  static void current_os(ostream *os) { if(os) _current_os = os; }
  static ostream *os() { return _current_os; }

 private:
  BTnode<elemType> *_root;
  static ostream *_current_os;

  void copy(BTnode<elemType> *tar, BTnode<elemType> *src);
  void clear(BTnode<elemType> *pt);
  ostream& print(ostream &os = *_current_os,
                 void (BinaryTree<elemType>::*traversal)(ostream &) const =
                      &BinaryTree<elemType>::inorder) const;
  void remove_root();
};

template <typename valType>
inline void BTnode<valType>::insert_value(const valType &val) {
  if (val == _val) {
    _cnt++;
    return;
  }
  if (val < _val) {
    if(!_lchild)
      _lchild = new BTnode(val);
    else
      _lchild->insert_value(val);
  } else {
    if(!_rchild)
      _rchild = new BTnode(val);
    else
      _rchild->insert_value(val);
  }
}

template <typename valType>
inline void BTnode<valType>::remove_value(const valType &val, BTnode * &prev) {
  if (val < _val) {
    if (!_lchild)
      return;
    else
      _lchild->remove_value(val, _lchild);
  } else if (val > _val) {
    if (!_rchild)
      return;
    else
      _rchild->remove_value(val, _rchild);
  } else {
    if (_rchild) {
      prev = _rchild;
      if (_lchild)
        if (!prev->_lchild)
          prev->_lchild = _lchild;
        else
          BTnode<valType>::lchild_leaf(_lchild, prev->_lchild);
    } else
      prev = _lchild;
    delete this;
  }
}

template <typename valType>
inline void BTnode<valType>::preorder(BTnode * pt, ostream &os) const {
  if (pt) {
    display_val(pt, os);
    if (pt->_lchild) preorder(pt->_lchild, os);
    if (pt->_rchild) preorder(pt->_rchild, os);
  }
}

template <typename valType>
inline void BTnode<valType>::inorder(BTnode * pt, ostream &os) const {
  if (pt) {
    if (pt->_lchild) preorder(pt->_lchild, os);
    display_val(pt, os);
    if (pt->_rchild) preorder(pt->_rchild, os);
  }
}

template <typename valType>
inline void BTnode<valType>::postorder(BTnode * pt, ostream &os) const {
  if (pt) {
    if (pt->_lchild) preorder(pt->_lchild, os);
    if (pt->_rchild) preorder(pt->_rchild, os);
    display_val(pt, os);
  }
}

template <typename valType>
inline void BTnode<valType>::display_val(BTnode *pt, ostream &os) const {
  os << pt->_val;
  if (pt->_cnt > 1)
    os << "( " << pt->_cnt << " ) "; 
  else
    os << ' ';
}

template <typename elemType>
inline BinaryTree<elemType> &BinaryTree<elemType>::
operator = (const BinaryTree &rhs) {
  if (this != &rhs) {
    clear();
    copy(_root, rhs._root);
  }
  return *this;
}

template <typename elemType>
inline void BinaryTree<elemType>::insert(const elemType &elem) {
  if (!_root)
    _root = new BTnode<elemType>(elem);
  else
    _root->insert_value(elem);
}

template <typename elemType>
inline void BinaryTree<elemType>::remove(const elemType &elem) {
  if (_root) {
    if (_root->_val == elem)
      remove_root();
    else
      _root->remove_value(elem, _root);
  }
}

template <typename elemType>
inline void BinaryTree<elemType>::clear(BTnode<elemType> *pt) {
    if (pt) {
      clear(pt->_lchild);
      clear(pt->_rchild);
      delete pt;
    }
  }

template <typename elemType>
inline bool BinaryTree<elemType>::find(const elemType &elem) const {
  return  !_root ? false : _root->find_value(elem);
}

template <typename elemType>
inline void BinaryTree<elemType>::remove_root() {
  if (!_root) return;

  BTnode<elemType> *tmp = _root;
  if (_root->_rchild) {
    _root = _root->_rchild;
    if (tmp->_lchild) {
      BTnode<elemType> *lc = tmp->_lchild;
      BTnode<elemType> *newlc = _root->_lchild;
      if (!newlc)
        _root->_lchild = lc;
      else
      BTnode<elemType>::lchild_leaf(lc, newlc);
    }
  }
}

template <typename elemType>
inline ostream &operator << (ostream &os, const BinaryTree<elemType> &bt) {
  os << "Tree: " << endl;
  bt.print(os);
  return os;
}

template <typename valType>
inline void BTnode<valType>::lchild_leaf(BTnode *leaf, BTnode *subtree) {
  while (subtree->_lchild)
    subtree = subtree->_lchild;
  subtree->_lchild = leaf;
}

#endif