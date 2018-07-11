<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Cloudike - 로그인</title>
<link rel="shortcut icon" href="/assets/favicon.ico">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="social_bots">
<style>
.app-loading {
	display: block;
	position: fixed;
	z-index: 2;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	min-height: 0;
	background: transparent;
	overflow: hidden;
}

.app-loading  .b-indicator, .app-loading  .b-background {
	position: absolute;
	left: 50%;
	top: 50%;
	z-index: 1;
	width: 90px;
	height: 90px;
	margin: -45px 0 0 -45px;
	background: none center center no-repeat;
	text-align: center
}

.app-loading  .b-indicator {
	z-index: 2;
	padding-top: 10px;
	background: transparent
		url("data:image/gif;base64,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")
		center 40px no-repeat;
}

.app-loading  .b-indicator span {
	display: inline-block;
	color: #FFF;
	font-size: 12px
}

.app-loading  .b-background {
	background-image:
		url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFoAAABaCAYAAAA4qEECAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAgY0hSTQAAeiYAAICEAAD6AAAAgOgAAHUwAADqYAAAOpgAABdwnLpRPAAAABl0RVh0U29mdHdhcmUAUGFpbnQuTkVUIHYzLjUuODc7gF0AAAIySURBVHhe7d2/SsNQFMfxxCVpbEsH1zqI4FzI1k4OgpPkTYL4Fl2y5BUcHJLFJ9DFoS/gOzh0EroY7wlNcRApp+ZQLt+CKNQsn/zOuX+WEwbbT9M0SV3XZ3meZ+v1Ot1sNlfuq5Pue37vJfAVRdH7ZDJZFUVRZ1n2EYbh5+5Jhzy8dp8kSZ7dP674OdxALMVUbFto98dpmqZ34B6O+5uh2IpxUJblRRzHr0D3Ay22YhxMp9MHkPtB7lzFOBiNRk9A9wstxoGL9hvQ/UIPBoOXAOR+kTtfoI22s0ADbVPSVq2TRJNoEs1diKIKaB0KNE1fBxpoejQ9WlEFtA4FGj3aCA1ooP1a2Eg0iSbR7DqMqgBooP1qNySaRJNo7joUVUDrUKBxYDFCAxpovxY2Ek2iSTS7DqMqABpov9oNiSbRJJq7DkUV0DoUaBxYjNCABtqvhY1Ek2gSza7DqAqABtqvdkOiSTSJ5q5DUQW0DgUaBxYjNKCB9mthI9EkmkSz6zCqAqCB9qvdkGgSTaK561BUAa1DgcaBxQgNaKD9WthINIkm0ew6jKoAaKD9ajckmkSTaO46FFVA61CgcWAxQgMaaL8WNhJ9zImWgVmaN8Qz+1epzDRkzJ5BFbRj9hgcuX8ytVXcDo5cLpeXjELtD1tsxbgd7jubzTLt2+K5v1+S2LbDfbeTlIeLxeKGcdX/l2yxnM/nt7tx1T8HsFdVde76yf14PH4kqTp0sRNDsZSh9p3vNwf3qsTp5l0vAAAAAElFTkSuQmCC")
}
</style>
<!-- compiled CSS -->
<link rel="stylesheet" type="text/css"
	href="./assets/ng-cloudike-2.3.1-1.css">
<!--Naver analytics script load-->
<script type="text/javascript"
	src="https://www.google-analytics.com/analytics.js"></script>
<script type="text/javascript"
	src="//www.googleadservices.com/pagead/conversion_async.js"></script>
<script src="https://www.googletagmanager.com/gtm.js?id=GTM-MTGXNT3"></script>
<script type="text/javascript" src="https://wcs.naver.net/wcslog.js"></script>
<script type="text/javascript">
	if (!wcs_add)
		var wcs_add = {};
	wcs_add["wa"] = "79c738b93c5b74";
	wcs.inflow();
	wcs_do();
