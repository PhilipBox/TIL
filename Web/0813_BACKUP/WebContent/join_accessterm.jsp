<!-- modal dialog창으로 구현 -->
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

<body>
	<div id="accessterm" tabindex="-1" role="dialog"
		class="modal fade ng-isolate-scope in"
		style="z-index: 1050; display: block;">
		<div class="modal-dialog modal-lg" style="">
			<div class="modal-content">
				<div class="modal-tabs ng-scope">
					<button type="button" class="close">
						<i class="icon icon-cross"></i>
					</button>
					<div class="modal-tabs-tabset ng-isolate-scope">
						<ul class="nav nav-tabs nav-justified">
							<li class="ng-isolate-scope active"><a class="ng-binding">
									<span translate="" class="ng-scope">개인정보 이용약관</span>
							</a></li>
						</ul>
						<div class="tab-content">
							<!-- ngRepeat: tab in tabs -->
							<div class="tab-pane ng-scope active">


								<iframe src="https://api.cloudike.kr/api/1/accounts/get_offer/"
									width="100%" height="500px"
									sandbox="allow-top-navigation allow-scripts" class="ng-scope"></iframe>
							</div>
							<!-- end ngRepeat: tab in tabs -->
							<div class="tab-pane ng-scope">


								<div class="privacy-policy ng-scope">
									<h4>클라우다이크(Cloudike) 개인정보 수집 및 이용 동의 약관</h4>
									<label class="mar-t-20">ASD코리아는 정보통신서비스제공자가 준수하여야 하는
										대한민국의 관계 법령 및 개인정보보호 규정, 가이드라인을 준수하고 있습니다.</label> <label>"개인정보취급방침"이란
										이용자의 소중한 개인정보를 보호함으로써 이용자가 안심하고 서비스를 이용할 수 있도록 ASD코리아가 준수해야할
										지침을 의미합니다.</label> <label>주식회사 ASD코리아(이하"회사")는 통신비밀보호법,
										전기통신사업법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 등 정보통신서비스제공자가 준수하여야 할 관련
										법령상의 개인정보 보호 규정을 준수하며, 관련 법령에 의거한 개인정보취급방침을 정하여 이용자 권익 보호에 최선을
										다합니다.</label> <label>본 개인정보취급방침은 회사에서 제공하는 ‘클라우다이크 서비스’에 적용되며
										아래와 같은 내용을 담고 있습니다.</label> <label class="mar-t-20">- 개인정보의 수집
										및 이용</label> <label>회사는 홈페이지를 통해 아래와 같이 개인정보를 수집하고 있습니다.</label> <label>1.
										회사는 회원가입 및 고객 상담, 고객불만 접수 및 처리, 고지사항 전달, 분쟁조정을 위한 기록보존을 위해 회원의
										이름/기업명/비밀번호 등을 수집합니다.</label> <label>2. 회사는 유효한 이메일 아이디 가입 인증,
										회원제 서비스 이용에 따른 본인확인 및 개인 식별을 위해 회원의 이메일주소/전화번호 등을 수집합니다.</label> <label>3.
										회사는 회원제 서비스 이용에 따른 본인확인, 개인식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입의사
										확인, 가입 및 가입횟수 제한, 불만처리, 민원처리 등을 위해 회원의 서비스 이용기록/접속로그/쿠키/접속IP정보
										등을 수집합니다.</label> <label>4. 회사는 금융거래 관련 본인인증 및 금융서비스, 서비스 제공에
										관한 계약의 이행 및 서비스 제공에 따른 요금정산을 위해 회원의 은행계좌정보/사업자등록증/신용카드정보/결제기록
										등을 수집합니다.</label> <label>5. 회사는 마케팅 및 광고를 목적으로 회원에게 콘텐츠 제공,
										이벤트/경품당첨 결과 안내 및 상품배송을 위해 회원의 표시이름, 추천인아이디, 서비스를 알게 된 경로 등을
										수집합니다.</label> <label class="mar-t-20">- 개인정보의 수집 방법</label> <label>회사는
										홈페이지(회원가입)상담절차, 클라우다이크 서비스 사용 시 생성 정보 수집 툴을 통한 방법(쿠키)등으로 개인
										정보를 수집합니다.</label> <label class="mar-t-20">- 개인정보 제 3자 제공 및 위탁</label>
									<label>회원의 개인정보를 상기 수집, 이용목적에 고지한 범위 내에서 사용하며, 원칙적으로
										범위를 초과하여 이용하거나 타인 또는 타기업, 기관에 제공하지 않습니다. 단, 이용자가 외부 제휴사의 서비스를
										이용하기 위하여 개인정보 제공에 직접 동의를 한 경우, 그리고 관련 법령에 의하여 회사에 개인정보 제출 의무가
										발생한 경우에 한하여 개인정보를 제공하고 있습니다.</label> <label>회사는 서비스 제공을 위하여
										필요한 업무 중 일부를 외부 업체에 위탁하고 있으며, 위탁 받은 업체가 정보통신망법에 따라 개인정보를 안전하게
										취급하도록 필요한 사항을 규정하고 관리/감독을 하고 있습니다.</label>

									<h5 class="mar-t-20">- 수탁업체: NICE페이먼츠㈜</h5>
									<h5>위탁업무 내용: 카드정보 등록 시 클라우드 스토리지 이용 요금 결제.</h5>
									<h5>개인정보 보유 및 이용기간: 회원탈퇴 시 혹은 위탁계약 종료 시까지</h5>

									<label class="mar-t-20">- 보유 및 이용 기간</label> <label>1.
										회사는 관련 법령에 규정된 바에 따라 수집된 개인정보는 당사와 회원님 간의 서비스이용계약기간 동안 보유하여
										이용합니다. 보존 항목, 이용기간, 보유기간은 아래와 같으며 보유기간이 경과하면 개인정보는 재생이 불가능한
										방법으로 지체없이 파기됩니다.</label> <label>- 보존 항목: 이름, 로그인ID, 비밀번호,
										전화번호, 이메일, 비밀번호, 기업명, 관리자명, 서비스이용기록, 접속 로그, 접속IP 정보, 결제 기록</label> <label>-
										이용기간: 서비스 가입 일부터 해지 일까지</label> <label>- 보유기간: 요금정산 분쟁 대비를 위해
										해지 후 6개월까지, 미납이 있을 경우 해결시까지</label> <label>2. 관계법령의 규정에 의하여
										보존할 필요가 있는 경우 아래와 같이 관계법령에서 정한 일정한 기간 동안 개인정보를 보관합니다.</label> <label>-
										계약 또는 청약철회 등에 관한 기록: 5년(전자상거래등에서의 소비자보호에 관한 법률)</label> <label>-
										대금결제 및 재화 등의 공급에 관한 기록: 5년(전자상거래등에서의 소비자보호에 관한 법률)</label> <label>-
										소비자의 불만 또는 분쟁처리에 관한 기록: 3년(전자상거래등에서의 소비자보호에 관한 법률)</label> <label>-
										신용정보의 수집/처리 및 이용 등에 관한 기록: 3년(신용정보의 이용 및 보호에 관한 법률)</label> <label>-
										동의 거부권 및 미 동의에 대한 불이익 안내 : 회원님께서는 정보주체로서 개인정보 동의 거부권이 있으시며,
										미동의 시 서비스가입 및 이용에 제약이 있을 수 있고 미동의 하신 경우 정보가 제공되지 않습니다.</label> <label
										class="mar-t-20">- 개인정보관리책임자 및 담당자</label> <label>만약
										개인정보보호정책에 대해 지켜지지 않은 사항이 발생한 경우, 신고를 해주시면 최대한 빠르게 조치하겠으며, 궁금하신
										사항 혹은 제안하실 사항이 있는 경우, 아래의 개인정보관리담당자 앞으로 연락을 주시면 성심껏 답변해 드리겠습니다
										단, 이용자 본인의 부주의나 인터넷 상의 문제로 계정, 비밀번호 등 개인정보가 유출되어 발생한 문제에 대해
										회사는 일체의 책임을 지지 않습니다.</label>

									<h5 class="mar-t-20">개인정보관리책임자</h5>
									<h5>이름 : 이선웅</h5>
									<h5>직위 : 대표</h5>
									<h5>소속 : ASD코리아</h5>
									<h5>메일 : sunung@asdtech.co</h5>

									<h5 class="mar-t-20">개인정보관리담당자</h5>
									<h5>이름 : 우원구</h5>
									<h5>직위 : 팀장</h5>
									<h5>소속 : ASD코리아 사업팀</h5>
									<h5>메일 : wgwoo@asdtech.co</h5>

									<h5>(부칙)</h5>
									<h5>(시행일)본 약관은 2017년 10월 31일부터 시행합니다</h5>
								</div>
							</div>
							<!-- end ngRepeat: tab in tabs -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>