# 第五章 语句

> Last updated: Aug 19, 2020
> Author: Yunfan Huang
> **TODO**: Sec 5.1-5.5 to be modified

### 简单语句

- **表达式语句**：一个表达式末尾加上分号，就变成了表达式语句。
- **空语句**：只有一个单独的分号。
- **复合语句（块）**：用花括号 `{}`包裹起来的语句和声明的序列。一个块就是一个作用域。

### 条件语句

- **悬垂else**（dangling else）：用来描述在嵌套的`if else`语句中，如果`if`比`else`多时如何处理的问题。C++使用的方法是`else`匹配最近没有配对的`if`。

### 迭代语句

- **while**：当不确定到底要迭代多少次时，使用 `while`循环比较合适，比如读取输入的内容。
- **for**：`for`语句可以省略掉 `init-statement`， `condition`和 `expression`的任何一个；**甚至全部**。
- **范围 for**：`for (declaration: expression) statement`

### 跳转语句

- **break**：`break`语句负责终止离它最近的`while`、`do while`、`for`或者`switch`语句，并从这些语句之后的第一条语句开始继续执行。
- **continue**：终止最近的循环中的当前迭代并立即开始下一次迭代。只能在`while`、`do while`、`for`循环的内部。

### try 语句块和异常处理

- `C++`中的异常处理包括
  - **`throw`表达式**：异常检测部分使用`throw`表达式来表示它遇到了无法处理的问题。我们说`throw`引发（raise）了异常。
  - **`try`语句块**：以`try`关键词开始，以一个或多个`catch`子句（catch clause）结束。`try`语句块中的代码抛出的异常通常会被某个`catch`子句捕获并处理。`catch`子句也被称为**异常处理代码**（exception handler）。
  - 一套**异常类**（exception class）：用于在`throw`表达式和相关的`catch`子句之间传递异常的具体信息。
- **提示：编写异常安全的代码非常困难**
  - 对于异常发生时只是简单地终止程序的情形，不需要担心异常安全的问题；
  - 对于确实要处理异常并继续执行的程序，必须时刻清楚异常何时发生，异常发生后程序应如何确保对象有效、资源无泄漏、程序处于合理状态，等等。

