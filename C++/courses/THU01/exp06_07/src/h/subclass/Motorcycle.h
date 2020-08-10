#ifndef EXP07_MOTORCYCLE_H_
#define EXP07_MOTORCYCLE_H_

#include "Vehicle.h"

class Motorcycle : public Bicycle, public Motorcar{
 public:
  double length;
};

#endif