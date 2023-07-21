# Notes on `python-intro`

## Lecture 6: Objects

* Functions are **first class objects**
  * They have types
  * They can be elements of data structures like lists
  * They can appear in expressions
    * As part of an assignment statement
    * As as argument to a function

## Lecture 7: Debugging

* Conducting tests
  * Start with **unit testing**: algorithm bugs
    * Check that each module (e.g. function) works correctly
  * Move to **integration testing**: interaction bugs
    * Check that the system as whole works correctly
  * Cycle between these phases
  * After code is corrected, be sure to do **regression testing**:
    * Check that program still passes all the tests it used to pass, i.e., that your code fix hasn't broken something that used to work

* Test Drivers and Stubs
  * **Drivers** are code that
    * Set up environment needed to run code
    * Invoke code on predefined sequence of inputs
    * Save results, and
    * Report
  * Drivers simulate parts of program that use unit being tested
  * **Stubs** simulate parts of program used by unit being tested
    * Allow you to test units that depend on software not yet written

* Some pragmatic hints
  * Look for the usual suspects
  * Ask why the code is doing what it is, NOT why it is not doing what you want
  * The bug is probably NOT where you think it is -- eliminate locations
  * Explain the problem to someone ELSE
  * Do NOT believe the documentation

## Lecture 8: Assertions and Exceptions

* Some standard error types
  * SyntaxError: Python can't parse program
  * NameError: local or global name not found
  * AttributeError: attribute reference fails
  * TypeError: operand doesn't have correct type
  * ValueError: operand type okay, but value is illegal
  * ZeroDivisionError: some num is being divided by zero
  * IOError: IO system reports malfunction (e.g. file not found)
  * AssertionError: assumptions on state of computation are NOT as expected

* Should probably rely on
  * raising **exceptions** if users supplies bad data input, and
  * using **assertions** for checking
    * types of arguments or values
    * that invariants on data structures are met
    * constraints on return values
    * for violations of constraints procedure (e.g. no duplicates in a list)

## Lecture 9: Efficiency and Orders of Growth

* Computational complexity
  * How much **time** will it take a program to run?
  * How much **memory** will it need to run?
  * Notice that we need to
    * Balance minimizing **computational complexity** with **conceptual complexity**, which is, generally speaking, to
    * Keep code simple and easy to understand, but where possible optimize performance

* Complexity classes
  * constant complexity
    * property: can have loops or recursive calls, but number of iterations or calls independent of size of input
    * example: very few interesting algorithms in this class, but can often have pieces that fit this class
  * lagrithmic complexity
    * definition: complexity grows as log of size of one of its inputs
    * example: bisection search, binary search of a list
  * linear complexity
    * property: can depend on number of recursive calls
    * example: search a list in order to see if an element is present, add characters of a string, assumed to be composed of decimal digits
  * log-linear complexity
    * example: many practical algorithms are log-linear, including merge-sort
  * polynomial complexity
    * definition: algrithm that grows as n to some power
    * property: commonly occurs when we have nested loops or recursive function calls
    * example: most are quadratic, such as to find intersection of two lists and return a list with each element appering only once
  * exponetial complexity
    * property: contains recursive functions where more than one recursive call for each size of problem
    * example: many important problems are inherently exponential, such as subset generation
    * character: may cause the high cost, unfortunately, but will also lead us to consider approximate solutions more quickly

## Lecture 10: Memory and Search

* Algorithms and data structures
  * How do you find efficient algorithms?
    * Hard to invent new ones
    * Easier to reduce problems to known solutions
      * Understand inherent complexity of problem
      * Think about how to break problem into sub-problems
      * Relate sub-problems to other problems for which there already exist efficient algorithms
  * Amortized cost analysis
    * Spreads out a big cost over a period of time
    * Considers entire sequence of operations

* Search algorithms
  * Linear search
    * just walk through an arbitrary list
    * mechanism of **indirection** is essential
  * Binary search
    * use **divide-and-conquer** method to an **ordered** list
    * algorithm of **sorting** is essential
  * Hashing (exchange time (efficiency) with space (memory))
    * Convert key to an int
    * Use int to index into a list (constant time)
    * Conversion done usint a **hash function**
      * Map large space of inputs to smaller space of outputs
      * Thus a many-to-one mapping
      * When two inputs go to same output - a **collision**
      * A good hash function has a uniform distribution - minimizes probability of a collision

## Lecture 11: Classes

* Objects have:
  * A type (a particular object is said to be an **instance** of a type)
  * An internal data representation (primitive or composite)
  * A set of procedures for interaction with the object

* Object-oriented programming (OOP)
  * Everything is an **object** and has a **type**
  * Objects are a data abstraction that encapsulate
    * Internal representation
    * **Interface** for interacting with object
      * Defines behaviors, hides implementation
      * Attributes: data, methods (procedures)
  * One can
    * Create new instances of objects (explicitly or using literals)
    * Destroy objects
      * Explicitly using `del` or just "forget" about them
      * Python system will reclaim destroyed or inaccessible objects -- called "garbage collection"

* Advatanges of OOP
  * Divide-and-conquer development
    * Implement and test behavior of each class separately
    * Increased modularity reduces complexity
  * Classes make it easy to reuse code
    * Many Python modules define new classes
    * Each class has a separate environment (no collision on function names)
    * Inheritance allows subclasses to redefine or extend a selected subset of a superclass' behavior

## Wrap-up: Computational thinking

* Computational thinking: the process
  * Identify or invent useful **abstractions**
    * Suppressing **details**, formulating **interfaces**
  * Formulate solution to a problem
    * As a computational experiment using **abstractions**
  * Design and construct a **implementation** of experiment
    * Which is **sufficiently efficient**
  * Validate experimental setup (i.e., debug it)
  * Run experiment
  * Evaluate results of experiment
  * Repeat as needed

* The three A's of computational thinking
  * Abstraction
    * Choosing the right abstractions
    * Operating in terms of multiple layers of abstraction simultaneously
    * Defining the relationships between layers
  * Automation
    * Thinking in terms of mechanizing our abstractions
    * Mechanization is possible
      * Because we have precise and exacting notations and models
      * There is some "machine" that can interpret our notations
  * Algorithms
    * Language for describing automated processes
    * Also allows abstraction of details

* An example: thinking recursively
  * Which means: reformulating a seemingly difficult problem into one which we know how to solve
  * Examples: reduction, embedding, transformation, simulation

