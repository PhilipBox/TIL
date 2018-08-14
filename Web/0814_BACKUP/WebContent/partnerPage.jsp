<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="util.DatabaseUtil"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.text.*"%>
<%
	DecimalFormat format = new DecimalFormat("###,###");
%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>Coludike</title>
<style>
#homeLogo {
	margin: 10px;
	padding-right: 15px
}

.btn-primary {
	color: #555;
	background-color: #ffd659;
	border-color: #fab545
}

table.type04 {
	border-collapse: separate;
	border-spacing: 1px;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	margin: 10px 10px;
}

table.type04 th {
	width: 150px;
	padding: 5px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}

table.type04 td {
	width: 350px;
	padding: 5px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}

table.type05 th {
	width: 50px;
	padding: 5px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}

table.type05 td {
	width: 100px;
	padding: 5px;
	text-align: right;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}

t
.dropbtn {
	background-color: #4CAF50;
	color: white;
	padding: 16px;
	font-size: 16px;
	border: none;
	cursor: pointer;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	right: 0;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-event-content {
	display: none;
	position: absolute;
	right: 0;
	background-color: #f9f9f9;
	min-width: 300px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
	overflow: auto;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown-event-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	max-height: 300px;
	display: block;
	overflow: auto;
}

.dropdown-content a:hover {
	background-color: #ffd659
}

.dropdown-event-content a:hover {
	max-height: 700px;
	background-color: #ffd659
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown:hover .dropdown-event-content {
	max-height: 700px;
	display: block;
}

.dropdown:hover .dropbtn {
	background-color: #3e8e41;
}

<!--
스크롤 디자인
::-webkit-scrollbar {
	width: 16px;
}

::-webkit-scrollbar-track {
	background-color: #f1f1f1;
}

::-webkit-scrollbar-thumb {
	background-color: #f1ef79;
	border-radius: 10px;
}

::-webkit-scrollbar-thumb:hover {
	background: #555;
}

::-webkit-scrollbar-button:start:decrement, ::-webkit-scrollbar-button:end:increment
	{
	width: 16px;
	height: 16px;
	background: #f1ef79;
}
-->

a :link{
color: #cc0000;
}

</style>

<!-- compiled CSS -->
<link rel="stylesheet" type="text/css"
	href="./assets/ng-cloudike-2.3.1-1.css">
<!--Naver analytics script load-->
<script type="text/javascript"
	src="https://www.google-analytics.com/analytics.js"></script>
<script language="javascript"
	src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
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


<!-- 검색 -->

<script>
	function totalTable() {
		RMtotalSearch();
	}
	function currentMonthFunction() {
		alert("이번달");
<%int currentYearS = Calendar.getInstance().get(Calendar.YEAR);
			int currentMonthS = Calendar.getInstance().get(Calendar.MONTH) + 1;%>
	var currentYearS =
<%=currentYearS%>
	;
		var currentMonthS =
<%=currentMonthS%>
	;

		var scurrentYear = String(currentYearS);
		var scurrentMonth = String(currentMonthS);

		if (currentMonthS < 10)
			scurrentMonth = "0" + scurrentMonth;

		var startDate = scurrentYear + "/" + scurrentMonth + "/01";
		var endDate = scurrentYear + "/" + scurrentMonth + "/31";
		var customer_code = "";
		//alert("ees달"+scurrentYear);
		RMsearch(startDate, endDate, customer_code);
		//RMsearch(); //callAjax_ARM_codeSearch

	}

	function preMonthFunction() {
		alert("지난달");
<%int preYear = Calendar.getInstance().get(Calendar.YEAR);
			int preMonth = Calendar.getInstance().get(Calendar.MONTH);%>
	var preYear =
<%=preYear%>
	;
		var preMonth =
<%=preMonth%>
	;

		var spreYear = String(preYear);
		var spreMonth = String(preMonth);

		if (spreMonth < 10)
			spreMonth = "0" + spreMonth;

		var startDate = spreYear + "/" + spreMonth + "/01";
		var endDate = spreYear + "/" + spreMonth + "/31";
		var customer_code = "";
		var partner_code = "";
		alert("ees달" + endDate);
		RMsearch(startDate, endDate, customer_code);
		//RMsearch(); //callAjax_ARM_codeSearch

	}

	//검색버튼

	function searchBtn() {//ARM_search_btn\\\

		var start_year = $('#start_year').val();
		var start_month = $('#start_month').val();
		var end_year = $('#end_year').val();
		var end_month = $('#end_month').val();

		var customer_code = $('#customer_code').val();
		var customer_name = $('#customer_name').val();

		var startDate = "";
		var endDate = "";

		//alert("코드번호로 검색을 실시합니다.");

		//유효성 검사
		if (customer_code == "" && customer_name == "") {
			if ((start_year == "") || (start_month == "") || (end_year == "")
					|| (end_month == "")) {
				alert("기간/고객코드/고객사명 중 하나는 꼭 입력하세요.");
				$("#start_year").val("");
				$("#start_month").val("");
				$("#end_year").val("");
				$("#end_month").val("");
				$("#start_year").focus();

				return false;
			}
		}

		if (customer_code != "" && customer_name != "") {
			alert("고객코드와 고객사명 중에서 한가지만 입력해 주세요.");
			$("#customer_code").val("");
			$("#customer_name").val("");
			$("#customer_code").focus();

			return false;

		}

		if (!((start_year == "") || (start_month == "") || (end_year == "") || (end_month == ""))) {
			startDate = start_year + "/" + start_month + "/01";
			endDate = end_year + "/" + end_month + "/31";
		}

		RMsearch(startDate, endDate, customer_code, customer_name); //callAjax_ARM_codeSearch

	}//end function

	function RMtotalSearch() {
		alert("들어옴");
		$.ajax({
			type : "post",
			url : "./partnerTotalSearchRM.jsp",
			data : {
				userCode : $('#userCode').val()

			},
			success : ssSuccess,
			error : ssError
		});
	}
	function RMsearch(startDate, endDate, customer_code, customer_name) {
		alert("들어옴");
		$.ajax({
			type : "post",
			url : "./partnerSearchRM.jsp",
			//url : "./ajax_test.jsp",
			data : {
				userCode : $('#userCode').val(),
				startDate : startDate,
				endDate : endDate,
				customer_code : customer_code,
				customer_name : customer_name
			},
			success : ssSuccess,
			error : ssError
		});
	}// END 등록 버튼 데이터 전송 함수
	function ssSuccess(resdata) {
		$("#divTable").html(resdata);
		console.log(resdata);
		alert("성공찡");
	}
	function ssError() {
		alert("Error");
	}
</script>

<script type="text/javascript">
	function RMfunction() {
		alert("[실적 관리 메뉴]");
		$("#side_item2").css("font-weight", "bold");
		$("#side_item1").css("font-weight", "normal");
		$("#side_item3").css("font-weight", "normal");
		$("#divProfile").css("display", "none");
		$("#divRM").css("display", "block");
		$("#tableGraph").css("display", "none");
	}
	function profileFunction() {
		alert("[내 정보 관리 메뉴]");
		$("#side_item1").css("font-weight", "bold");
		$("#side_item2").css("font-weight", "normal");
		$("#side_item3").css("font-weight", "normal");
		$("#divRM").css("display", "none");
		$("#divProfile").css("display", "block");
		$("#tableGraph").css("display", "none");

	}
	function graphFunction() {
		alert("[월별 실적 보기 메뉴]");
		$("#side_item3").css("font-weight", "bold");
		$("#side_item2").css("font-weight", "normal");
		$("#side_item1").css("font-weight", "normal");
		$("#divRM").css("display", "none");
		$("#divProfile").css("display", "none");
		$("#tableGraph").css("display", "block");
	}

	function name_edit_click() {
		$("input[name='userName']").attr("readonly", false);
		var table_fee = document.getElementById("userName");
		table_fee.style.border = "1px solid #737373";
	}
	function tel_edit_click() {
		$("input[name='userTel']").attr("readonly", false);
		var table_fee = document.getElementById("userTel");
		table_fee.style.border = "1px solid #737373";
	}
	function test_click() {
		alert("버튼1을 누르셨습니다.");
		//	location.replace('profileSetting.jsp');
	}
	function checkDate() {
		var date = $("#billDate").val();
		//date = date.value;
		date = parseInt(date);
		//startDt.compareTo(endDt)
		if (date > 28) {
			alert("계산서 발행일은 28일 이전으로만 설정 가능합니다.");
			$("#billDate").val("");
			$("#billDate").focus();
			return false;
		}
		return true;
	}

	function checkImgExtend(imgName) {

		var index = imgName.lastIndexOf(".");
		var tmp = imgName.substring(index + 1);

		if (tmp.toLowerCase() == "jpg" || tmp.toLowerCase() == "gif"
				|| tmp.toLowerCase() == "png") {
			alert("확장자 true");
			return true;
		}
		alert("확장자 false");
		return false;
	}
	function checkImgSize(file) {
		// 사이즈체크
		var maxSize = 5 * 1024 * 1024 //30MB
		var fileSize = 0;
		// 브라우저 확인
		var browser = navigator.appName;
		// 익스플로러일 경우
		if (browser == "Microsoft Internet Explorer") {
			var oas = new ActiveXObject("Scripting.FileSystemObject");
			fileSize = oas.getFile(file.value).size;
		}
		// 익스플로러가 아닐경우
		else {
			fileSize = file.files[0].size;
		}

		alert("파일사이즈 : " + fileSize + ", 최대파일사이즈 : 5MB");

		if (fileSize > maxSize) {
			alert("첨부파일 사이즈는 5MB 이내로 등록 가능합니다.");
			return false;
		}

		//document.fileForm.submit();
		return true;
	}
	function businessOk(file) {

		var imgPath = document.getElementById("businessImg");
		imgPath = imgPath.value;
		//alert("imgPath "+imgPath);
		var index = imgPath.lastIndexOf("\\");
		var imgName = imgPath.substring(index + 1);

		if ((checkImgExtend(imgName) == true) && (checkImgSize(file) == true))
			updateBusiness(imgName);
		// alert(imgName);

	}
	function accountOk(file) {

		var imgPath = document.getElementById("accountImg");
		imgPath = imgPath.value;
		//alert("imgPath "+imgPath);
		var index = imgPath.lastIndexOf("\\");
		var imgName = imgPath.substring(index + 1);

		if ((checkImgExtend(imgName) == true) && (checkImgSize(file) == true))
			updateAccount(imgName);
		// alert(imgName);

	}

	$(document)
			.ready(
					function() {
						$("#flip").click(function() {
							$("#flipContent").slideToggle("normal");
						});//graphText
						$("#flip2").click(function() {
							$("#graphText").slideToggle("normal");
						});//graphText unpaidText
						$("#flip3").click(function() {
							$("#unpaidText").slideToggle("normal");
						});

						$("#btn_name_ok").click(
								function() {
									alert("이름 확인 버튼은 눌렸음");
									var getName = RegExp(/^[가-힣]+$/);
									if (!getName.test($("#userName").val())) {
										alert("이름을 다시 입력하세요.");
										$("#userName").val("");
										$("#userName").focus();
										return;
									}

									var table_fee = document
											.getElementById("userName");
									table_fee.style.border = "0 solid blue";
									updateName();
								});
						$("#btn_tel_ok")
								.click(
										function() {
											alert("전화번호 확인 버튼은 눌렸음");
											var p = $("#userTel").val();
											//p = p.split('-').join('');
											//	alert("p!!" + p);
											var regPhone = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
											if (!regPhone.test(p)) {
												alert("전화번호를 다시 입력하세요.");
												$("#userTel").val("");
												$("#userTel").focus();
												return;
											}

											var table_fee = document
													.getElementById("userTel");
											table_fee.style.border = "0 solid blue";
											updateTel();
										});
						$("#btn_business_ok").click(function() {

						});
						$("#btn_account_ok").click(
								function() {
									var imgPath = document
											.getElementById("accountImg");
									imgPath = imgPath.value;
									//alert("imgPath "+imgPath);
									var index = imgPath.lastIndexOf("\\");
									var imgName = imgPath.substring(index + 1);
									// alert(imgName);
									updateAccount(imgName);
									//$("#account").text("등록");

								});
						$("#btn_bill_ok").click(function() {
							alert("계산서 발행일");
							if (checkDate())
								updateBillDate();
							//var temp = $("#bill_date").val();
							//$("#bill_date").val(temp);
						});
					});
	function updateName() {

		$.ajax({
			type : "post",
			url : "./profileNameSet.jsp",
			data : {
				userCode : $('#userCode').val(),
				userName : $('#userName').val()
			},
			success : ajaxSuccess,
			error : ajaxError
		});
	}
	function updateTel() {

		$.ajax({
			type : "post",
			url : "./profileTelSet.jsp",
			data : {

				userCode : $('#userCode').val(),
				userTel : $('#userTel').val()
			},
			success : ajaxSuccess,
			error : ajaxError
		});
	}
	function updateBillDate() {

		$.ajax({
			type : "post",
			url : "./profileBillSet.jsp",
			data : {
				userCode : $('#userCode').val(),
				billDate : $('#billDate').val()
			},
			success : ajaxSuccess,
			error : ajaxError
		});
	}
	function updateBusiness(imgName) {
		//alert("real" + imgName);
		$.ajax({
			type : "post",
			url : "./profileBusinessSet.jsp", //profileBusinessSet
			data : {
				userCode : $('#userCode').val(),
				business : imgName
			},
			success : ajaxSuccess,
			error : ajaxError
		});

		//$("#business").text("등록");
	}
	function updateAccount(imgName) {
		//alert("real" + imgName);
		$.ajax({
			type : "post",
			url : "./profileAccountSet.jsp",
			data : {
				userCode : $('#userCode').val(),
				account : imgName
			},
			success : ajaxSuccess,
			error : ajaxError
		});

		//$("#account").text("등록");
	}
	function ajaxSuccess(resdata) {
		alert("Success");
	}
	function ajaxError() {
		alert("Error");
	}

	function clear_input(input_id) {
		var got_input_id = input_id;
		var clear = document.getElementById(got_input_id);
		clear.value = "";
	}
</script>

<!-- 전체 db -->
<%
	Connection conn = DatabaseUtil.getConnection();
	out.print("db 연결 정보 " + conn);
	Statement stmt = conn.createStatement();
	String userCodeInit = (String) session.getAttribute("userCodeDB");

	out.print("userCode " + userCodeInit);

	//내정보 db로딩
	//TODO : where user가 이거일때 !!
	//String sql = "select * from PARTNER ";

	String sql = "select * from PARTNER where userCode=?";

	//stmt.executeQuery(sql);

	PreparedStatement pstmt = conn.prepareStatement(sql);

	pstmt.setString(1, userCodeInit);
	// pstmt.executeUpdate();
	ResultSet rs = null;
	rs = pstmt.executeQuery();
%>

<!-- Graph  -->
<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="http://code.highcharts.com/highcharts.js"></script>
<%
	//그래프

	//out.print("db 연결 정보 " + conn);

	String userCodeInitGr = (String) session.getAttribute("userCodeDB");

	//String userCodeInitGr = "PKC222";
	String sqlGr = "select c_billDate, c_margin, c_plan, c_unpaid from customer where userCode=?";

	//stmt.executeQuery(sql);

	PreparedStatement pstmtGr = conn.prepareStatement(sqlGr);

	pstmtGr.setString(1, userCodeInitGr);
	// pstmt.executeUpdate();
	ResultSet rsGr = null;
	rsGr = pstmtGr.executeQuery();

	int[] price = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
	int[] priceUn = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
	String compare = "01";

	//순서대로 basic standard profession custom
	int[] count = {0, 0, 0, 0};

	int currentYear = Calendar.getInstance().get(Calendar.YEAR);
	int currentMonth = Calendar.getInstance().get(Calendar.MONTH) + 1;

	String sCY = Integer.toString(currentYear);
	//sCY=sCY+"년 월별 판매량";
	/*
	앞에 변수가 크면 1, 작으면 -1, 같으면 0
	int result1 = calendar1.compareTo(calendar2);*/
	while (rsGr.next()) {
		String c_billDate = rsGr.getString("c_billDate");
		String c_margin = rsGr.getString("c_margin");
		String c_plan = rsGr.getString("c_plan");
		String c_unpaid = rsGr.getString("c_unpaid");


		int year = Integer.parseInt(c_billDate.substring(0, 4));

		if (year != currentYear)
			continue;

		c_billDate = c_billDate.substring(5, 7);

		//out.print("susu " + c_billDate);
		int month = Integer.parseInt(c_billDate);
		int margin = Integer.parseInt(c_margin);
		int unpaid = Integer.parseInt(c_unpaid);

		price[month - 1] += margin;
		priceUn[month - 1] += unpaid;

		if (month == currentMonth) {
			if (c_plan.equalsIgnoreCase("basic"))
				count[0]++;
			else if (c_plan.equalsIgnoreCase("standard"))
				count[1]++;
			else if (c_plan.equalsIgnoreCase("profession"))
				count[2]++;
			else if (c_plan.equalsIgnoreCase("custom"))
				count[3]++;
		}

	}
%>
<script language="JavaScript">
	$(document)
			.ready(

					function() {

						var chart = {
							type : 'column'
						};
						var title = {
							text :
<%=sCY%>
	+ '년 월별 판매량'
						};
						var subtitle = {
						//text: 'Source: w3big.com'  
						};
						var xAxis = {
							categories : [ 'Jan', 'Feb', 'Mar', 'Apr', 'May',
									'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov',
									'Dec' ],
							crosshair : true
						};
						var yAxis = {
							min : 0,
							title : {
								text : '(단위) 원'
							}
						};
						var tooltip = {
							headerFormat : '<span style="font-size:10px">{point.key}</span><table>',
							pointFormat : '<tr><td style="color:{series.color};padding:0">{series.name}: </td>'
									+ '<td style="padding:0"><b>{point.y:1f} 원</b></td></tr>',
							footerFormat : '</table>',
							shared : true,
							useHTML : true
						};
						var plotOptions = {
							column : {
								pointPadding : 0,
								borderWidth : 0
							}
						};
						var credits = {
							enabled : false
						};

						var series = [ {
							// basic standard professional custom 
							name : 'price',

							data : [
<%=price[0]%>
	,
<%=price[1]%>
	,
<%=price[2]%>
	,
<%=price[3]%>
	,
<%=price[4]%>
	,
<%=price[5]%>
	,
<%=price[6]%>
	,
<%=price[7]%>
	,
<%=price[8]%>
	,
<%=price[9]%>
	,
<%=price[10]%>
	,
<%=price[11]%>
	]
						}
						/*, 
																													        {
																													            name: 'standard',
																													            data: [83.6, 78.8, 98.5, 93.4, 106.0, 84.5, 105.0, 104.3, 91.2, 83.5, 106.6, 92.3]
																													        },
																													        {
																													            name: 'professional',
																													            data: [48.9, 38.8, 39.3, 41.4, 47.0, 48.3, 59.0, 59.6, 52.4, 65.2, 59.3, 51.2]
																													        }, 
																													        {
																													            name: 'custom',
																													            data: [42.4, 33.2, 34.5, 39.7, 52.6, 75.5, 57.4, 60.4, 47.6, 39.1, 46.8, 51.1]
																													   }*/
						];

						var json = {};
						json.chart = chart;
						json.title = title;
						json.subtitle = subtitle;
						json.tooltip = tooltip;
						json.xAxis = xAxis;
						json.yAxis = yAxis;
						json.series = series;
						json.plotOptions = plotOptions;
						json.credits = credits;
						$('#divGraph').highcharts(json);

					});// end ready
</script>




<!--  지환 자바스크립트 -->
<script type="text/javascript">
	// nbsp를 반복해서 사용하기 위한 함수
	function spacing(num) {
		for (i = 0; i < num; i++) {
			document.write("&nbsp");
		}
	}
</script>


<script
	src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/835808530/?random=1531139707988&amp;cv=9&amp;fst=1531139707988&amp;num=1&amp;label=Cloudike%20KR%20Remarketing&amp;guid=ON&amp;resp=GooglemKTybQhCsO&amp;u_h=864&amp;u_w=1536&amp;u_ah=824&amp;u_aw=1536&amp;u_cd=24&amp;u_his=2&amp;u_tz=540&amp;u_java=false&amp;u_nplug=3&amp;u_nmime=4&amp;gtm=G6c&amp;sendb=1&amp;frm=0&amp;url=https%3A%2F%2Fasd.cloudike.kr%2Foauth%3Fuse_ajax%3D1&amp;async=1&amp;rfmt=3&amp;fmt=4"></script>

<style type="text/css">
#PRM_table {
	text-align: center;
	font-size: 12px;
}

textarea {
	resize: none;
}
</style>

</head>

<body
	class="full-height body-gray body-without-fucking-bottom-padding toaster-position-top">

	<div class="ng-file-over-container">
		<div class="ng-file-over-wrapper">
			<div></div>
			<i class="icon icon-upload text-muted"></i>
			<div class="ng-file-over-screen"></div>
		</div>
	</div>

	<!-- uiView: navbar -->
	<div class="ng-scope">
		<div class="header b-nav ng-scope">
			<div class="navbar navbar-static-top b-nav__navbar">
				<div class="navbar-header">
					<img id="homeLogo" alt="Cloudike" src="./assets/Coludike_logo.png">
					Cloudike Partners Support System
				</div>
				<%
					//| userCode | userCompany | userName | userTel| userEmail|
					//business | account | contDate | calcul | billDate | depositDate | note
					while (rs.next()) {
						String code = rs.getString("userCode");
						String company = rs.getString("userCompany");
						String name = rs.getString("userName");
						String tel = rs.getString("userTel");
						String email = rs.getString("userEmail");
						String business = rs.getString("business");
						String account = rs.getString("account");
						String contDate = rs.getString("contDate");
						String calcul = rs.getString("calcul");
						String billDate = rs.getString("billDate");
						String depositDate = rs.getString("depositDate");
						String note = rs.getString("note");
						String type = rs.getString("userType");
						String p_margin = rs.getString("margin");
				%>
				<div class="collapse navbar-collapse b-nav__menubar">
					<!--div ui-view="navbar-menu"></div-->
					<!-- ngIf: $root.screenSize.xs -->
					<div class="ng-scope"></div>
					<!--오른쪽에 이름-->
					<ul class="nav navbar-nav navbar-right cuser-menu-wrap">
						<!-- ngIf: CurrentUser.userid -->
						<li class="ng-scope">
							<ul class="cuser-menu cuser-active-menu">
								<li>

									<div id="profile_menu" class="dropdown" style="float: right;">
										<%
										//묘묘
											if (type.equals("cor")) {
										%>
										<span class="cuser-name ng-binding"> <%=company%></span>
										<%
											} else {
										%>

										<span class="cuser-name ng-binding"> <%=name%></span>
										<%
											}
										%>
										<span class="caret"></span>
										<div class="dropdown-content" style="right: 0;">
											<a ui-sref="profile"
												href="http://localhost:8080/CloudikePartner/profileAccount.jsp">프로필
												/ 설정</a> <a ui-sref="profile"
												href="http://localhost:8080/CloudikePartner/userLogout.jsp">로그아웃</a>
										</div>
									</div> <!--  원래코드
                           <div id="profile_menu" class="btn-group b-group-usermenu"
                              dropdown="">
                              <a href="" dropdown-toggle="" aria-haspopup="" aria-expanded="true"> 
                              <span
                                 class="cuser-name ng-binding">유수화</span> <span class="caret"></span>
                              </a>
                              <ul class="dropdown-menu">
                                 <li><a ui-sref="profile" href="/profile"><span
                                       translate="" class="ng-scope">프로필 / 설정</span></a></li>
                                 <li><a ui-sref="signout" href="/signout"><span
                                       translate="" class="ng-scope">로그아웃</span></a></li>
                              </ul>
                           </div>
                           -->
								</li>


								<li>
									<div id="notice_menu" class="dropdown"
										style="margin-top: 10px;">

										<span class="cuser-name ng-binding"> 알림 센터</span> <span
											class="caret"></span>
										<div class="container-fluid">
											<div class="col-md-12">
												<div id="eventFrame" class="dropdown-event-content"
													style="right: 0; text-align: left">
													<a id="defaultA" class="hidden-xs" href="#"
														dropdown-toggle="" disabled="disabled"
														aria-expanded="true"> 알림이 없습니다. </a>
													<%
														conn = DatabaseUtil.getConnection();
															String userCode = (String) session.getAttribute("userCodeDB");
															String sqlNT = "select * from partner_notification where partnerCode=?";
															PreparedStatement pstmtNT = conn.prepareStatement(sqlNT);

															pstmtNT.setString(1, userCode);
															ResultSet rsNT = null;
															rsNT = pstmtNT.executeQuery();

															int n;

															if (rsNT.next()) {
																n = 0;
															} else {
																n = -1;
															}
													%>
													<script>
														if (
													<%=n%>
														== -1) {
															$('#defaultA').css(
																	"display",
																	"display");
															$('#eventFrame')
																	.css(
																			"min-width",
																			"160px");
														} else {
															$('#defaultA').css(
																	"display",
																	"none");
															$('#eventFrame')
																	.css(
																			"min-width",
																			"700px");
														}
													</script>
													<%
														rsNT = pstmtNT.executeQuery();

															while (rsNT.next()) {
																String partnerCode = rsNT.getString("partnerCode").toString();
																String date = rsNT.getString("date").toString();
																String message = rsNT.getString("message").toString();
																String noti = rsNT.getString("notiResponse").toString();
																int notiResponse = Integer.parseInt(noti);
																if (notiResponse != 0) {
																	out.print(
																			"<a disabled='disabled'>" + message + "<br>" + "<small>" + date + "</small>" + "</a>");
																}
															}
													%>
												</div>
											</div>
										</div>
									</div>
								</li>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="container-fluid g-layout g-layout__toolbar">
		<div class="position-relative">
			<!-- uiView: toolbar -->
			<div class="ng-scope">
				<div class="row ng-scope">
					<!-- ngIf: opts.oneColumn !== true -->
					<div class="g-sidebarview ng-scope"></div>
					<!-- end ngIf: opts.oneColumn !== true -->
					<div class="g-toolbar g-mainview"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- uiView: preview -->
	<div class="ng-scope"></div>

	<!-- uiView: layout -->
	<div
		class="container-fluid g-layout g-layout__layout full-height ng-scope">
		<div class="row full-height ng-scope">
			<!-- uiView: sidebar -->
			<div class="g-sidebarview full-height ng-scope">
				<!-- uiView: sidebar-top -->
				<!--  여기고침 -->
				<div class="g-sidebar-info-container full-height ng-scope">
					<div class="metadata-tree b-menu ng-scope ng-isolate-scope">
						<!-- ngIf: folder.folder -->
						<ul class="nav nav-pills nav-stacked ng-scope">
							<!-- susu 여기고침 -->
							<li class="active collapse-in"><a class="b-menu__item-link">
									<span ng-click="clickItemMenu($event, folder)"> <span
										class="b-menu__item-link-toolbar"> <span
											class="b-menu__item-icon b-menu__item-icon-chevron-right"><i
												class="fa fa-caret-right"></i></span> <span
											class="b-menu__item-icon b-menu__item-icon-chevron-down"><i
												class="fa fa-caret-down"></i></span>
									</span> <span class="slide-item ng-binding">myPage 관리</span>
								</span>
							</a> <!-- ngIf: folder.content.length -->
								<div class="collapse ng-scope">
									<!-- ngRepeat: folder in folder.content | naturalOrderBy:'path' -->
									<!-- ngInclude: 'clFolderAsTree/clFolderAsTree.tpl.html' -->
									<div class="ng-scope">
										<!-- ngIf: folder.folder -->
									</div>
									<!-- end ngRepeat: folder in folder.content | naturalOrderBy:'path' -->
								</div> <!-- end ngIf: folder.content.length --></li>
							<!-- 여기까지 -->

							<li class="single-item ng-scope"><a
								class="b-menu__item-link" onclick="graphFunction();"><span><span
										translate="" class="ng-scope" id="side_item3"
										style="font-weight: bold">월별 실적 보기</span></span></a></li>
							<li class="single-item ng-scope"><a
								class="b-menu__item-link" onclick="profileFunction();"><span><span
										translate="" class="ng-scope" id="side_item1"
										style="font-weight: normal"> 내 정보 관리</span></span></a></li>
							<li class="single-item ng-scope"><a
								class="b-menu__item-link" onclick="RMfunction();"><span><span
										translate="" class="ng-scope" id="side_item2"
										style="font-weight: normal">실적 관리</span></span></a></li>

							<!-- end ngIf: folder.isRoot -->
						</ul>
						<!-- end ngIf: folder.folder -->
					</div>
					<!-- 사이드바 2: 통합게시판 -->
					<!-- 묘묘 여기고침 -->
					<div style="margin: 20px"></div>
					<div class="metadata-tree b-menu ng-scope ng-isolate-scope">
						<!-- ngIf: folder.folder -->
						<ul class="nav nav-pills nav-stacked ng-scope">
							<li class="active collapse-in"><a class="b-menu__item-link">
									<span ng-click="clickItemMenu($event, folder)"> <span
										class="b-menu__item-link-toolbar"> <span
											class="b-menu__item-icon b-menu__item-icon-chevron-right">
												<i class="fa fa-caret-right"></i>
										</span> <span
											class="b-menu__item-icon b-menu__item-icon-chevron-down">
												<i class="fa fa-caret-down"></i>
										</span>
									</span> <span class="slide-item ng-binding">Cloudike</span>
								</span>
							</a> <!-- ngIf: folder.content.length -->
								<div class="collapse ng-scope">
									<!-- ngRepeat: folder in folder.content | naturalOrderBy:'path' -->
									<!-- ngInclude: 'clFolderAsTree/clFolderAsTree.tpl.html' -->
									<div class="ng-scope">
										<!-- ngIf: folder.folder -->
									</div>
									<!-- end ngRepeat: folder in folder.content | naturalOrderBy:'path' -->
								</div> <!-- end ngIf: folder.content.length --></li>
							<!-- 여기까지 -->

							<li class="single-item ng-scope"><a
								class="b-menu__item-link" href="./board/boardList.jsp"><span><span
										translate="" class="ng-scope" id="side2_item1"
										style="font-weight: normal">통합 게시판</span></span></a></li>
						</ul>
						<!-- end ngIf: folder.folder -->
					</div>
					<!-- 사이드바2 끝 -->
				</div>
			</div>
			<!-- uiView: main -->
			<div class="g-mainview layout-col-pad full-height ng-scope">
				<div class="row full-height ng-scope">
					<div class="col-md-12 b-content-wrap full-height">
						<div class="full-height ng-isolate-scope" style="display: none;">
							<div class="b-content b-content-empty">
								<span></span>
								<div class="empty-wrap">
									<i class="empty-icon"></i>
									<div class="empty-drop">
										<span></span>
									</div>
								</div>
							</div>
						</div>


						<div class="b-fullheight ng-isolate-scope b-content">
							<!-- ngIf: viewType == 'list' -->
							<div class="ng-scope">
								<!-- ngInclude: 'clFolderContents/folderContentsAsList.tpl.html' -->

								<!-- susu ! 테이블 자리!!!!!! 여기 잘림 !!!!!!! -->

								<div class="ng-scope" id="divProfile" style="display: none">
									<table class="type04" id="myPageTable1">
										<tr>
											<!-- susu for margin -->
											<td style="display: none"><input id="p_margin"
												name="p_margin" value="<%=p_margin%>"></td>


											<th scope="row">파트너 코드</th>
											<td colspan="2"><input id="userCode" name="userCode"
												value="<%=code%>" disabled></td>
										</tr>
										<tr>
											<th scope="row">회사명</th>
											<td colspan="2"><%=company%></td>
										</tr>

										<tr>
											<th scope="row">이름</th>
											<td><input id="userName" name="userName"
												style="border: 0" value="<%=name%>" readonly></td>
											<td><button class="btn btn-default"
													onclick="name_edit_click();">수정</button> <input
												type="button" class="btn btn-default" id="btn_name_ok"
												value="확인"></td>
										</tr>

										<tr>
											<th scope="row">전화번호</th>
											<td><input id="userTel" name="userTel" value="<%=tel%>"
												style="border: 0" readonly></td>
											<td><button class="btn btn-default"
													onclick="tel_edit_click();">수정</button>
												<button class="btn btn-default" id="btn_tel_ok">확인</button></td>
										</tr>
										<tr>
											<th scope="row">이메일</th>
											<td colspan="2"><%=email%></td>
										</tr>
									</table>
									<form action="profileImgSet.jsp" method="post"
										enctype="multipart/form-data">
										<table class="type04" id="myPageTable2">
											<%
												if (!type.equals("개인")) {
											%>

											<tr>
												<th scope="row">사업자 등록증</th>
												<!-- 	<td><p id="business"><%=business%></p> <input type=file
													name="businessImg"></td> -->
												<th>
													<%
														if (business.equals("미등록")) {
													%>
													<p id="business"><%=business%></p> <%
 	} else {
 %> <a id="business" class="link" href="profileImgDown.jsp?file_name=<%=business%>"><%=business%></a>
													<%
														}
													%> <input type=file id="businessImg" name="businessImg">
												</th>
												<td><input class="btn btn-default" style=""
													onclick="businessOk(this.form.businessImg)" type="submit"
													value="등록">
													<p style="display: inline-block; color: gray">jpg, png,
														gif 파일 업로드 가능. 5MB이하</p></td>


											</tr>
											<%
												}
											%>
											<tr>
												<th scope="row">통장사본</th>
												<th>
													<%
														if (account.equals("미등록")) {
													%>
													<p id="account"><%=account%></p> <%
 	} else {
 %> <a id="account" class="link" href="profileImgDown.jsp?file_name=<%=account%>"><%=account%></a>
													<%
														}
													%> <input type=file id="accountImg" name="accountImg">
												</th>
												<td><input class="btn btn-default" style=""
													onclick="accountOk(this.form.accountImg)" type="submit"
													value="등록">
													<p style="display: inline-block; color: gray">jpg, png,
														gif 파일 업로드 가능. 5MB이하</p></td>
											</tr>


											<tr>
												<th scope="row">ASD계약일</th>
												<td style="color: gray"><%=contDate%></td>
												<td>
													<p style="display: inline-block; color: gray">첫 계산서 발행일
													</p>
												</td>
											</tr>
											<tr>
												<th scope="row">정산주기</th>
												<td colspan="2" style="color: gray"><%=calcul%></td>
											</tr>
											<tr>
												<th scope="row">계산서 발행일</th>
												<td><input style="text-align: center; width: 25px;"
													id="billDate" type="text" value="<%=billDate%>">일/3개월</td>
												<td><input type="button" class="btn btn-default"
													id="btn_bill_ok" value="등록"></td>
											</tr>
											<tr>
												<th scope="row">입금일</th>
												<td colspan="2" style="color: gray"><%=depositDate%></td>
											</tr>
											<tr>
												<th scope="row">비고</th>
												<td colspan="2" style="color: gray"><%=note%>
											</tr>
											<%
												}
											%>
										</table>
									</form>

								</div>

								<!-- susu! 여기여기!!!!!!!! -->

								<div id="divRM" class="ng-scope"
									style="display: none; margin-left: 20px; margin-top: 20px;">


									<div id="flip">
										<h3 style="color: #428BCA; display: inline">상세검색▼</h3>
									</div>
									<div id="flipContent" style="display: none;">

										<br>
										<!--  TABLE 상단 : 검색 AREA  -->
										<!--  ush div animation  -->
										<div>
											<SCRIPT type="text/javascript">
												spacing(5);
											</SCRIPT>

											<LABEL>기간 </LABEL>
											<SCRIPT type="text/javascript">
												spacing(4);
											</SCRIPT>
											<INPUT type="text" name="start_year" id="start_year" size="2"
												style="border: 2px solid #737373;">년&nbsp;&nbsp; <INPUT
												type="text" name="start_month" id="start_month" size="1"
												style="border: 2px solid #737373;">월 ~ <INPUT
												type="text" name="end_year" id="end_year" size="2"
												style="border: 2px solid #737373;">년&nbsp;&nbsp; <INPUT
												type="text" name="end_month" id="end_month" size="1"
												style="border: 2px solid #737373;">월


											<SCRIPT type="text/javascript">
												spacing(4);
											</SCRIPT>
											<LABEL>고객코드</LABEL> <INPUT type="text" name="customer_code"
												id="customer_code" size="12"
												style="border: 2px solid #737373;">&nbsp;&nbsp; <LABEL>고객사명</LABEL>
											<INPUT type="text" name="customer_name" id="customer_name"
												size="12" style="border: 2px solid #737373;">&nbsp;&nbsp;

											<BUTTON type="button" class="btn" id="ARM_search_btn"
												onclick="searchBtn();" name="ARM_search_btn"
												style="border: 2px solid #737373;">검색</button>


											<!-- 
											<textarea name=content cols="15" rows="1" id="page_info"
												style="background-color: transparent; border: 0 solid black; font-size: 9pt; color: #737373; overflow: hidden;">1page 1/1</textarea>
										
											 -->
										</div>
									</div>

									<!--  CUSTOMER INFORMATION TABLE -->

									<div>
										<div style="margin: 5px">
											<h3 style="display: inline-block; margin-right: 10px;">내역</h3>
											<button
												style="display: inline-block; vertical-align: baseline;"
												class="btn" onclick="totalTable();">전체</button>
											<button
												style="vertical-align: baseline; display: inline-block;"
												id="currentMonth" class="btn" name="currentMonth"
												onclick="currentMonthFunction();">이번달</button>
											<button
												style="vertical-align: baseline; display: inline-block;"
												id="preMonth" name="preMonth" class="btn"
												onclick="preMonthFunction();">지난달</button>

										</div>
										<div id="divTable">
											<table class="table" id="PRM_table" style="width: 1000px">
												<thead class="thead-light">
													<tr>
														<th scope="col" width="10px" nowrap
															style="text-align: center;">계산서발행일</th>
														<th scope="col" width="15px" nowrap
															style="text-align: center;">고객코드</th>
														<th scope="col" width="15px" nowrap
															style="text-align: center;">고객사명</th>
														<th scope="col" width="15px" style="text-align: center;">요금제</th>
														<th scope="col" width="10px" style="text-align: center;">정산주기</th>
														<th scope="col" width="10px" style="text-align: center;">요금</th>
														<th scope="col" width="10px" style="text-align: center;">마진</th>
														<th scope="col" width="10px" style="text-align: center;">미수금</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<%
															String userCodeInitRM = (String) session.getAttribute("userCodeDB");
															String sqlRM = "select * from CUSTOMER where userCode=? order by c_billDate";

															PreparedStatement pstmtRM = conn.prepareStatement(sqlRM);
															pstmtRM.setString(1, userCodeInitRM);
															ResultSet rsRM = null;
															rsRM = pstmtRM.executeQuery();
														%>
														<%
															while (rsRM.next()) {

																String PRM_id = rsRM.getString("id");
																String billDate = rsRM.getString("c_billDate");
																String companyCode = rsRM.getString("c_code");
																String companyName = rsRM.getString("c_name");
																String plan = rsRM.getString("c_plan");
																String contract = rsRM.getString("c_calcul");
																String fee = rsRM.getString("c_fee");
																String margin = rsRM.getString("c_margin");
																String unpaid = rsRM.getString("c_unpaid");

																long c_fee_long = Long.parseLong(fee);
																long c_margin_long = Long.parseLong(margin);
																long c_unpaid_long = Long.parseLong(unpaid);

																fee = format.format(c_fee_long);
																margin = format.format(c_margin_long);
																unpaid = format.format(c_unpaid_long);

																PRM_id = "PRM" + PRM_id + "_";
														%>
														<td width="5%"><%=billDate%></td>
														<td width="15%"><INPUT type="text"
															name="<%=PRM_id%>0" id="<%=PRM_id%>0" size="25"
															value=<%=companyCode%> readonly="readonly"
															style="border: 0 solid black; text-align: center;"></td>
														<td width="15%"><%=companyName%></td>
														<td width="15%"><%=plan%></td>
														<td width="15%"><%=contract%></td>
														<td width="15%"><INPUT type="text"
															name="<%=PRM_id%>1" id="<%=PRM_id%>1" size="7"
															value=<%=fee%> readonly="readonly"
															style="border: 0 solid black; text-align: center;"></td>

														<td width="15%"><INPUT type="text"
															name="<%=PRM_id%>2" id="<%=PRM_id%>2" size="7"
															value=<%=margin%> readonly="readonly"
															style="border: 0 solid black; text-align: center;"></td>
														<td width="15%"><INPUT type="text"
															name="<%=PRM_id%>3" id="<%=PRM_id%>3" size="7"
															value=<%=unpaid%> readonly="readonly"
															style="border: 0 solid black; text-align: center;"></td>

													</tr>
													<%
														}
													%>

												</tbody>
												<tfoot>
													<%
														//실적관리 !!!!!!  

														//out.print("db 연결 정보 " + conn);

														String userCodeInitRM2 = (String) session.getAttribute("userCodeDB");

														String sqlRM2 = "select IFNULL(sum(c_fee),0), IFNULL(sum(c_margin),0), IFNULL(sum(c_unpaid),0) from CUSTOMER where userCode=?";

														//stmt.executeQuery(sql);

														PreparedStatement pstmtRM2 = conn.prepareStatement(sqlRM2);

														pstmtRM2.setString(1, userCodeInitRM2);
														// pstmt.executeUpdate();
														ResultSet rsRM2 = null;
														rsRM2 = pstmtRM2.executeQuery();
													%>
													<%
														while (rsRM2.next()) {
															//String str = String.format("%,d", i); //%,d",
															String fee = rsRM2.getString("IFNULL(sum(c_fee),0)");
															String margin = rsRM2.getString("IFNULL(sum(c_margin),0)");
															String unpaid = rsRM2.getString("IFNULL(sum(c_unpaid),0)");

															long value = Long.parseLong(fee);
															fee = format.format(value);
															value = Long.parseLong(margin);
															margin = format.format(value);
															value = Long.parseLong(unpaid);
															unpaid = format.format(value);
													%>
													<tr>
														<td colspan="1" style="font-weight: bold;">합계</td>
														<td colspan="4"></td>
														<td><%=fee%></td>
														<td><%=margin%></td>
														<td><%=unpaid%></td>
														<%
															}
														%>
													
												</tfoot>
											</table>
										</div>


									</div>
								</div>

								<table id="tableGraph" style="display: block; margin: auto">
									<tr>
										<td rowspan="2" style="width: 70%; margin: auto">
											<table>
												<tr>
													<td>
														<div id="divGraph"
															style="width: 100%; height: 400px; margin: 15px auto;"></div>
													</td>
												</tr>

											</table>
										<td style="margin: auto; width: 100%">
											<div
												style="border: 1px solid #ccc; height: 130px; box-shadow: 3px 3px 2px #666; padding: 15px; margin-bottom: 15px; margin-left: 10px">
												<h4 style="font-weight: bold">이번달 총 수익금</h4>
												<h2 style="text-align: right; color: red; margin-top: 15px">
													<%=format.format(price[currentMonth - 1])%>원
												</h2>

											</div>
											<div id="flip3"
												style="border: 1px solid #ccc; box-shadow: 3px 3px 2px #666; padding: 15px;  margin-bottom: 15px;  margin-left: 10px">
												<h4 style="font-weight: bold">이번달 총 미수금</h4>
												<div id="unpaidText" style="display: none;">
												<h2 style="text-align: right; color: red; margin-top: 15px">
													<%=format.format(priceUn[currentMonth - 1])%>원
													</h2></div> </div>
													
											<div id="flip2"
												style="border: 1px solid #ccc; box-shadow: 3px 3px 2px #666; padding: 15px; margin-left: 10px">
												<h4 style="font-weight: bold">요금제별 건수 보기</h4>
												<div id="graphText" style="display: none;">

													<table class="type05">

														<tr>
															<th>Basic</th>
															<td><%=count[0]%>건</td>
														</tr>
														<tr>
															<th>Standard</th>
															<td><%=count[1]%>건</td>
														</tr>
														<tr>
															<th>Professional</th>
															<td><%=count[2]%>건</td>
														</tr>
														<tr>
															<th>Custom</th>
															<td><%=count[3]%>건</td>
														</tr>
													</table>


												</div>

											</div>

										</td>

									</tr>


								</table>
							</div>
							<!-- divRM end -->
							<!-- end ngIf: viewType == 'list' -->
							<!-- ngIf: viewType == 'grid' -->
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- compiled JavaScript -->
	</div>
	<!-- compiled JavaScript -->
	<script type="text/javascript"
		src="/assets/app-config.js?1530520134094"></script>
	<script type="text/javascript"
		src="/assets/ng-cloudike-2.3.1-1.js?1530520134094"></script>
</body>

<%
	conn.close();
%>
</html>
