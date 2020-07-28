//Algorithm.h

// 直接插入排序
template <class T>
void insertionSort(T a[], int n);

// 交换两个元素的值
template <class T>
void mySwap(T &x, T &y);

// 简单选择排序
template <class T>
void selectionSort(T a[], int n);

// 冒泡排序
template <class T>
void bubbleSort(T a[], int n);

// 顺序查找
template <class T>
int seqSearch(const T list[], int n, const T &key);

// 二分查找(设列表已排好序)
template <class T>
int binSearch(const T list[], int n, const T &key);

