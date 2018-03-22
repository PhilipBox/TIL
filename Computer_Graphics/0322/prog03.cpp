#include <stdio.h>
#include <glut.h>
#include <time.h>
#include <stdlib.h>

static int delay = 1;
static float x, y, xinc, yinc;

void init();
void timer(int t);
void display();

int main(int argc, char* argv[])
{
	glutInit(&argc, (char**)argv);
	glutInitWindowSize(500, 500);
	glutCreateWindow("Prog03: Bouncing pixel");
	glutDisplayFunc(display);
	glutTimerFunc(delay, timer, 0);

	init();
	glutMainLoop();

	return 0;
}

void init()
{
	glClearColor(1.0, 1.0, 1.0, 1.0);
	glColor3f(1.0, 0.0, 0.0);
	gluOrtho2D(0.0, 50.0, 0.0, 50.0);
	glClear(GL_COLOR_BUFFER_BIT);

	srand(time(0));

	x = rand() % 50, y = rand() % 50;		// 0<= x,y <=50
	xinc = (float)(rand() % 50 - 25) / 250;	// -0.1 <= xinc <= 0.1
	yinc = (float)(rand() % 50 - 25) / 250; // -0.1 <= yinc <= 0.1
	
}

void display()
{
	glColor3f(x / 50.0, y / 50.0, 0.0);

	glBegin(GL_POINTS);
	glVertex2f(x, y);
	glEnd();
	glFlush();

	x += xinc, y += yinc;
	if (x < 0 || x >50)
	{
		x -= xinc;	
		xinc *= -1;
	}

	if (y < 0 || y>50)
	{
		y -= yinc;
		yinc *= -1;
	}
}

void timer(int t)
{
	glutPostRedisplay();
	glutTimerFunc(delay, timer, t);
}


