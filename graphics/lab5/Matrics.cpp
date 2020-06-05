#include "Matrics.h"
#include <stdio.h>
#include <math.h>
Matrics::Matrics(int r,int c)
{
    row = r;
    column = c;
    no = new float*[r];
    for (int i = 0; i < r ; i++)
        no[i] = new float[c];
    setIdentity();
}
Matrics::~Matrics()
{
    /*for (int i = 0; i < row ; i++)
    delete no[i];
    delete no;
    */
}
bool Matrics::setIdentity()
{

    for(int i=0;i < row; i++)
    {
        for(int j=0; j < column; j++)
        {
            no[i][j] = (i==j)?1:0;
        }
    }
    return true;
}
int Matrics::getRow()
{
    return row;
}
int Matrics::getCol()
{
    return column;
}
Matrics Matrics::operator *(Matrics A)
{
    if (column == A.getRow())
    {
        Matrics Ans = Matrics(row,A.getCol());
        // looping through row
        for(int i = 0; i< row; i++)
        {
            // looping through column
            for(int j=0; j< A.getCol(); j++)
            {
                Ans.no[i][j] = 0;
                for(int k=0; k < column; k++)
                {
                    Ans.no[i][j] += no[i][k]*A.no[k][j];
                }
            }
        }
        return Ans;
    }
    else
    {

    }
}
Matrics Matrics::operator +(Matrics A)
{
    if (column == A.getCol() && row == A.getRow())
    {
        Matrics Ans = Matrics(row,column);
        // looping through row
        for(int i = 0; i< row; i++)
        {
            // looping through column
            for(int j=0; j< column; j++)
            {
                Ans.no[i][j] = no[i][j]+A.no[i][j];
            }
        }
        return Ans;
    }
    else
    {

    }
}

Matrics Matrics::operator -()
{
   for(int i = 0; i< row; i++)
        {
            // looping through column
            for(int j=0; j< column; j++)
            {
                no[i][j] *= -1;
            }
        }
   return *this;
}
bool Matrics::setTranslation(glpoint center)
{
    no[0][2] = center.no[0];
    no[1][2] = center.no[1];
    return true;
}
bool Matrics::setScaling(glpoint s)
{
    no[0][0] = s.no[0];
    no[1][1] = s.no[1];
    return true;
}
bool Matrics::setRotation(float theta)
{
    no[0][0] = cos(theta);
    no[0][1] = -sin(theta);
    no[1][0] = sin(theta);
    no[1][1] = cos(theta);
    return true;
}
bool Matrics::display()
{
    for(int i= 0; i < row; i++)
    {
        for(int j= 0; j< column; j++)
        {
            printf("%f ",no[i][j]);
        }
        printf("\n");
    }
    return true;
}
