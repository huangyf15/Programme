#include "Vehicle.h"

void Vehicle::run() const {
  cout << "Vehicle Runs!" << endl;
}
void Vehicle::stop() const {
  cout << "Vehicle Stops!" << endl;
}

void Bicycle::run() const {
  cout << "Bicycle Runs!" << endl;
}
void Bicycle::stop() const {
  cout << "Bicycle Stops!" << endl;
}

void Motorcar::run() const {
  cout << "Motorcar Runs!" << endl;
}
void Motorcar::stop() const {
  cout << "Motorcar Stops!" << endl;
}

void Motorcycle::run() const {
  cout << "Motorcycle Runs!" << endl;
}
void Motorcycle::stop() const {
  cout << "Motorcycle Stops!" << endl;
}
