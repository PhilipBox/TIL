<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width,initial-scale=1,shrink-to-fit=no">
<title>로그인 회원가입 테스트 모델</title>
<!-- 부트스트랩 CSS 추가하기 -->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<!-- 커스텀 CSS 추가하기 -->
<link rel="stylesheet" href="./css/custom.css">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="index.jsp">테스팅 웹</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="index.jsp">메인</a></li>
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">회원관리</a>
					<div class="dropdown-menu" aria-labelledby="dropdown">
						<a class="dropdown-item" href="userLogin.jsp">로그인</a>
						<a class="dropdown-item" href="userJoin.jsp">회원가입</a>
						<a class="dropdown-item" href="userLogout.jsp">로그아웃</a>
					</div>
				</li>
			</ul>
		</div>
	</nav>
	<section class="container mt-3" style="max-width: 560px;">
		<form method="post" action="./userJoinAction.jsp">
			<div class="form-group">
				<label>아이디</label>
				<input type="text" name="userID" class="form-control">
			</div>
			<div class="form-group">
				<label>비밀번호</label>
				<input type="password" name="userPassword" class="form-control">
			</div>
			<div class="form-group">
				<label>이름</label>
				<input type="text" name="userName" class="form-control">
			</div>
			<div class="form-group">
				<label>사업자 유형</label>
				<input type="text" name="userType" class="form-control">
			</div>
			
			<button type="submit" class="btn btn-primary form-control">회원가입</button>
		</form>
	</section>
	<!-- 제이쿼리 자바스크립트 추가하기 -->
	<script src="./js/jquery.min.js"></script>
	<!-- 파퍼 자바스크립트 추가하기 -->
	<script src="./js/popper.js"></script>
	<!-- 부트스트립 자바스크립트 추가하기 -->
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>