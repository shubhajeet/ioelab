#ifndef MATRICS3F_H
#define MATRICS3F_H
#include "Matrics.h"

typedef struct{
    float no[3];
} glpoint;

class Matrics3f:public Matrics{
public:
    Matrics3f();
    bool setIdentity();
    bool setTranslation(glpoint p);
    bool setRotation(float theta);
    bool setScaling(glpoint s);
}
#endif
