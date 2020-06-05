#include <stdlib.h>
#include <string.h>
#include <GL/glew.h>
#include <GL/freeglut.h>
#include <math.h>
#include <stdio.h>

#include "TransformConfig.h"
#include "Polygon.h"

// window title
#define WINDOW_TITLE_PREFIX "2D transformation algorithm"
// window size
int CurrentWidth = 800,
    CurrentHeight = 600,
    WindowHandle = 0;

// set some OpenGL state variables
void init() {
    glClearColor(0,0,0,1);
    glClear(GL_COLOR_BUFFER_BIT);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
    glOrtho(0,1000,0,1000,-1,100);
}
// draws line
void display(void)
{
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    Polygon triangle(3);
    glpoint point;

      point.no[0]= 0;
    point.no[1]= 0;
    point.no[2]= 0;
    triangle.setPoint(0,point);
    point.no[0]= 200;
    point.no[1]= 200;
    point.no[2]= 0;
    triangle.setPoint(1,point);
    point.no[0]= 300;
    point.no[1]= 200;
    point.no[2]= 0;
    triangle.setPoint(2,point);
    triangle.render();
    glpoint scale;
    scale.x=0.5;
    scale.y=0.5;
    triangle.Scale(scale,point);
    triangle.render();

    Polygon rectangle(4);
    point.x= 0;
    point.y= 0;
    point.z= 0;
    rectangle.setPoint(0,point);
    point.x= 0;
    point.y= 200;
    point.z= 0;
    rectangle.setPoint(1,point);
    point.no[0]= 200;
    point.no[1]= 200;
    point.no[2]= 0;
    rectangle.setPoint(2,point);
    point.no[0]= 200;
    point.no[1]= 0;
    point.no[2]= 0;
    rectangle.setPoint(3,point);
    rectangle.render();
    //rectangle.Translate(point);
    //rectangle.render();
    /*
      point.no[0]= 2;
    point.no[1]= 2;
    point.no[2]= 0;
    rectangle.Scale(point);
    rectangle.render();
    */
    glpoint s;
    s.x = 0.5;
    s.y = 0.5;
    point.no[0]= 100;
    point.no[1]= 100;
    point.no[2]= 0;
    rectangle.Scale(s,point);
    rectangle.render();

    glutSwapBuffers();
    glutPostRedisplay();
}
// handles windows size change
void ResizeFunction(int Width, int Height)
{
    CurrentWidth= Width;
    CurrentHeight= Height;
    glViewport(0,0,CurrentWidth,CurrentHeight);
}
// creates glut Window
void InitWindow(int argc, char* argv[])
{
    glutInit(&argc, argv);

    glutInitContextVersion(2,1);

    glutInitContextProfile(GLUT_CORE_PROFILE);

    glutSetOption(
                  GLUT_ACTION_ON_WINDOW_CLOSE,
                  GLUT_ACTION_GLUTMAINLOOP_RETURNS);
    glutInitWindowSize(CurrentWidth,CurrentHeight);

    glutInitDisplayMode(GLUT_DEPTH | GLUT_DOUBLE | GLUT_RGBA);

    WindowHandle = glutCreateWindow(WINDOW_TITLE_PREFIX);

    if(WindowHandle < 1){
        fprintf(
                stderr,
                "ERROR: Could not create a new rendering window\n");
        exit(EXIT_FAILURE);
    }
    glutReshapeFunc(ResizeFunction);
    glutDisplayFunc(display);
}
// main controller
int main(int argc, char** argv)
{
    InitWindow(argc,argv);
    init();
    glutMainLoop();
    return 0;
}
