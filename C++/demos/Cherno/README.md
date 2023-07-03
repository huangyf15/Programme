# Cherno

## Contents

- [x] Ch01: Part 01-02(, 03-04, 11, 13)
- [x] Ch02: Part 05-07, 10
- [ ] Ch03: Part (08-09, 12, 14-15)
- [x] Ch04: Part 16-17, 24(, 31-33)
- [x] Ch05: Part 18-23(, 25-30, 34)

## Chapter 01: C++ programming with MS Visual Studio

## Chapter 02: Compiling and Linking

* Declaration vs Definition
* Compiler and Linker
  * `#include`/`#define`/`#if`/`#ifdef`/`#ifndef`/`#endif`/`#pragma`
  * any separate obj file is called a "translation unit"
* Header file

## Chapter 03: Variables, Functions and Control Flows

## Chapter 04: Pointer/Reference, Enum/Array/String

* Memory is probably the single most important thing that you have in programming and the single most important resource that your computer can provide to you.
* Pointers and references are pretty much the same thing as far as what the computer will actually do with them.
  * A pointer for all types is just that integer that holds a memory address.
  * A reference is an alias, i.e. a way to refer to an existing variable.

## Chapter 05: Classes/Struct, Static/Extern, Const, Inheritance

* Class vs Struct in C++
  * Essentially NO difference except the default visibility.
  * Class: usually with massive functionality, i.e. inheritance
  * Struct: usually only used to save data.
    * In C, struct does not have function members, but could have pointers to functions to realize the same functionality.
* Lifetime and scope
  * Static var and fun (take class for example; struct is the same)
    * Outside classes (lifetime: static, scope: translation unit) 
    * Inside a class (lifetime: static, scope: class's namespace)
  * Local static var (lifetime: static, scope: local)