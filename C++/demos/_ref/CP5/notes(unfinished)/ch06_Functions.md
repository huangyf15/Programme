# 第六章 函数

> Last updated: Aug 19, 2020
>
> Author: Yunfan Huang

### 函数基础

- 函数是命名了的计算单元
  - 典型的**函数**定义包括：返回类型（return type）、函数名、形参（parameter）列表（可以为空）、函数体。
  - `void`表示函数不返回任何值。函数的返回类型不能是数组类型或者函数类型，但可以是指向数组或者函数的指针。
- 函数调用运算符（call operator）
  - 调用运算符的形式是一对圆括号 `()`，作用于一个表达式，该表达式是函数或者指向函数的指针
  - 圆括号内是用逗号隔开的**实参**（argument）列表，其中形参和实参的**个数**和**类型**必须匹配上。
  - 函数调用过程：首先主调函数（calling function）的执行被中断，然后被调函数（called function）开始执行。

#### 局部对象

- 作用域和生命周期
  - 名字的作用域：是程序文本的一部分，名字在其中可见
  - 对象的生命周期：程序执行过程中该对象存在的一段时间。
- 几种局部对象
  - 局部变量：形参和函数体内部定义的变量统称为局部变量。它对函数而言是局部的，对函数外部而言是**隐藏**的。
  - 自动对象：只存在于块执行期间的对象，如函数的形参。当块的执行结束后，它的值就变成**未定义**的了。
  - 局部静态对象：`static`类型的局部变量，生命周期贯穿函数调用前后。

#### 函数声明

- 函数的声明和定义唯一的区别是声明无需函数体，用一个分号替代。
- 函数声明包含了函数的三要素（返回类型、函数名、形参类型），主要用于描述函数的接口，也称**函数原型**。
- **建议**：建议变量和函数在头文件中声明，在源文件中定义。

### 参数传递

- 形参初始化的机理和变量初始化一样。
- 形实结合的两种方式：
  - 引用传递/传引用调用（passed/called by reference）：指**形参是引用类型**，引用形参是它对应的实参的别名。
  - 值传递/传值调用（passed/called by value）：指实参的值是通过**拷贝**传递给形参。

#### 传值参数

- 通过使用值传递，函数对形参做的所有操作都不会影响实参。
- 当初始化一个非引用类型的变量时，初始值被拷贝给变量。
- **建议**：`C`常常使用指针类型的形参访问函数外部的对象，`C++`建议使用引用类型的形参代替指针。

#### 传引用参数

- 通过使用引用形参，允许函数改变一个或多个实参的值。
- 引用形参直接关联到绑定的对象，而非对象的副本。
  - 使用引用形参可以用于返回额外的信息。
  - 经常用引用形参来避免不必要的复制。
- **建议**：如果无需改变引用形参的值，最好将其声明为常量引用。

#### const 形参和实参

- 形参的顶层`const`被忽略。调用时既可以传入`const int`也可以传入`int`。此时在函数中，不能改变实参的局部副本。
- 可以使用非常量初始化一个底层`const`对象，但是反过来不行。
- **建议**：尽量使用常量引用。

#### 数组形参

- 当为函数传递一个数组时，传递的实为指向数组首元素的指针。

- 管理指针形参的三种常用技术

  - 使用标记指定数组长度：典型示例为`C`风格字符串

    ```c++
    void print(const char *cp) {
      if (cp)
        while (*cp)
          cout << *cp++;
    }
    ```

  - 使用标准库规范

    ```c++
    void print(const int *beg, const int *end) {
      while (beg != end)
        cout << *beg++ << endl;
    }
    int j[2] = {0, 1};
    print(begin(j), end(j));
    ```

  - 显式传递一个表示数组大小的形参

    ```c++
    void print(const int ia[], size_t size) {
      for (size_t i = 0; i != size; ++i)
        cout << ia[i] << endl;
    }
    int j[] = {0, 1};
    print(j, end(j) - begin(j));
    ```

- **建议**：要注意数组的实际长度，确保使用时不会越界。

#### main 处理命令行选项

```c++
int main(int argc, char *argv[]){...}
```

- 第一个形参`argc`代表参数的个数
- 第二个形参`argv`是参数`C`风格字符串数组

#### 可变形参

```c++
void err_msg(ErrCode e, initializer_list<string> il){
    cout << e.msg << endl;
    for (auto beg = il.begin(); beg != il.end(); ++ beg)
        cout << *beg << " ";
    cout << endl;
}

err_msg(ErrCode(0), {"functionX", "okay"});
```

