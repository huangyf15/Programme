//Algorithm.cpp
#include "Algorithm.h"

// 直接插入排序
template <class T>
void insertionSort(T a[], int n) {
  int i, j;
  T temp;

  for (int i = 1; i < n; i++) {
    int j = i;
    T temp = a[i];
    while (j > 0 && temp < a[j - 1]) {
      a[j] = a[j - 1];
      j--;
    }
    a[j] = temp;
  }
}

// 交换两个元素的值
template <class T>
void mySwap(T &x, T &y) {
  T temp = x;
  x = y;
  y = temp;
}

// 简单选择排序
template <class T>
void selectionSort(T a[], int n) {
  for (int i = 0; i < n - 1; i++) {
    int leastIndex = i;
    for (int j = i + 1; j < n; j++)
      if (a[j] < a[leastIndex])
          leastIndex = j;
    mySwap(a[i], a[leastIndex]);
  }
}

// 冒泡排序
template <class T>
void bubbleSort(T a[], int n) {
  int i = n - 1;
  while (i > 0) {
    int lastExchangeIndex = 0;
    for (int j = 0; j < i; j++)
      if (a[j + 1] < a[j]) {
        mySwap(a[j], a[j + 1]);
        lastExchangeIndex = j;
      }
    i = lastExchangeIndex;
  }
}

// 顺序查找
template <class T>
int seqSearch(const T list[], int n, const T &key) {
  for(int i = 0; i < n; i++)
    if (list[i] == key)
      return i;
  return -1;
}

// 二分查找(设列表已排好序)
template <class T>
int binSearch(const T list[], int n, const T &key) {
  int low = 0;
  int high = n - 1;
  while (low <= high) {
    int mid = (low + high) / 2;
    if (key == list[mid])
      return mid;
    else if (key < list[mid])
      high = mid - 1;
    else
      low = mid + 1;
  }
  return -1;
}
