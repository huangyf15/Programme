#ifndef __LIBMAT_H__
#define __LIBMAT_H__

#include <iostream>

using namespace std;

class LibMat {
 public:
  LibMat(const int &year) : _year(year) {
    cout << "LibMat::LibMat(" << _year << ") default constructor!\n";
  }

  virtual ~LibMat() { cout << "LibMat::~LibMat() destructor!\n"; }
  virtual void print() const { cout << "LibMat::print() I am a LibMat object!\n"; }

  const int &year() const { return _year; }

 protected:
  int _year;
};

void print(const LibMat &mat);

class Book : public LibMat {
 public:
  Book(const int &year, const string &title, const string &author)
      : _title(title), _author(author), LibMat(year) {
    cout << "Book::Book(" << _year << ", " << _title
         << ", " << _author << ") constructor!\n";
  }

  virtual ~Book() { cout << "Book::~Book() destructor!\n"; }

  virtual void print() const {
    cout << "Book::print() I am a Book object!\n"
         << "My title is: " << _title << '\n'
         << "My author is: " << _author << '\n'
         << "My year is: " << _year << endl;
  }

  const string &title() const { return _title; }
  const string &author() const { return _author; }
  
 protected:
  string _title, _author;
};

class AudioBook : public Book {
 public:
  AudioBook(const int &year, const string &title, const string &author, 
            const string &narrator)
      : Book(year, title, author), _narrator(narrator) {
    cout << "AudioBook::AudioBook(" << _year << ", " << _title 
         << ", " << _author << ", " << _narrator << ") constructor!\n";
  }

  virtual ~AudioBook() { cout << "AudioBook::~AudioBook() destructor!\n"; }

  virtual void print() const {
    cout << "AudioBook::print() I am a AudioBook object!\n"
         << "My title is: " << _title << '\n'
         << "My author is: " << _author << '\n'
         << "My narrator is: " << _narrator << '\n'
         << "My year is: " << _year << endl;
  }

  const string &narrator() const { return _narrator; }
  
 protected:
  string _narrator;
};

#endif