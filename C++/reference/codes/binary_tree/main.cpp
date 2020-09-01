#include "BinaryTree.h"

#include <string>
#include <iostream>
#include <fstream>

using namespace std;

template <typename elemType>
ostream *BinaryTree<elemType>::_current_os = &cout;

int main() {
/*
  ofstream log("test.log");
  if (!log) {
    cerr << "Error: unable to open file!\n";
    return -1;
  }
  BinaryTree<string>::current_os(&log);
*/

  BinaryTree<string> bt;

  bt.insert("Piglet");
  bt.insert("Eeyore");
  bt.insert("Roo");
  bt.insert("Trigger");
  bt.insert("Chris");
  bt.insert("Pooh");
  bt.insert("Kanga");

  cout << "Preorder traversal: \n";
  bt.preorder();

  bt.remove("Piglet");

  cout << "\n\nPreorder traversal after Piglet removal: \n";
  bt.preorder();

  bt.remove("Eeyore");

  cout << "\n\nPreorder traversal after Eeyore removal: \n";
  bt.preorder();

  cout << "\n\nInorder traversal after Eeyore removal: \n";
  bt.inorder();

  cout << "\n\nPostorder traversal after Eeyore removal: \n";
  bt.postorder();

  return 0;
}
