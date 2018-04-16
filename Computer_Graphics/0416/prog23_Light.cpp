
// Prog23 : Light

#include <stdio.h>
#include <glut.h>
#include <math.h>

GLfloat vertices[][3] = 
{
	{ -1.0,-1.0,-1.0 },{ 1.0,-1.0,-1.0 },{ 1.0,1.0,-1.0 },{ -1.0,1.0,-1.0 },
	{-1.0,-1.0, 1.0 },{ 1.0,-1.0, 1.0 },{ 1.0,1.0, 1.0 },{ -1.0,1.0, 1.0 }
};

typedef struct {
	GLfloat pos[4];
	GLfloat amb[4];
	GLfloat dif[4];
	GLfloat spe[4];
}Light;

Light light = {
	{ 3.0, 3.0, 3.0, 1.0 },
	{ 1.0, 1.0, 1.0, 1.0 },
	{ 1.0, 1.0, 1.0, 1.0 },
	{ 1.0, 1.0, 1.0, 1.0 }
};

float addOffset = 0.1f;

void init();
void keyboard_handler(unsigned char key, int x, int y);
void normal(GLfloat *n);
void polygon(int a, int b, int c, int d);
void spin_cube();
void display();

int main(int argc, char* argv[])
{
	glutInit(&argc, (char**)argv);
	glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB | GLUT_DEPTH);
	glutInitWindowSize(500, 500);
	glutCreateWindow("Prog22: 3D gray cube");
	glutKeyboardFunc(keyboard_handler);
	glutDisplayFunc(display);

	init();
	glutMainLoop();

	return 0;
}


void keyboard_handler(unsigned char key, int x, int y) {
	if (key == 'X') {
		light.pos[0] += addOffset;
	}
	if (key == 'x') {
		light.pos[0] -= addOffset;
	}
	if (key == 'Y') {
		light.pos[1] += addOffset;
	}
	if (key == 'y') {
		light.pos[1] -= addOffset;
	}
	if (key == 'Z') {
		light.pos[2] += addOffset;
	}
	if (key == 'z') {
		light.pos[2] -= addOffset;
	}
	if (key == 'A') {
		light.amb[0] += addOffset;
		light.amb[1] += addOffset;
		light.amb[2] += addOffset;
	}
	if (key == 'a') {
		light.amb[0] -= addOffset;
		light.amb[1] -= addOffset;
		light.amb[2] -= addOffset;
	}
	if (key == 'D') {
		light.dif[0] += addOffset;
		light.dif[1] += addOffset;
		light.dif[2] += addOffset;
	}
	if (key == 'd') {
		light.dif[0] -= addOffset;
		light.dif[1] -= addOffset;
		light.dif[2] -= addOffset;
	}
	glutPostRedisplay();
} //end keyboard_handler function


void init()
{
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();

	glClearColor(1.0, 1.0, 1.0, 1.0);
	glColor3f(0.5, 0.5, 0.5);
	glOrtho(-2.0, 2.0, -2.0, 2.0, -10.0, 10.0);
	gluLookAt(2.0, 2.0, 2.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0);

	glEnable(GL_LIGHTING);
	glEnable(GL_LIGHT0);
	glShadeModel(GL_FLAT);
	glEnable(GL_DEPTH_TEST);
	glMatrixMode(GL_MODELVIEW);
}//end init function


void normal(GLfloat *n) {
	GLfloat x = sqrt(n[0] * n[0] + n[1] * n[1] + n[2] * n[2]);
	if (x > 0.0) {
		for (int i = 0; i < 3; i++)
			n[i] /= x;
	}
}//end normal function  -  nomalization 


void polygon(int a, int b, int c, int d)
{
	GLfloat nor[3];

	nor[0] = (vertices[a][0] + vertices[b][0] + vertices[c][0] + vertices[d][0]);
	nor[1] = (vertices[a][1] + vertices[b][1] + vertices[c][1] + vertices[d][1]);
	nor[2] = (vertices[a][2] + vertices[b][2] + vertices[c][2] + vertices[d][2]);

	normal(nor);	//normalization


	glBegin(GL_POLYGON);

	glNormal3fv(nor);
	glVertex3fv(vertices[a]);
	glVertex3fv(vertices[b]);
	glVertex3fv(vertices[c]);
	glVertex3fv(vertices[d]);
	glEnd();
}// end polygon function

void spin_cube()
{
	glutPostRedisplay();
}// end spin_cube function

void display()
{

	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

	glLoadIdentity();
	printf("%f\n", light.pos[0]);
	glLightfv(GL_LIGHT0, GL_AMBIENT, light.amb);
	glLightfv(GL_LIGHT0, GL_DIFFUSE, light.dif);
	glLightfv(GL_LIGHT0, GL_SPECULAR, light.spe);
	glLightfv(GL_LIGHT0, GL_SHININESS, light.pos);
	glLightfv(GL_LIGHT0, GL_POSITION, light.pos);

	polygon(0, 3, 2, 1);
	polygon(2, 3, 7, 6);
	polygon(0, 4, 7, 3);
	polygon(1, 2, 6, 5);
	polygon(4, 5, 6, 7);
	polygon(0, 1, 5, 4);

	glFlush();
	glutSwapBuffers();
}//end display function