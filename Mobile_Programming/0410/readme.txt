0410_MP_Study

[3-3]

onClick
-> Button의 속성! 
-> Android.onClick="ClickID"
-> 뒤에 나오는 "ClickID"는 JAVA파일에서 ID처럼 쓰일 이름.
-> 이 속성을 써주면, 항상 JAVA파일에서 메소드를 만들어줘야 한다! 아니면 빨간줄 생김.


Toast(토스트)는 안드로이드에서 작고 간단하게 메세지를 잠깐 보여 줄 수 있는 방법.
Toast.makeText(getApplicationContext(), "내용", Toast.LENGTH_LONG).show();
-> makeText() 메소드와 , show() 메소드를 이용해 메시지를 보여 줄 수 있다.

        Intent myIntent = new Intent(Intent.ACTION_VIEW, Uri.parse("tel:010-9211-1220"));
        //"tel:010-9211-1220"에서, tel하고 공백 추가하면 error발생. 반드시 붙여서 작성할 것.

==============================================
Activity 이름을 바꿀 때는, manifests에서도 변경을 해줘야해! 
-> 이것 때문에 엄청 고생함! 애초에 Activity 생성할 때 이름 바꿀일 없도록 주의.
