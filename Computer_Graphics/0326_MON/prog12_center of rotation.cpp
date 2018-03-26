//Prog011: 3D Cube Rotation


#include <glut.h>
#include <time.h>
#include <stdlib.h>
#include <math.h>

void init();
void display();
void timer(int t);
void rotate(GLfloat*);
void center(GLfloat* v);
static int delay = 10; // milliseconds
static int theta = 0;

int main(int argc, char* argv[])
{
	glutInit(&argc, (char**)argv);
	glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB | GLUT_DEPTH); // add display mode to enable depth test
	glutInitWindowSize(500, 500);
	glutCreateWindow("Prog011: 3D Cube Rotation");
	glutDisplayFunc(display);
	glutTimerFunc(delay, timer, 0);

	init();
	glutMainLoop();
	return 0;
}

void init()
{
	glClearColor(1.0, 1.0, 1.0, 0.0);
	glOrtho(-50.0, 50.0, -50.0, 50.0, -50.0, 50.0);
	glEnable(GL_DEPTH_TEST); // enable depth test
}

void display()
{
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT); // add GL_DEPTH_BUFFER_BIT

	GLfloat v0[3] = { 15, 15, 35 }, v1[3] = { 35, 15, 35 }, v2[3] = { 35,35, 35 }, v3[3] = { 15, 35, 35 };
	GLfloat v4[3] = { 40, 20, 15 }, v5[3] = { 20, 20, 15 }, v6[3] = { 40,40, 15 }, v7[3] = { 20, 40, 15 };
	/*
	As time passes, theta has to be changed.
	The theta can be located in Display function or Timer function.
	In my codes, The theta is located in Timer function.
	*/
	
	// 이동먼저 후 회전! 순서가 중요해!
	center(v0);
	center(v1);
	center(v2);
	center(v3);
	center(v4);
	center(v5);
	center(v6);
	center(v7);


	rotate(v0);
	rotate(v1);
	rotate(v2);
	rotate(v3);
	rotate(v4);
	rotate(v5);
	rotate(v6);
	rotate(v7);

	glColor3f(1.0, 0.0, 0.0);
	glBegin(GL_POLYGON);
	glVertex3fv(v0);
	glVertex3fv(v1);
	glVertex3fv(v2);
	glVertex3fv(v3);
	glEnd();

	glColor3f(0.0, 1.0, 0.0);
	glBegin(GL_POLYGON);
	glVertex3fv(v0);
	glVertex3fv(v1);
	glVertex3fv(v4);
	glVertex3fv(v5);
	glEnd();

	glColor3f(0.0, 0.0, 1.0);
	glBegin(GL_POLYGON);
	glVertex3fv(v5);
	glVertex3fv(v4);
	glVertex3fv(v6);
	glVertex3fv(v7);
	glEnd();

	glColor3f(1.0, 1.0, 0.0);
	glBegin(GL_POLYGON);
	glVertex3fv(v7);
	glVertex3fv(v6);
	glVertex3fv(v2);
	glVertex3fv(v3);
	glEnd();

	glColor3f(0.0, 1.0, 1.0);
	glBegin(GL_POLYGON);
	glVertex3fv(v0);
	glVertex3fv(v5);
	glVertex3fv(v7);
	glVertex3fv(v3);
	glEnd();

	glColor3f(1.0, 0.0, 1.0);
	glBegin(GL_POLYGON);
	glVertex3fv(v1);
	glVertex3fv(v4);
	glVertex3fv(v6);
	glVertex3fv(v2);
	glEnd();

	//theta++;
	glFlush();
}

void rotate(GLfloat* v)
{
	float thetar = theta*(4.0*atan(1.0)) / 180.0;

	v[0] = (v[0] * cos(thetar)) + (v[2] * sin(thetar));
	v[2] = (v[0] * -sin(thetar)) + (v[2] * cos(thetar));
}

void center(GLfloat* v)
{
	v[0] = v[0] - 25;
	v[1] = v[1] - 25;
	v[2] = v[2] - 25;
}


void timer(int t)
{
	glutPostRedisplay(); // redraw gralatitudecs (rather than calling display() itself)		//새로운 화면을 다시 그리는거야! 이게 중요해!
						 //OS에게 display해 달라고 호출을 넘겨주는 거임!
	glutTimerFunc(delay, timer, t); // set timer function again //재귀호출!
	
	theta++;
}
