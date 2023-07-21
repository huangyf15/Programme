#ifndef EXP08_VEHICLE_H_
#define EXP08_VEHICLE_H_

#include <iostream>

using namespace std;

class Vehicle {
 public:
  double maxSpeed, weight;
  virtual void run() const;
  virtual void stop() const;
};

class Bicycle : virtual public Vehicle {
 public:
  double height;
  virtual void run() const;
  virtual void stop() const;
};

class Motorcar : virtual public Vehicle {
 public:
  int seatNum;
  virtual void run() const;
  virtual void stop() const;
};

class Motorcycle : public Bicycle, public Motorcar{
 public:
  double length;
  virtual void run() const;
  virtual void stop() const;
};

#endif