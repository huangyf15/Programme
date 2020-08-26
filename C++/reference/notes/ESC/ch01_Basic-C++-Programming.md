# 第一章 C++编程基础

> Last updated: Aug 24, 2020
> Author: Yunfan Huang

### 本章内容

学习`C++`程序语言的基本组成，包括：

* 一些基础的数据类型：布尔值、字符、整数、浮点数
* 一些基础的运算符：算数、赋值、关系（逻辑）、递增递减、条件
* 条件分支和循环控制语句：`if/else`、`switch-case/break`、`while/continue`
* 一些复合类型：指针（间接参考一个已存在的对象）、数组（定义一组具有相同数据类型的元素）
* 一套标准的、通用的抽象化库：`string`字符串、`vector`向量

#### 程序案例

* `cerr`：`cout`/`cerr`/`clog`与文件重定向

### 文件的读写

#### cout, cerr 和 clog

| Command | Buffer | Output |
| -------------- | -------- | --------- |
| `cout`（标准输出）| 有缓冲，缓冲区满或遇到`endl`才输出 | 通常终端显示器输出，但可被重定向至文件 |
| `cerr`（无缓冲标准错误）| 无缓冲 | 终端显示器输出，一般不被重定向至文件 |
| `clog`（有缓冲标准错误）| 有缓冲，缓冲区满或遇到`endl`才输出 | 终端显示器输出，一般不被重定向至文件 |

#### 文件重定向

| Command                         | 功能                                                         |
| ------------------------------- | ------------------------------------------------------------ |
| command > filename              | 把标准输出重定向到一个文件中                                 |
| command >> filename             | 把标准输出重定向到一个文件中（追加）                         |
| command 1 > fielname            | 把标准输出重定向到一个文件中                                 |
| command > filename 2>&1         | 把标准输出和标准错误一起重定向到一个文件                     |
| command 2 > filename            | 把标准错误重定向到一个文件中                                 |
| command 2 >> filename           | 把标准错误重定向到一个文件中（追加）                         |
| command >> filename 2>&1        | 把标准输出和标准错误一起重定向到一个文件中（追加）           |
| command < filename1 > filename2 | command命令以filename1文件作为标准输入，以filename2文件作为标准输出 |
| command < filename              | command命令以filename文件作为标准输入                        |
| command << delimiter            | 从标准输入中读入，直至遇到delimiter分界符                    |
| command < &m                    | 将文件描述符m作为标准输入                                    |
| command > &m                    | 将标准输出重定向到文件描述符m中                              |
| command < &-                    | 关闭标准输入                                                 |