* 为了编写能处理不同数量实参的函数，`C++11`提供了两种方法
  * 所有实参类型相同：使用 `initializer_list`的标准库类型
  * 实参类型不同：使用可变参数模板
* `initializer_list`提供的操作

| 操作 | 解释 |
|-----|-----|
| `initializer_list<T> lst;` | 默认初始化；`T`类型元素的空列表 |
| `initializer_list<T> lst{a,b,c...};` | `lst`的元素数量和初始值一样多；`lst`的元素是对应初始值的副本；列表中的元素是`const`。 |
| `lst2(lst)` | 拷贝或赋值一个`initializer_list`对象不会拷贝列表中的元素；拷贝后，原始列表和副本共享元素。 |
| `lst2 = lst` | 同上 |
| `lst.size()` | 列表中的元素数量 |
| `lst.begin()` | 返回指向`lst`中首元素的指针 |
| `lst.end()` | 返回指向`lst`中微元素下一位置的指针 |

- 省略形参符： `...`。为了便于`C++`访问某些`C`代码，这些代码使用了`varargs`的`C`标准库功能。

### 返回类型和 return 语句

#### 无返回值函数

* 没有返回值的`return`语句只能用在返回类型是`void`的函数中，返回`void`的函数不要求非得有`return`语句。

#### 有返回值函数

- `return`语句的返回值的类型必须和函数的返回类型相同，或者能够**隐式地**转换成函数的返回类型。
- **警告**
  - 含有`return`语句的循环后应该也有一条`return`语句，如果没有该程序就是错误的。很多编译器都无法发现此类错误。
  - **不要返回局部对象的引用或指针**。
- 返回值
  - 值如何被返回：返回的值用于初始化调用点的一个临时量，该临时量就是函数调用的结果。
  - 引用返回左值：函数的返回类型决定函数调用是否是左值。调用一个返回引用的函数得到左值；其他则类型得到右值。**注意**，若返回类型为常引用，则不能给调用的结果赋值。
  - 列表初始化返回值：函数可以返回花括号包围的值的列表。
  - 主函数`main`的返回值：如果结尾没有`return`，编译器将隐式地插入一条返回 0 的`return`语句。返回0代表执行成功。

#### 返回数组指针

- 法 1：使用类型别名`int`

  ```c++
  typedef int arrT[10];
  using arrT = int[10]; // 等价于上一条语句
  arrT* func(int i);
  ```

- 法 2：声明一个返回数组指针的函数

  ```c++
  int (*func(int i))[10];
  ```

- 法 3：使用尾置返回类型

  ```c++
  auto func(int i) -> int(*)[10]; // 等价于法 2
  ```

- 法 4：使用 `decltype`（但并不负责把数组类型转成对应指针）

  ```c++
  int odd[] = (10, 0);
  decltype(odd) *arrPtr(int i);
  ```

### 函数重载

- 如果同一作用域内几个函数名字相同但形参列表不同，称之为重载（overload）函数。`main`函数不能重载。
- **建议**：只重载那些**确实非常相似**的操作，以避免表意不清。
- 若在内层作用域中声明名字，它将隐藏外层作用域中声明的同名实体，在不同的作用域中无法重载函数名。

#### 重载和 const 形参

- 一个有顶层`const`的形参和没有它的函数无法区分。

  - 如`Record lookup(const Phone)`和 `Record lookup(Phone)`无法区分。
  - 又如`Record lookup(Phone* const)`和 `Record lookup(Phone*)`无法区分。

- 相反，一个有底层`const`的形参和没有它的函数可以区分。

  - 如`Record lookup(Account&)`和 `Record lookup(const Account&)`可以区分。
  - 又如`Record lookup(Account*)`和 `Record lookup(const Account*)`可以区分。

- `const_cast`和重载

  ```c++
  const string &shorterString(const string &s1, const string &s2) {
      return s1.size() <= s2.size() ? s1 : s2;
  }
  
  string &shorterString(string &s1, string &s2) {
      auto &r = shorterString(const_cast<const string&>(s1), const_cast<const string&>(s2));
      return const_cast<string&>(r);
  }
  ```

#### 函数匹配

