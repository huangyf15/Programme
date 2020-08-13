# PKU2015

## Week 1：从 C 到 C++

* 函数指针 -> 命令行参数 -> 位运算 -> 引用 -> `const`关键字和常量
* 动态内存分配 -> 内联函数和重载函数 -> 函数缺省参数

### Details

* 函数指针
  * 声明方式：`int (*pf) (int, int)`
  * 使用方法：`函数指针名(实参表)`
    ```c++
    void printMin(int a, int b);
    int main {
      void (*pf)(int, int);
      int x = 4, y = 5;
      pf = printMin;
      pf(x, y);
      return 0;
    }
    ```
  * C 语言快速排序库函数
    ```c++
    void qsort(void *base, int nelem, unsigned int width,
               int (*pfCompare)(const void *, const void *));
    ```
    ```c++
    #include <stdio.h>
    #include <stdlib.h>

    int MyCompare(const void *elem1, const void *elem2) {
      unsigned int *p1, *p2;
      p1 = (unsigned int *) elem1;
      p2 = (unsigned int *) elem2;
      return (*p1 % 10) - (*p2 % 10);
    }

    #define NUM 5

    int main() {
      unsigned int an[NUM] = {8, 123, 11, 10, 4};
      qsort(an,NUM,sizeof(unsigned int), MyCompare);
      for (int i = 0; i < NUM; i++)
        printf("%d ",an[i]);
      return 0;
    }
    ```
* 命令行参数
  ```c++
  #include <stdio.h>

  int main(int argc, char *argv[]) {
    for (int i = 0; i < argc; i++)
      printf("%s\n",argv[i]);
    return 0;
  }
  ```
* 引用
  * 定义引用时一定要将其初始化成引用某个变量。
  * 初始化后，它就一直引用该变量，不会再引用其他变量了。
  * 引用只能引用变量，不能引用常量和表达式。
    ```c++
    #include <iostream>

    int n = 4;
    int & SetValue() { return n; }

    int main() {
      SetValue() = 40;
      std::cout << n;
      return 0;
    }
    ```
* 常量
  * 常量：`const double PI = 3.14;`
  * 常量指针：`int n; const in *p = &n;`
  * 常引用：`int n; const int &r = n;`

## Week 2-3：类和对象

* 面向对象与抽象 -> 类成员的访问范围 -> 内联成员函数和重载成员函数
* 构造函数 -> 复制构造函数 -> 类型转换构造函数 -> 析构函数
* 静态成员变量和静态成员函数 -> 成员对象和封闭类 -> 友元
* `this` 指针 -> 常量对象、常量成员函数和常引用

### Details

* 成员对象和封闭类
  * 成员对象：一个类的成员变量是另一个类的对象
  * 封闭类（Enclosing）：包含成员对象的类
* `this` 指针
  * C++ 到 C 程序的翻译
    ```c++
    class CCar {
     public:
      int price;
      void SetPrice(int p);
    };
    void CCar::SetPrice(int p) { price = p; }
    
    int main() {
      CCar car;
      car.SetPrice(20000);
      return 0;
    }
    ```
    ```c
    // 类的成员变量转变为结构体的成员
    // 类的成员函数转变为全局函数，增加结构体指针为首参数
    struct CCar {
      int price;
    };
    void SetPrice(struct CCar *this, int p) {
      this->price = p;
    }

    int main() {
      struct CCar car;
      SetPrice(&car, 20000);
      return 0;
    }
    ```
  * `this` 指针的作用就是指向非静态成员函数所作用的对象
    
    ```c++
    // 可以正常运行，并输出 Hello
    class A {
      int i;
     public:
      void Hello() { cout << "Hello" << endl; }
};
    
    int main () {
      A *p = nullptr;
      p->Hello();
    }
    ```
    ```c++
    // 会出错，指针 p 不指向任何成员
    class A {
      int i;
     public:
      void Hello() { cout << i << "Hello" << endl; }
};
    
    int main () {
      A *p = nullptr;
      p->Hello();
    }
    ```
  * 静态成员函数不能使用 `this` 指针，因为静态成员函数并不作用于某个对象。因此，静态成员函数的真实的参数的个数，就是程序中写出的的参数个数。
* 内联成员函数和重载成员函数
  ```c++
  class C {
   public:
    inline void func1();
    void func2() { return _x; }
    void valueX(int val) { _x = val; }
    int valueX() { return _x; }
   private:
    int _x;
  };

  void C::func1() {};
  ```

## Week 4: 运算符重载

* 基本概念 -> 赋值运算符的重载 -> 运算符重载为友元函数
* 流插入和流提取运算符的重载 -> 自加/自减运算符的重载

## Week 5-6：继承与派生，多态与虚函数

* 继承和派生 -> 复合关系和继承关系
* 基类/派生类同名成员和 `protected` 关键字 -> 派生类的构造函数 -> `public` 继承的赋值兼容原则
* 多态和虚函数的基本概念 -> 多态实现原理 -> 虚析构函数 -> 纯虚函数和抽象类

### Details

* 复合关系和继承关系

  * 继承：“是”关系

    * 基类 A, B 是基类 A 的派生类
    * 逻辑上要求：“一个 B 对象也是一个 A 对象”

  * 复合：“有”关系

    * 类 C 中 “有” 成员变量 k，k 是类 D 的对象，则 C 和 D 是复合关系
    * 一般逻辑上要求：“D 对象是 C 对象的固有属性或组成部分”

  * 应用举例

    * `CCircle` 与 `CPoint` 应为复合关系

      ```c++
      class CPoint {
          double x, y;
          friend class CCircle;
      };
      
      class CCirdle {
          double r;
          CPoint center;
      }
      ```

    * `CMaster` 与 `CDog` 应为复合关系

      ```c++
      class CMaster;
      
      class CDog {
          CMaster *pm;
          friend class CMaster;
      };
      
      class CMaster {
          CDog *dogs[10];
      }
      ```

* `public` 继承的赋值兼容原则
  
  * 派生类对象可以赋值给基类对象
  * 派生类对象可以初始化基类引用
  * 派生类对象地址可赋值给基类指针
  
* 多态实现原理
  * 多态实现需要有额外的空间和时间开销
  * 空间开销：每一个有虚函数的类的对象增加 4 个字节用于存放虚表的地址
  * 时间开销：对多态的函数调用语句编译出来的指令需要增加查虚函数表的步骤

## Week 7-8：文件操作和模板，STL

* 文件操作 -> 函数模板 -> 类模板 -> `string` 类 -> 输入/输出 -> 流操纵算子
* STL 概述 -> 顺序容器 `vector` -> `list` 和 `deque` -> 函数对象 -> `set` 和 `multiset` -> `map` 和 `multimap` -> 容器适配器 -> 算法