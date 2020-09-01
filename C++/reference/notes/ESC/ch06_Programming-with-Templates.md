# 第六章 使用模板编程

> Last updated: Sep 1, 2020
>
> Author: Yunfan Huang
>
> **TODO**：6.7-6.8 to be read

### 本章内容

本章学习设计和实现模板，这是泛型编程的基础，主要内容包括：

* 类模板（class template）的设计和实现
* 函数模板（class template）的设计和实现

#### 程序案例

* `binary_tree`：基于类模板与简单的函数模板实现二叉树
* `cal_seq_Cori_Tbased`：基于抽象基类指针的多态（采用类模板）

### 注意事项

* 类模板和函数模板的声明与定义**必须放在头文件里**，不能将其定义放在程序代码文件中。