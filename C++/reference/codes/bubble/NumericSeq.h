#ifndef BUBBLE_NUMERICSEQ_H_
#define BUBBLE_NUMERICSEQ_H_

#include <iostream>
#include <fstream>
#include <vector>

using namespace std;

void display(const vector<int> &, ostream & = cout);

ostream &operator << (ostream &, const vector<int> &);

void swap(int &, int &, ofstream * = nullptr);

void bubble_sort(vector<int> &, ofstream * = nullptr);

#endif
