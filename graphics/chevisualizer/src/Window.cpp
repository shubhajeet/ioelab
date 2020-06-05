#include "Window.h"
#include <iostream>
#include <iomanip>
#include <GL/glew.h>
#include <GL/freeglut.h>
#include "Shader.h"

const GLchar* Window::VertexShader =
    {
        "attribute vec3 lineVertex;"\
        "void main(){gl_Position = vec4(lineVertex,1.0);}"
    };
const GLchar* Window::FragmentShader =
    {
        "void main(void){gl_FragColor = vec4(1.0,0.0,1.0);}"
    };
void Window::CreateVBO(void)
{
  Vertex Vertices[] =
  {
    { { -0.8f, -0.8f, 0.0f, 1.0f }, { 1.0f, 0.0f, 0.0f, 1.0f } },
    { {  0.0f,  0.8f, 0.0f, 1.0f }, { 0.0f, 1.0f, 0.0f, 1.0f } },
    { {  0.8f, -0.8f, 0.0f, 1.0f }, { 0.0f, 0.0f, 1.0f, 1.0f } }
  };

  GLenum ErrorCheckValue = glGetError();
  const size_t BufferSize = sizeof(Vertices);
  const size_t VertexSize = sizeof(Vertices[0]);
  const size_t RgbOffset = sizeof(Vertices[0].XYZW);

  glGenVertexArrays(1, &VaoId);
  glBindVertexArray(VaoId);

  glGenBuffers(1, &VboId);
  glBindBuffer(GL_ARRAY_BUFFER, VboId);
  glBufferData(GL_ARRAY_BUFFER, BufferSize, Vertices, GL_STATIC_DRAW);

  glVertexAttribPointer(0, 4, GL_FLOAT, GL_FALSE, VertexSize, 0);
  glVertexAttribPointer(1, 4, GL_FLOAT, GL_FALSE, VertexSize, (GLvoid*)RgbOffset);

  glEnableVertexAttribArray(0);
  glEnableVertexAttribArray(1);

  ErrorCheckValue = glGetError();
  if (ErrorCheckValue != GL_NO_ERROR)
  {
      std::cerr << "ERROR: Could not create a VBO:" << gluErrorString(ErrorCheckValue);
    exit(-1);
  }
  std::cout << "created VB0";
}

void Window::DestroyVBO(void)
{
  GLenum ErrorCheckValue = glGetError();

  glDisableVertexAttribArray(1);
  glDisableVertexAttribArray(0);

  glBindBuffer(GL_ARRAY_BUFFER, 0);
  glDeleteBuffers(1, &VboId);

  glBindVertexArray(0);
  glDeleteVertexArrays(1, &VaoId);

  ErrorCheckValue = glGetError();
  if (ErrorCheckValue != GL_NO_ERROR)
  {
      std::cerr << "ERROR: Could not destroy the VBO:" << gluErrorString(ErrorCheckValue);
    exit(-1);
  }
}

void Window::CreateShaders(void)
{
  GLenum ErrorCheckValue = glGetError();

  VertexShaderId = glCreateShader(GL_VERTEX_SHADER);
  glShaderSource(VertexShaderId, 1, &VertexShader, NULL);
  glCompileShader(VertexShaderId);

  FragmentShaderId = glCreateShader(GL_FRAGMENT_SHADER);
  glShaderSource(FragmentShaderId, 1, &FragmentShader, NULL);
  glCompileShader(FragmentShaderId);

  ProgramId = glCreateProgram();
    glAttachShader(ProgramId, VertexShaderId);
    glAttachShader(ProgramId, FragmentShaderId);
  glLinkProgram(ProgramId);
  glUseProgram(ProgramId);

  ErrorCheckValue = glGetError();
  if (ErrorCheckValue != GL_NO_ERROR)
  {
      std::cerr << "ERROR: Could not create the shaders:"  <<
          gluErrorString(ErrorCheckValue);

    exit(-1);
  }
}

void Window::DestroyShaders(void)
{
  GLenum ErrorCheckValue = glGetError();

  glUseProgram(0);

  glDetachShader(ProgramId, VertexShaderId);
  glDetachShader(ProgramId, FragmentShaderId);

  glDeleteShader(FragmentShaderId);
  glDeleteShader(VertexShaderId);

  glDeleteProgram(ProgramId);

  ErrorCheckValue = glGetError();
  if (ErrorCheckValue != GL_NO_ERROR)
  {
      std::cerr << "ERROR: Could not destroy the shaders:" << gluErrorString(ErrorCheckValue);

    exit(-1);
  }
}

int Window::currentWidth = 800, Window::currentHeight = 600;
Window::Window(int argc, char **argv)
{
    title = "New Window";
    glutInit(&argc, argv);
    glutInitContextVersion(2,1);
    glutInitContextProfile(GLUT_CORE_PROFILE);

    glutSetOption(
        GLUT_ACTION_ON_WINDOW_CLOSE,
        GLUT_ACTION_GLUTMAINLOOP_RETURNS);

    glutInitWindowSize(currentWidth,currentHeight);
    glutInitDisplayMode(GLUT_DEPTH | GLUT_DOUBLE | GLUT_RGBA);
    windowHandle = glutCreateWindow(title.c_str());

    if(windowHandle < 1){
        std::cerr << "ERROR: Could not create a new rendering window\n";
        exit(EXIT_FAILURE);
    }
    init();
    int GlewInitResult = glewInit();

    if (GLEW_OK != GlewInitResult) {
        std::cerr << "ERROR GLEW:" << glewGetErrorString(GlewInitResult);
        exit(EXIT_FAILURE);
    }
    std::cout << "INFO :: Opengl Version" << glGetString(GL_VERSION);

    CreateShaders();
    CreateVBO();

    glutReshapeFunc(resizeFunction);
    glutDisplayFunc(display);

}

Window::~Window()
{
    DestroyShaders();
}

void Window::resizeFunction(int width, int height)
{
    currentWidth= width;
    currentHeight= height;
    glViewport(0,0,currentWidth,currentHeight);
}

// draws line
void Window::display(void)
{
    //std::cout << "drawing triangles";
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

    glDrawArrays(GL_TRIANGLES, 0, 3);

    glutSwapBuffers();
    glutPostRedisplay();
}

// set some OpenGL state variables
void Window::init() {
    glClearColor(0,0,0,1);
    glClear(GL_COLOR_BUFFER_BIT);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
    glOrtho(0,1,0,1,-1,100);
}

int Window::show()
{
    glutMainLoop();
    return 0;
}

bool Window::setTitle(std::string t)
{
    title = t;
    glutSetWindowTitle(title.c_str());
}
