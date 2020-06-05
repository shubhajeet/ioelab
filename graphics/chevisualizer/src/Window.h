#ifndef WINDOW_H
#define WINDOW_H

#include <stdlib.h>
#include <string>

#include <GL/glew.h>
#include <GL/glut.h>
#include <math.h>

class Window
{
 private:
    std::string title;
    typedef struct
    {
        float XYZW[4];
        float RGBA[4];
    } Vertex;
    GLuint
        VertexShaderId,
        FragmentShaderId,
        ProgramId,
        VaoId,
        VboId;
    static const GLchar* VertexShader;
    static const GLchar* FragmentShader;
    void CreateVBO(void);
    void DestroyVBO(void);
    void CreateShaders(void);
    void DestroyShaders(void);
 protected:
    static int currentWidth,
        currentHeight;
    int windowHandle;
    std::string toitle;
    static void display();
    void init();
    static void resizeFunction(int width, int height);
 public:
    Window(int argc,char **argv);
    ~Window();
    bool setTitle(std::string);
    int show();
};
#endif
