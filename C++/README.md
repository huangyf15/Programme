# Basics of C++

## File Structure

  * `courses`：C++ 课程相关
  * `reference`：C++ 参考材料相关
  * `project`：示例用的项目文件夹（典型文件结构如下）
      * `src`：存放源代码
        * `h`：存放头文件
        * `cpp`：存放源文件
      * `obj`：存放编译生成的目标文件
      * `bin`：存放链接生成的可执行程序
      * `test`：存放 `DEBUG` 阶段的测试程序
      * `data`：存放数值结果及其后处理程序
      * `makefile & run.sh`：项目自动编译工具文件

## Usage

### Before use

#### Dependencies

1. 目前只需要 `icc`, `g++` 两种编译器，手动安装需要的即可。

#### Extra operations

1. 修改 `makefile` 内的路径变量：将 `makefile` 文件中 `MAKEDIR`变量的值修改为 `makefile` 所在的绝对路径。

### Compile and Run

项目中的 `C++` 程序一般使用 `make` 工具进行自动编译，并使用 `shell` 脚本实现批处理。

#### Commands

1. `sh run.sh`：直接运行编写好的 `shell`（最简单）
2. `make`：编译生成目标文件
3. `make all`：链接生成可执行程序至 `.\bin` 目录下

#### Details

1. 关于载入头文件以及链接库文件，可使用如下编译选项（`icc` 和 `g++` 均适用）

* `-I` 用于指明搜索头文件的路径，`-include xxx.h` 用于指定需要载入的头文件 `xxx.h`；
* `-L` 用于指明搜索库文件的路径，`-lxxx` 用于指定需要链接的库 `libxxx.a` 或 `libxxx.so`。