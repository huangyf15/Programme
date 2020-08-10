#ifndef EXP07_VEHICLE_H_
#define EXP07_VEHICLE_H_

#include <iostream>

using namespace std;

class Vehicle {
 public:
  double maxSpeed, weight;
  void run() { cout << "Vehicle Runs!" << endl; }
  void stop() { cout << "Vehicle Stops!" << endl; }
};

class Bicycle : virtual public Vehicle {
 public:
  double height;
};

class Motorcar : virtual public Vehicle {
 public:
  int seatNum;
};

class Motorcycle : public Bicycle, public Motorcar{
 public:
  double length;
};

#endif