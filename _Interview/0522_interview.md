## REST API란?
REST API란 REST 아키텍처 스타일을 기준으로 설계한 API를 말한다. REST아키텍쳐 스타일의 제약조건을 모두 만족하는 경우에, RESTful하다고 한다.

REST란, REpresentational  State Transfer의 줄임말로, 자원의 표현을 가지고 상태를 전달한다는 의미입니다.
자원의 표현이란 URI를 의미하고, 상태란 http method를 의미합니다.

예를들어서, GET이라는 http method로 상태를 나타내주고, 특정한 URL뒤에 books/123이라는 URI를 붙여줌으로써, 123번째 도서정보를 요청한다는 것을 파악할 수 있는 아키텍쳐 스타일을 REST라고 합니다.

## Swagger API 
- REST API를 HTML로 문서화해줌으로써 정의 및 기능을 확인할 수 있는 (오픈소스) 프레임워크.
- 백엔드 개발자와 프론트엔드 개발자의 소통 도구.

### swagger API is communication method
개발자는 인터페이스로 소통.
프론트엔드 개발자와의 협업을 위해서 Swagger를 도입. Swagger 덕분에 REST API 설계단계에서부터 명세를 명확하게 정할 수 있었고, API 문서화와 API Testing을 손쉽게 할 수 있었음.
+
협업이나 원격 근무 환경에서 프로젝트 수행 가능.
인터페이스 정의가 명확했다면 각자의 몫을 만들면 완성. 