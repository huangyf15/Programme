# 第三章 泛型编程风格

> Last updated: Aug 29, 2020
> Author: Yunfan Huang

### 本章内容

学习使用STL（Standard Template Library），它主要由两种组件组成：

* 容器（container）：`vector`、`list`、`set`、`map`等类
  * 顺序容器（sequential container）：`vector`、`list`，主要进行`iterate`操作
  * 关联容器（associative container）：`set`、`map`，可以快速查找容器中的元素值
* 泛型算法（generic algorithm）：用于操作上述容器，包括`find()`、`sort()`、`replace()`、`merge()`等

#### 程序案例

* `find_where`：普通迭代器 Iterator
* `search_if`：顺序容器和泛型算法的使用
* `filter_comp`：函数对象及其适配器和泛型算法的设计
* `sort_io`：输入/输出迭代器 iostream Iterator

### 迭代器与泛型算法简介

#### 指针的算术运算

* 为了使得`find()`函数同时处理`array`和`vector`的元素，可以采用传入首指针和尾后指针的方式
* 指针对象`array`：`*(array + 2)`同`array[2]`的含义相同，`++array`表示指针的值递增 1

#### 泛型指针

##### 普通迭代器 Iterator

* 为了使得`find()`函数同时处理`array`、`vector`和`list`的元素，可以定义并使用泛型指针（迭代器）`iterator`

  * 定义方法

  ```c++
  // iterator 既允许读取，也允许写入
  vector<string> svec;
  vector<string>::iterator iter = svec.begin();
  // const_iterator 只允许读取，不允许写入
  const vector<string> cs_vec;
  vector<string>::const_iterator iter = cs_vec.begin();
  ```

* 迭代器对象`iterator class object`：和指针的唯一差别在于解引用运算符`*`、不等运算符`!=`以及递增运算符`++`的含义

##### 输入/输出迭代器 iostream Iterator

```c++
#include <iterator>
```

#### 泛型算法

* 为了使得`find()`支持赋予不等运算符不同的含义，可以采用泛型算法（传入函数指针或运用 function object）
* 标准库提供了超过 60 个的泛型算法，包括搜索、排序及次序整理、复制/删除/替换、关系、生成与质变、数值、集合算法等

#### 容器共通操作

* 相等（`==`）和不等（`!=`）运算符，返回`true`或`false`
* 赋值（`=`）运算符，将某个容器赋值给另一个容器
* `empty()`检查容器是否为空，`size()`返回容器内当前元素个数，`clear()`删除所有元素
* `insert()`插入单一或部分元素，`erase()`删除单一或部分元素

### 顺序容器

#### 典型顺序容器

* `vector`：以一块连续内存存放元素（适合表示数列），随机访问、末端插入或删除的效率较高，任意位置插入或删除的效率较低
* `list`：以双向链接而非连续内存储存内容，任意位置插入和删除的效率较高，随机访问的效率较低
* `deque`：以多个连续的内存空间存放元素，随机访问、最前端和末端的插入和删除的效率更高，任意位置插入和删除的效率较低

#### 基本操作

* 定义顺序容器对象的五种方式
  * 产生空的容器
  * 产生特定大小的容器，并采用默认值为初始值
  * 产生特定大小的容器，并为每个元素指定初始值
  * 通过一对 iterator 产生容器
  * 根据某个容器赋值产生出新容器
* 典型的操作函数
  * 索引头尾元素：`front()`，`back()`
  * vector, list 和 deque：`push_back()`，`pop_back()`，`insert()`，`erase()`
  * list 和 deque：`push_front()`，`pop_front()`

#### 泛型算法的使用和设计

##### 使用泛型算法

```c++
#include <algorithm>
```

##### 设计泛型算法

* 目标任务：用户给定一个整型 vector，返回一个新的 vector，其中内含原 vector 之中小于 10 的所有数值
* 泛型算法的架构设计
  * 传入泛型指针标示元素范围，以支持多种容器
  * 将元素类型参数化，以支持多种元素类型
  * 将“比较操作”参数化，以同时支持函数指针和 function object 两种方式
* 函数对象适配器（Function Object Adapter）辅助函数
  * 绑定适配器（binder adapter）：将 function object  的参数绑定至特定值，使二元函数对象转换为一元函数对象，如`bind1st`、`bind2nd`
  * 求反器（negator）：对 function object  的真伪值取反，如`not1`、`not2`
  * 插入适配器（insertion adapter）：用插入操作代替容器的赋值运算符，以减少目的端容器的空间浪费，如`back_inserter`、`inserter`、`front_inserter`
  * 函数包装器（function wrapper）：可用于设计通用的函数执行接口，原理上是通过函数指针实现的，如`function`是 STL 提供的通用多态函数封装器
* 函数指针和函数对象辨析
  * 函数指针：是一个指针变量，该指针指向函数地址
  * 函数对象：是一个对象（类的实例），该对象具有某个函数的功能

### 关联容器

* `map`容器：
* `set`容器：