- 重载函数匹配的三个步骤
  1. 候选函数：选定本次调用对应的重载函数集，集合中的函数称为候选函数（candidate function）。
  2. 可行函数：考察本次调用提供的实参，选出可被这组实参调用的函数，新选出的函数称为可行函数（viable function）。
  3. 寻找最佳匹配：实参和形参类型越接近，它们匹配地越好。

### 特殊用途语言特性

#### 默认实参

```c++
string screen(sz ht = 24, sz wid = 80, char bgd = ' ');
```

- 一旦某个形参被赋予了默认值，则其后的形参都需要有默认值。

#### 内联函数和 constexpr 函数

- 把规模较小的操作定义成函数的好处
  - 阅读和理解`shorterString`函数的调用要比读懂等价的条件表达式容易得多；
  - 使用函数可以确保行为的统一，每次相关操作都能保证按照同样的方式进行；
  - 如果需要修改计算过程，显然修改函数要比先找到等价表达式所有出现的地方在逐一修改更容易；
  - 函数可以被其他应用重复利用，省去了重新编写的代价。
- 使用规模较小的操作定义成的函数的缺点
  - 调用函数一般比求解等价表达式的值要慢一些；
  - 大多数机器上的一次函数调用操作包含着一系列工作：调用前先保存寄存器，并在返回时回复；可能需要拷贝实参；程序转向一个新的位置继续执行。
- `inline`函数可以避免函数调用的开销，可以让编译器在编译时**内联地展开**该函数。
  - `inline`函数应该在头文件中定义。
  - 一般来说，内联机制适用于优化规模较小、流程直接、频繁调用的函数。
- `constexpr`函数指**能用于常量表达式**的函数，**可以让编译器对其的调用替换成其结果值**。为了能在编译过程中随时展开，这类函数被隐式地指定为内联函数。
  - `constexpr`函数应该在头文件中定义。
  - 要求函数的返回类型及所有形参类型都要是字面值类型，且函数体中必须有且只有一条`return`语句。
  - **注意**：`constexpr`函数不一定返回常量表达式。

#### 调试帮助

- `assert`预处理宏常用于检查“不能发生的条件”
  - `assert(expr);`可用于确认`expr`的真假
- NDEBUG 预处理变量可用于关闭调试状态
  - 命令行`CC -D NDEBUG main.c`可以定义这个变量`NDEBUG`
  - `__FILE__`：存放文件名的字符串字面值
  - `__LINE__`：存放当前行号的字符串字面值
  - `__TIME__`：存放文件编译时间的字符串字面值
  - `__DATE__`：存放文件编译日期的字符串字面值

```cpp
void print() {
#ifndef NDEBUG
  // __func__ 是编译器定义的用于存放函数名的局部静态变量
  cerr << __func__ << "..." << endl;
#endif
}
```

### 函数指针

- 函数指针指向的是函数而非对象。函数指针指向某种特定类型，函数类型由它的返回类型和形参类型共同决定，与函数名无关。

  ```c++
  // 比较两个 string 对象的长度
  bool lengthCompare(const string &, const string &);
  // 指针 pf 指向一个函数，该函数的返回值是 bool 类型
  bool (*pf)(const string &, const string &);
  // 声明一个名为 pf 的函数，该函数的返回 bool*
  bool *pf2(const string &, const string &);
  ```

- 函数指针形参

  ```c++
  // Func 和 Func2 是函数类型
  typedef bool Func(const string &, const string &);
  typedef decltype(lengthCompare) Func2;
  // FunP 和 FunP2 是指向函数的指针
  typedef bool(*FunP)(const string&, const string&);
  typedef decltype(lengthCompare) *FunP2;
  // 第三个形参是函数类型，它会自动地转换成指向函数的指针
  void useBigger(const string &i1, const string &i2, bool pf(const string &, const string &));
  // 等价的声明：显式地将形参定义成指向函数的指针
  void useBigger(const string &i1, const string &i2, bool (*pf)(const string &, const string &));
  // 等价的声明：使用了类型别名
  void useBigger(const string &i1, const string &i2, Func)); // Func 也可等价地替换为 Func2, FunP, FunP2
  // 自动将函数 lengthCompare 转换成指向该函数的指针
  useBigger(s1, s2, lengthCompare);
  ```

- 返回指向函数的指针

  ```c++
  // 使用类型别名
  using F = int (int*, int);    // 是函数类型，不是指针
  using PF = int (*)(int*, int); // 是函数指针
  // 尾置返回类型
  auto PF(int) -> int (*)(int*, int);
  ```
