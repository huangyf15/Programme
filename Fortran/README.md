# Basics of Fortran90

## File Structure

* `project`: 示例用的项目文件夹（典型文件结构如下）
  * `modsrc`：存放用户定义模块的源文件
  * `src`：存放主程序及子程序的源代码
  * `obj`：存放编译生成的目标文件
  * `bin`：存放链接生成的可执行程序
  * `test`：存放 `DEBUG` 阶段的测试程序
  * `data`：存放数值结果及其后处理程序
  * `makefile & run.sh`：项目自动编译工具文件

## Usage

### Before use

#### Dependencies

1. 目前只需要 `ifortran`, `gfortran` 两种编译器，手动安装需要的即可。

#### System Setup

1. `modsrc/mod2_include_para.f90`：在模块中设置默认参数
2. `modsrc/mod4_input_data.f90` 的 `read_data`：设置输入参数
3. `modsrc/mod5_output_data.f90` 的 `output_alloc`：设置输出文件标题行/控制变量名

#### Extra operations

1. 修改 `makefile` 内的路径变量：将 `makefile` 文件中 `MAKEDIR`变量的值修改为 `makefile` 所在的绝对路径。
2. 删除编译前自动生成的 `mod` 文件：将模块源文件夹 `$(MDSDIR)` 内自动生成的 `.mod` 文件手动删除。

### Compile and Run

项目中的 `Fortran90` 程序一般使用 `make` 工具进行自动编译，并使用 `shell` 脚本实现批处理。

#### Commands

1. `sh run.sh`：直接运行编写好的 `shell`（最简单）
2. `make mod`：编译生成模块文件
3. `make`：编译生成目标文件
4. `make all`：链接生成可执行程序至 `.\bin` 目录下

#### Details

1. 关于载入头文件以及链接库文件，可使用如下编译选项（`ifort` 和 `gfortran` 均适用）
   
   * `-I` 用于指明搜索头文件的路径，`-include xxx.h` 用于指定需要载入的头文件 `xxx.h`；
   * `-L` 用于指明搜索库文件的路径，`-lxxx` 用于指定需要链接的库 `libxxx.a` 或 `libxxx.so`。

2. 模块接口文件 `.mod` 相关的编译选项为 `-module`（对于 `ifort`）或 `-J`（对于 `gfortran`），其用法如下
   
   * `.mod` 的生成：在编译模块源文件 `.f90` 时生成对应目标文件 `.o` 时，会自动生成模块接口文件 `.mod`，此时需要使用上述命令指定 `.mod` 存放的路径；
   * `.mod` 的使用：在链接包含模块的目标文件 `.o` 时，需要 `.mod` 接口文件作为接口才能完成链接过程，此时需要使用上述命令指定被主程序 `use` 的 `.mod` 存放的路径。特别地，对于事先编译好的 `.mod` 文件，也可以使用 `-I` 来指定其存放路径。

### DEBUG

* 2023.02.23
  
  * ifort/gfortran 在 wsl 平台均能正常使用 makefile 编译（bash in vscode）
  
  * ifort 在 windows 上编译会报 link: unknown error -- s 错误（powershell/bash）
  
  * gfortran 在 windows 上能够正常使用 makefile 编译（powershell/bash）