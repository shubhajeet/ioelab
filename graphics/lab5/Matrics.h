#ifndef MATRICS_H
#define MATRICS_H

typedef struct{
    union
    {
        float no[3];
        struct
        {
            float x,y,z;
        };
    };
} glpoint;

class Matrics{
 private:
    int row, column;
    bool applyTMatrix(Matrics T);
 public:
    float **no;
    // constructor
    Matrics(int r, int c);
    // destructor
    ~Matrics();
    // dimension
    int getRow();
    // dimension
    int getCol();
    // operator overloading
    Matrics operator *(Matrics A);
    Matrics operator +(Matrics A);
    Matrics operator -();
    bool setIdentity();
    bool setTranslation(glpoint p);
    bool setRotation(float theta);
    bool setScaling(glpoint s);
    bool display();
};

#endif
