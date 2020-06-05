#include <stdlib.h>
#include <string.h>
#include <GL/glew.h>
#include <GL/freeglut.h>
#include <math.h>
#include <stdio.h>
// window title
#define WINDOW_TITLE_PREFIX "Ellipse Drawing algorithm"
// window size
int CurrentWidth = 800,
    CurrentHeight = 600,
    WindowHandle = 0;
// plot points
void plotSymmetricAxes(int x, int y, int xc, int yc)
{
    printf("Plotting at point (%d,%d)\n",xc+x,yc+y);
    glVertex2f(xc+x,yc+y);
    glVertex2f(xc-x,yc+y);
    glVertex2f(xc+x,yc-y);
    glVertex2f(xc-x,yc-y);
}
// Midpoint algorithm
void Ellipse(int xc, int yc, int rx, int ry)
{
    int x = 0,
        y = ry,
        ry2= ry *ry,
        rx2 = rx*rx,
        p = ry2 - rx2 *ry+ rx2 / 4;
    glBegin(GL_POINTS);
    //if(ry>rx)
    {
        printf("Region 1\n");
        /* Region 1 */
        while( (ry2*x) < (rx2*y) )
        {
            x += 1;
            if(p<0)
            {

                p += 2*ry2*x+ ry2;
            }
            else
            {
                y -= 1;
                p += 2*ry2*x + ry2 - 2 * rx2*y;
            }
            plotSymmetricAxes(x, y, xc, yc);
        }
        printf("Region 2\n");
        /*Region 2 */
        while(y >= 0)
        {
            y -= 1;
            if(p>0)
            {
                p += -2*rx2*y+ rx2;
            }
            else
            {
                x += 1;
                p += 2*ry2*x- 2*rx2*y + rx2;
            }
            plotSymmetricAxes(x, y, xc, yc);
        }
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
    //Ellipse(200, 400, 200, 100);
    Ellipse(6, 10, 5, 9);
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
