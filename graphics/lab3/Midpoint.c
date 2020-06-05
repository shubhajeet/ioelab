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
// Midpoint algorithm
void Circle(int xc, int yc, int r)
{
    int x = 0,y = r,p=1-r;
    glBegin(GL_POINTS);
    do
    {
        x+=1;
        if (p<0)
        {
            p += 2*x+1;
        }
        else
        {
            y -= 1;
            p += (2*x-2*y+2);
        }

        glVertex2f(xc+x,yc+y);
        glVertex2f(xc-x,yc+y);
        glVertex2f(xc+x,yc-y);
        glVertex2f(xc-x,yc-y);
        glVertex2f(xc+y,yc+x);
        glVertex2f(xc-y,yc+x);
        glVertex2f(xc+y,yc-x);
        glVertex2f(xc-y,yc-x);
        printf("%d,%d\n",xc+x,yc+y);
    }
    while(x<=y);
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
    Circle(6, 6, 5);
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
