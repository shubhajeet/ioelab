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
// Bresenhams algorithm
void Bresenham(int x1, int y1, int x2, int y2)
{
    int steps;
    int dx = x2 -x1;
    int dy = y2 -y1;
    int x = x1,y = y1;
    int stepx, stepy;
    stepx = (dx<0)?-1:1;
    stepy = (dy<0)?-1:1;

    if(abs(dx) > abs(dy))
    {
        steps = abs(dx);
        int p = 2*abs(dy) - abs(dx);
        glBegin(GL_POINTS);
        int stepl= 2*abs(dy);
        int stepg= 2*abs(dy)-2*abs(dx);
        for(int i=0;i<steps;i++)
        {
            if (p<0)
            {
                p += stepl;
            }
            else
            {
                p += stepg;
                y += stepy;
            }
            x += stepx;
            glVertex2f(x,y);
            printf("%d,%d\n",x,y);
        }
        glEnd();
    }
    else
    {
        int p = 2*abs(dx) - abs(dy);
        steps = abs(dy);
        int stepl= 2*abs(dx);
        int stepg= 2*abs(dx)-2*abs(dy);
        glBegin(GL_POINTS);
        for(int i=0;i<steps;i++)
        {
            if (p<0)
            {
                p += stepl;
            }
            else
            {
                p += stepg;
                x += stepx;
            }
            y += stepy;
            glVertex2f(x,y);
            printf("%d,%d\n",x,y);
        }
        glEnd();
    }
    //glFlush();
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
    Bresenham(200,1000,250,180);
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
