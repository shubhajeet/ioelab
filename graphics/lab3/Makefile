# Linux (default)
EXE = Midpoint
LDFLAGS = -ggdb -lm -lGL -lGLU -lglut
# Windows (cygwin)
ifeq "$(OS)" "Windows_NT"
	EXE = assignment1.exe
	LDFLAGS = -lopengl32 -lglu32 -lglut32
endif

# OS X
ifeq "$(OSTYPE)" "darwin"
	LDFLAGS = -framework Carbon -framework OpenGL -framework GLUT
endif

$(EXE) : Midpoint.c
	gcc -o $@ $< $(CFLAGS) $(LDFLAGS)
