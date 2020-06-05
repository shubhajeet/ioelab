#include <stdlib.h>
#include <string.h>
#include <GL/glew.h>
#include <GL/freeglut.h>
#include <math.h>
#include <stdio.h>
// window title
#define WINDOW_TITLE_PREFIX "DDA line drawing algorithm"
// window size
int CurrentWidth = 800,
    CurrentHeight = 600,
    WindowHandle = 0;

// DDA algorithm
void DDA(int x1, int y1, int x2, int y2)
{
    int steps;
    int dx = x2 -x1;
    int dy = y2 -y1;
    if(abs(dx) > abs(dy))
    {
        steps = abs(dx);
    }
    else
    {
        steps = abs(dy);
    }
    float stepx, stepy;
    if (steps != 0)
    {
        stepx = (float) dx /steps;
        stepy = (float) dy /steps;
    }
    int i;
    float x = (float)x1,y = (float)y1;
    glColor3f(1.0,0.0,0.0);
    glBegin(GL_POINTS);
    for(i=0;i<steps;i++)
    {
        glVertex2f((int)x,(int)y);
        printf("%d,%d\n",(int)x,(int)y);
        x += stepx;
        y += stepy;
    }
    glEnd();
    glFlush();
}
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

    DDA(20,18,30,10);
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
