#ifndef POLYGON_H
#define POLYGON_H

#include "Matrics.h"

class Polygon
{
 public:
    Polygon(int s);
    ~Polygon();
    bool setPoint(int no, glpoint n);
    bool Rotate(float theta, glpoint center);
    bool Rotate(float theta);
    bool Translate(glpoint vector);
    bool Scale(glpoint factor);
    bool Scale(glpoint factor, glpoint center);
    bool render();
private:
    bool applyTMatrix(Matrics T);
    int sides;
    glpoint *points;
};

#endif