</script>
<script
	src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/835808530/?random=1531139707988&amp;cv=9&amp;fst=1531139707988&amp;num=1&amp;label=Cloudike%20KR%20Remarketing&amp;guid=ON&amp;resp=GooglemKTybQhCsO&amp;u_h=864&amp;u_w=1536&amp;u_ah=824&amp;u_aw=1536&amp;u_cd=24&amp;u_his=2&amp;u_tz=540&amp;u_java=false&amp;u_nplug=3&amp;u_nmime=4&amp;gtm=G6c&amp;sendb=1&amp;frm=0&amp;url=https%3A%2F%2Fasd.cloudike.kr%2Foauth%3Fuse_ajax%3D1&amp;async=1&amp;rfmt=3&amp;fmt=4"></script>
</head>
<!-- Google Tag Manager -->
<!-- End Google Tag Manager -->
<body
	class="full-height body-gray body-without-fucking-bottom-padding toaster-position-top">
	<div style="display: none">
		<input name="file" type="file" id="accessibleUploader">
	</div>
	<div class="ng-file-over-container">
		<div class="ng-file-over-wrapper">
			<div></div>
			<i class="icon icon-upload text-muted"></i>
			<div class="ng-file-over-screen"></div>
		</div>
	</div>
	<div class="ng-scope">
		<div class="header b-nav ng-scope">
			<div class="navbar navbar-static-top">
				<div class="text-center">
					<span class="navbar-logo"> <img alt="Cloudike"
						src="./assets/cl-portrait-2.png">
					</span>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid g-layout g-layout__toolbar">
		<div class="position-relative">
			<div class="ng-scope"></div>
		</div>
	</div>
	<!-- uiView: preview -->
	<div class="ng-scope"></div>
	<!-- uiView: layout -->
	<div
		class="container-fluid g-layout g-layout__layout full-height ng-scope">
		<div class="row full-height ng-scope">
			<!-- uiView: main -->
			<div
				class="col-md-8 col-md-offset-2 full-height layout-col-pad g-scope">
				<div class="row oauth-form ng-scope company-domain">
					<div class="well well-lg col-md-6 col-md-offset-3 sexy-well">
						<h3 class="text-center break-word ng-scope">파트너 지원 시스템</h3>
						<div class="pad-t-10">
							<form name="forEmail"
								class="ng-invalid ng-invalid-required ng-pristine ng-invalid-last-attempt">
								<div class="form-group">
									<label class="ng-scope">이메일</label> <input type="email"
										name="email"
										class="form-control input-lg ng-scope ng-invalid ng-invalid-required ng-valid-maxlength ng-valid-email ng-animate ng-dirty-remove ng-dirty-remove-active ng-pristine"
										placeholder="이메일을 입력하세요" required="required">
									<div class="popover bottom fade in"></div>
								</div>
								<div class="form-group">
									<label class="ng-scope">비밀번호</label> <input type="password"
										name="password"
										class="form-control input-lg ng-scope ng-invalid ng-invalid-required ng-valid-maxlength ng-animate ng-dirty-remove ng-dirty-remove-active ng-pristine"
										placeholder="비밀번호를 입력하세요" required="required">
								</div>
								<div class="form-group has-error"></div>
								<button class="btn btn-lg btn-primary btn-block ng-scope"
									type="submit">로그인</button>
							</form>
							<div class="hg-hide">
								<!-- 버튼 하이드 <button class="btn btn-lg btn"></button> -->
							</div>
							<hr>
							<div class="form-group text-left">
								<span class="ng-scope"> 
								<label class="ng-scope">지역</label> 
								<label class="ng-scope">/</label>
								</span> 
								<span class="ng-scope"> <label class="ng-scope">
										地域</label>
								</span> <select class="form-control ng-pristine ng-valid">
									<option class="ng-scope" value="ko" selected="selected">한국</option>
									<option class="ng-scope" value="ja">日本</option>
								</select>
							</div>
							<div class="row">
								<div class="col-xs-6 text-left ng-scopecol-xs-offset-6">
									<a class="ng-scope" href="./join.jsp">회원등록</a>
								</div>
								<div class="col-xs-6 text-right ng-scopecol-xs-offset-6">
									<a class="ng-scope" href="./resetpassword.jsp">비밀번호를<br>
										잊으셨나요?
									</a>
								</div>
							</div>
							<div class="text-right">
								<img class="mar-t-20" src="./assets/poweredby.png" width="40%">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>