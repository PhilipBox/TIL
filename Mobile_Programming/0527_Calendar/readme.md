### Calendar
Calendar = getInstance()를 통해서 얻은 인스턴스는 기본적으로 현재 시스템의 날짜와 시간에 대한 정보를 담고 있다.<br>
원하는 날짜나 시간으로 설정하려면 set method를 사용하면 된다.<br>


## get(Calendar.MONTH) 주의점!
 한가지 주의해야할 것은 get(Calendar.MONTH)로 얻어오는 값의 범위가 1~12가 아닌, 0~11 이라는 것이다.<br>그래서 get(Calendar.MONTH)로 얻어오는 값이 0이면 1월을 의미하고 11이면 12월을 의미한다.