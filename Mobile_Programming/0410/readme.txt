0410_MP_Study

[3-3]

onClick
-> Button�� �Ӽ�! 
-> Android.onClick="ClickID"
-> �ڿ� ������ "ClickID"�� JAVA���Ͽ��� IDó�� ���� �̸�.
-> �� �Ӽ��� ���ָ�, �׻� JAVA���Ͽ��� �޼ҵ带 �������� �Ѵ�! �ƴϸ� ������ ����.


Toast(�佺Ʈ)�� �ȵ���̵忡�� �۰� �����ϰ� �޼����� ��� ���� �� �� �ִ� ���.
Toast.makeText(getApplicationContext(), "����", Toast.LENGTH_LONG).show();
-> makeText() �޼ҵ�� , show() �޼ҵ带 �̿��� �޽����� ���� �� �� �ִ�.

        Intent myIntent = new Intent(Intent.ACTION_VIEW, Uri.parse("tel:010-9211-1220"));
        //"tel:010-9211-1220"����, tel�ϰ� ���� �߰��ϸ� error�߻�. �ݵ�� �ٿ��� �ۼ��� ��.

==============================================
Activity �̸��� �ٲ� ����, manifests������ ������ �������! 
-> �̰� ������ ��û �����! ���ʿ� Activity ������ �� �̸� �ٲ��� ������ ����.
