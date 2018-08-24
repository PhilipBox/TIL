<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="util.DatabaseUtil"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@page import="java.util.Enumeration"%>
<%@ page import="java.text.*"%>
<%
	DecimalFormat format = new DecimalFormat("###,###");
%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	System.out.print("reply: idx  " + idx);
	String title = "";
	String memo = "";
	String hyphen = "\n------------------------------------------------------------\n\n\n\n\n "; //30개
	try {

		Connection conn = DatabaseUtil.getConnection();
		Statement stmt = conn.createStatement();

		String sql = "SELECT title,memo FROM board WHERE NUM=" + idx;
		ResultSet rs = stmt.executeQuery(sql);

		if (rs.next()) {
			title = rs.getString(1);
			memo = rs.getString(2);
			title = "[ " + title + " ] " + "답글이 등록되었습니다. ";
			memo = "> " + memo + hyphen;
		}

		rs.close();
		stmt.close();
		conn.close();

	} catch (SQLException e) {

	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="../nse_files/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<style>
.nse_content {
	width: 970px;
	height: 300px
}
</style>
<meta charset="utf-8">
<title>Coludike-게시판</title>
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

table.type01 {
	table-layout: fixed;
	word-wrap: break-word;
	border: 1px solid #000000;
	border-collapse: collapse;
}

table.type01 td {
	color: #A6A6A6;
	font-size: 14px;
	border: 1px solid #000000;
	padding: 10px 10px 10px 10px;
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

.dropdown:hover .dropbtn {
	background-color: #3e8e41;
}

input:-ms-input-placeholder {
	color: #A6A6A6;
}

input:-webkit-input-placeholder {
	color: #A6A6A6;
}

.searchDiv {
	height: 25px;
	width: 203px;
	border: 1px solid #A6A6A6;
	background: #ffffff;
	text-align: right;
	float: right;
}

.searchText {
	font-size: 10px;
	width: 120px;
	padding: 5px 5px 0 15px;
	border: 0px;
	outline: none;
	text-align: left;
	font-weight: bold;
	float: left;
}

.searchBtn {
	width: 40px;
	height: 100%;
	border: 0px;
	background: #F2F2F2;
	float: right;
	color: #000000;
}

.viewBtn {
	width: 40px;
	height: 25px;
	border: 0px;
	background: #F2F2F2;
	float: right;
	margin-right: 10px;
	color: #000000;
}

.fa-search {
	color: #A6A6A6;
}

.fa-list {
	color: #A6A6A6;
}
</style>
<!-- Font Awesome library -->
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">

<!-- compiled CSS -->
<link rel="stylesheet" type="text/css"
	href="../assets/ng-cloudike-2.3.1-1.css">

<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="http://code.highcharts.com/highcharts.js"></script>
<script>
	// 자바 스크립트 시작

	function locateBack() {
		location.replace('boardList.jsp');
	}

	function replyCheck(id) {
		//alert( "replyCheck" );
		var title = $("#title").val();
		var memo = $("#memo").val();

		if (!title) {
			alert("제목을 적어주세요.");
			$("#title").focus();
			return;
		}
		if (!memo) {
			alert("내용을 적어주세요.");
			$("#memo").focus();
			return;
		}

		replyOk(id);

	}


	function replyOk(id) {
		//alert("reply"+id);
		$.ajax({
			type : "post",
			url : "./boardReplyOk.jsp",
			data : {
				idx : id,
				title : $("#title").val(),
				memo : $("#memo").val(),
			},
			success : moveSuccess,
			error : moveError
		});
	}
	function searchBoard() {
		$.ajax({
			type : "post",
			url : "./boardSearch.jsp",
			data : {
				text : $('#search').val()
			},
			success : moveSuccess,
			error : moveError
		});
	}
	function moveSuccess(resdata) {
		$("#divList").html(resdata);
		console.log(resdata);
		//alert("moveSuccess");
	}
	function moveError() {
		alert("moveError");
	}
</script>
</head>
<body>
	<div id="divList">
		<div class="b-fullheight ng-isolate-scope b-content">
			<!-- ngIf: viewType == 'list' -->
			<div class="ng-scope" id="listDiv" style="display: block;">

				<!-- 검색창 / 전체보기 버튼-->
				<table style="width: 100%">
					<tr align="right">
						<td style="padding: 10px;">

							<div class="searchDiv">
								<input class="searchText" type="text" id="search" name="search" 
									style="font-size: 12px; width: 130px" placeholder="검색어를 입력하세요">

								<button class="searchBtn" onclick="searchBoard();">
									<i class="fa fa-search"></i>
								</button>
							</div>
							<button class="viewBtn" onclick="window.location='boardList.jsp'">
								<i class="fa fa-list"></i>
							</button>
						</td>
					</tr>
				</table>
				<table class="type01" width="1200px">

					<colgroup>
						<col class="col-md-2">
						<col class="col-md-10">
					</colgroup>

					<tr>
						<td style="text-align: center;">제목</td>
						<td><input id="title" size="140" maxlength="100" value="<%=title%>"
							style="font-size: 13; outline: none; padding: 10px; border: 0;"></td>
					</tr>

					<tr>
						<td style="text-align: center; padding: 150px 60px 150px 60px;">내용</td>
						<td><textarea name="memo" id="memo" class="nse_content"><%=memo%></textarea>
							<script type="text/javascript">
								var oEditors = [];
								nhn.husky.EZCreator
										.createInIFrame({
											oAppRef : oEditors,
											elPlaceHolder : "memo",
											sSkinURI : "../nse_files/SmartEditor2Skin.html",
											fCreator : "createSEditor2"
										});
								function submitContents(elClickedObj) {

									oEditors.getById["memo"].exec(
											"UPDATE_CONTENTS_FIELD", []);
									//document.getElementById("ir1").value

									//   alert("writeCheck");
									replyCheck(<%=idx%>);
								}
							</script></td>
					</tr>
				</table>

				<table style="width: 100%">
					<tr height="10px">
						<td></td>
					</tr>
					<tr>
						<td>
							<button class="btn btn-primary" style="float: left;"
								onclick="locateBack();">목록보기</button>
							<button class="btn btn-primary" style="float: right;"
								onclick="submitContents();">작성완료</button>

						</td>
					</tr>
				</table>

			</div>
		</div>
	</div>
</body>
</html>
