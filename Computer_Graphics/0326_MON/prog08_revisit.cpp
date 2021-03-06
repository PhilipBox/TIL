#include <glut.h>

void init();
void display();

int main(int argc, char* argv[])
{
	glutInit(&argc, (char**)argv);
	glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB | GLUT_DEPTH); // add display mode to enable depth test
	glutInitWindowSize(500, 500);
	glutCreateWindow("Revisit Prog08");
	glutDisplayFunc(display);

	init();
	glutMainLoop();
	return 0;
}

void init()
{
	glClearColor(1.0, 1.0, 1.0, 0.0);
	glOrtho(0.0, 50.0, 0.0, 50.0, -50.0, 50.0);
	glEnable(GL_DEPTH_TEST); // enable depth test
}

void display()
{
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT); // add GL_DEPTH_BUFFER_BIT

	GLfloat v0[3] = { 15, 15, 35 }, v1[3] = { 35, 15, 35 }, v2[3] = { 35,35, 35 }, v3[3] = { 15, 35, 35 };
	GLfloat v4[3] = { 40, 20, 15 }, v5[3] = { 20, 20, 15 }, v6[3] = { 40,40, 15 }, v7[3] = { 20, 40, 15 };

	glColor3f(1.0, 0.0, 0.0);
	glBegin(GL_POLYGON);
	glVertex3fv(v0);		//glVertex3f에서 glVertex3fv로 v가 생겼지. 배열의 주소를 적어준 것!
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

	glFlush();
}