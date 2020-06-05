#include <stdlib.h>
#include <string.h>
#include <GL/glew.h>
#include <GL/glut.h>
#include <math.h>
#include <iostream>
#include <string>

#include "Config.h"
#include "Window.h"

int main(int argc, char** argv)
{
    //    std::cout << "Running Chevisualizer Major Version" << VERSION_MAJOR << "Minor Version"<< VERSION_MINOR;
    Window w(argc--,argv++);
    w.setTitle("Chemical Visualizer");
    w.show();
    return 0;
}
