#include "Polygon.h"
#include "Graphics.h"
#include "Matrics.h"

#include <stdio.h>
Polygon::Polygon(int s)
{
    sides = s;
    points = new glpoint[s];
}
Polygon::~Polygon()
{
    delete[] points;
}
bool Polygon::setPoint(int n, glpoint nw)
{
    points[n] = nw;
    //printf("%d point added %f %f %f\n",n,points[n].no[0],points[n].no[1]);
    return false;
}
bool Polygon::Rotate(float theta)
{
    Matrics T(3,3);
    printf("Displaying transforming matrix\n");
    T.display();
    T.setRotation(theta);
    printf("Displaying transforming matrix\n");
    T.display();
    return applyTMatrix(T);
}
bool Polygon::Rotate(float theta, glpoint center)
{
    Matrics T(3,3);
    T.setTranslation(center);
    Matrics R(3,3);
    R.setRotation(theta);
    Matrics Tin(3,3);
    center.no[0] *= -1;
    center.no[1] *= -1;
    Tin.setTranslation(center);

    return applyTMatrix(T*R*Tin);
    return false;
}
bool Polygon::applyTMatrix(Matrics T)
{
    Matrics pvec(3,1);
    for(int i=0; i<sides; i++)
    {
        pvec.no[0][0] = points[i].no[0];
        pvec.no[1][0] = points[i].no[1];
        pvec.no[2][0] = 1;
        printf("Displaying point vector\n");
        pvec.display();
        Matrics npoints = T * pvec;
        printf("Displaying product vector\n");
        npoints.display();
        points[i].no[0] = npoints.no[0][0];
        points[i].no[1] = npoints.no[1][0];
        points[i].no[2] = 1;
    }
    return true;
}
bool Polygon::Translate(glpoint vector)
{
    Matrics T(3,3);
    printf("Displaying transforming matrix\n");
    T.display();
    T.setTranslation(vector);
    printf("Displaying transforming matrix\n");
    T.display();
    return applyTMatrix(T);
}
bool Polygon::Scale(glpoint factor)
{
    Matrics T(3,3);
    printf("Displaying transforming matrix\n");
    T.display();
    T.setScaling(factor);
    printf("Displaying transforming matrix\n");
    T.display();
    return applyTMatrix(T);
}
bool Polygon::Scale(glpoint factor, glpoint center)
{
    Matrics T(3,3);
    T.setTranslation(center);
    Matrics R(3,3);
    R.setScaling(factor);
    Matrics Tin(3,3);
    center.no[0] *= -1;
    center.no[1] *= -1;
    Tin.setTranslation(center);
    return applyTMatrix(T*R*Tin);
}
bool Polygon::render()
{
    for (int i=0; i<sides; i++)
    {
        Bresenham(points[i].no[0],
                  points[i].no[1],
                  points[(i+1)%sides].no[0],
                  points[(i+1)%sides].no[1]
            );
    }
    return false;
}
