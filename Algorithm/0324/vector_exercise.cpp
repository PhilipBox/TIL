#include <stdio.h>
#include <vector>

using namespace std;

int main()
{
	vector<int> v;

	v.push_back(1);
	v.push_back(2);
	v.push_back(3);
	v.push_back(4);


	// �Ϲ������� vector�� ���� �ִ� ����
	for (int i = 0; i < 4; i++)
	{
		int n;
		scanf("%d", &n);
		v.push_back(n);
	}

	printf("v1 \n");
	for (int i = 0; i < v.size(); i++)
	{
		printf("%d ", v[i]);
	}



	return 0;
}