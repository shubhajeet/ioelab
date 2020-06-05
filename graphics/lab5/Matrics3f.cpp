#include "Matrics3f.h"

Matrics3f::Matrics3f():
    Matrics(3,3)
{
    setIdentity();
}
bool Matrics3f::setIdentity()
{
    for(int i;i < 3; i++)
        for(int j; j < 3; j++)
            no[i][j]=(i==j)?1:0;
}
bool Matrics3f::setTranslation(glpoint center)
{
    no[2][0] = center.no[0];
    no[2][1] = center.no[1];
    return true;
}
bool Matrics3f::setScaling(glpoint s)
{
    no[0][0] = s.no[0];
    no[1][1] = s.no[1];
    return true;
}
bool Matrics3f::setRotation(float theta)
{
    /*
      no[0][0] = sin(theta);
      no[0][1] = -cos(theta);
      no[1][0] = cos(theta);
      no[1][1] = sin(theta);
    */
    return true;
}
