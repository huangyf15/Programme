# PH526: Using Python for Research

## Basics

### Week 1: Basics of Python3

* See `./helloWorld` and `./readWriteFile`

#### Homework 1

* We will use objects, functions, and randomness to find the length of documents, approximate $\pi$, and smooth out random noise.

### Week 2: Python Libraries and Concepts Used in Research

#### Scope Rules and Classes

* Scope rule "LEGB": Local -> Enclosing Function -> Global -> Built-in

* We can think of the class statement as setting up a kind of **blueprint** of a new class.

* In the `def` block of a class statement, `<method>(self, <other vars>)` means `self.<method>(<other vars>)`, in fact.

#### NumPy, Matplotlib and Pyplot

* For all cases of **indexed** arrays, what is returned is a **copy** of the original data, **NOT** a view as one gets for **sliced** arrays.

* See `./drawPic`

#### Randomness and Time

* See `./randomWalk`

#### Homework 2

* We will use the tools we've covered in the past two weeks to create a tic-tac-toe (noughts and crosses) simulator and evaluate basic winning strategies.

## Case Study

### Case Study 1: DNA Translation

* See `./transDNA`

#### Homework ~1

* A cipher is a secret code for a language. In this case study, we will explore a cipher that is reported by contemporary Greek historians to have been used by Julius Caesar to send secret messages to generals during times of war.

### Case Study 2: Language Processing

* See `./langProc`

#### Homework ~2

* In this case study, we will find and plot the distribution of word frequencies for each translation of Hamlet. Perhaps the distribution of word frequencies of Hamlet depends on the translation.

### Case Study 3: Intro to Classification

* See `./kNNClsfr`

#### Homework ~3

* In this case study, we will analyze a dataset consisting of an assortment of wines classified as "high quality" and "low quality" and will use k-Nearest Neighbors classification to determine whether or not other information about the wine helps us correctly guess whether a new wine will be of high quality.

### Case Study 4: Classifying Whiskies

* See `./whiskyClsfr`

#### Homework ~4

* In this case study, we have prepared step-by-step instructions for you on how to prepare plots in Bokeh, a library designed for simple, interactive plotting. We will demonstrate Bokeh by continuing the analysis of Scotch whiskies.

### Case Study 5: Bird Migration

* See `./birdTrack`

### Case Study 6: Social Network Analysis

* See `./socialNetwk`

### Case Study 7: Statistical Learning

* See `./statsLearn`

* Statistical learning
  * Two kinds of statistical learning
    * Supervised Learning: inputs/predictors & outputs/response -> association (i.e. functional)
    * Unsupervised Learning: inputs only -> relationships and structure
  * Two kinds of supervised learning
    * Regression for quantitative problems
      * continuous outputs/outcomes
      * Loss function: squared error loss
    * Classification for qualitative problems
      * categorical outputs/outcomes
      * Loss function: 0-1 loss
  * Overfitting and Underfitting
    * The two kinds of models will both likely perform worse on the testing data.
  * Training and Testing data Splitting
    * Primary motivation is that by evaluating how our model fits on unseen data, we can see how generalizable it is.

* Tree-based method
  * Goal:
    * to split up the predictor of feature space, such that
    * data within each region are as similar as possible
  * How to make prediction (generally)
    * Classification: returns the **mode** of the outcomes of the training data points in the predictor space where the new data point falls
    * Regression: returns the **mean** of the outcomes of the training data points in the predictor space where the new data point falls
  * An example: Random Forest Predictions
    * Two ways to introduce randomness to decision trees
      * Data level: each tree gets a bootstrapped random sample of training data
      * Predictor level: each split only uses a subset of predictors
    * How to make Predictions
      * Classification: each tree makes a prediction and the **mode** of these predictions is the prediction of the forest
      * Regression: each tree makes a prediction and the **mean** of these predictions is the prediction of the foreset