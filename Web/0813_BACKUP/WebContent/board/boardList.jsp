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
	//TODO : userCode session으로 뽑기

	//String boardCode="PKC222";
	String boardCode = (String) session.getAttribute("userCodeDB");

	Connection conn = DatabaseUtil.getConnection();
	out.print("db 연결 정보 " + conn);
%>
<!DOCTYPE html>
<html>

<head>
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

table.type06 {
	border-collapse: separate;
	border-spacing: 0;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #FED558;
	margin: 10px 10px;
}

table .type06 th {
	width: 50px;
	padding: 5px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #FED558;
}

<!--
table.type06 td {
	width: 1100px;
	padding: 5px;
	text-align: center;
	vertical-align: top;
	border-bottom: 1px solid #FED558;
}

-->
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
</style>

<!-- compiled CSS -->
<link rel="stylesheet" type="text/css"
	href="../assets/ng-cloudike-2.3.1-1.css">
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
<script
	src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/835808530/?random=1531139707988&amp;cv=9&amp;fst=1531139707988&amp;num=1&amp;label=Cloudike%20KR%20Remarketing&amp;guid=ON&amp;resp=GooglemKTybQhCsO&amp;u_h=864&amp;u_w=1536&amp;u_ah=824&amp;u_aw=1536&amp;u_cd=24&amp;u_his=2&amp;u_tz=540&amp;u_java=false&amp;u_nplug=3&amp;u_nmime=4&amp;gtm=G6c&amp;sendb=1&amp;frm=0&amp;url=https%3A%2F%2Fasd.cloudike.kr%2Foauth%3Fuse_ajax%3D1&amp;async=1&amp;rfmt=3&amp;fmt=4"></script>

<!-- 함수 -->
<script>
	function writeBoard() {
		$("#contentDiv").css("display", "display");
		$("#listDiv").css("display", "none");
	}
</script>

<!-- susu location -->
<script>
	function locationView(idx) {
		alert(idx);
		$.ajax({
			type : "post",
			url : "./boardView.jsp",
			data : {
				idx : idx
			},
			success : moveSuccess,
			error : moveError
		});
	}
	function locationWrite() {
		$.ajax({
			type : "post",
			url : "./boardWrite.jsp",
			data : {},
			success : moveSuccess,
			error : moveError
		});
	}
	function locationWriteAdmin() {
		$.ajax({
			type : "post",
			url : "./boardWriteAdmin.jsp",
			data : {},
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
					<img id="homeLogo" alt="Cloudike" src="../assets/Coludike_logo.png">
					Cloudike Partners Support System
				</div>

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
									<%
										String sqlPartner = "select * FROM partner WHERE userCode=?";
										PreparedStatement pstmtP = conn.prepareStatement(sqlPartner);
										pstmtP.setString(1, boardCode);

										ResultSet rsP = null;
										rsP = pstmtP.executeQuery();

										String type = "", company = "", name = "";

										while (rsP.next()) {

											company = rsP.getString("userCompany");
											name = rsP.getString("userName");
											type = rsP.getString("userType");

											session.setAttribute("userNameDB", name);

										}
									%>

									<div id="profile_menu" class="dropdown" style="float: right;">
										<%
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
									</div>
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
												</div>
											</div>
										</div>
									</div>
								</li>
							</ul>
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
					<!-- 사이드바 2: 통합게시판 -->
					<!-- 묘묘 여기고침 -->
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
								class="b-menu__item-link" href="javascript:location.reload()"><span><span
										translate="" class="ng-scope" id="side2_item1"
										style="font-weight: bold">통합 게시판</span></span></a></li>

							<li class="single-item ng-scope"><a
								class="b-menu__item-link" href="javascript:history.go(-1)"><span><span
										translate="" class="ng-scope" id="side2_item2"
										style="font-weight: normal">myPage 관리</span></span></a></li>
						</ul>
						<!-- end ngIf: folder.folder -->
					</div>
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
						<!-- 리스트 main -->
						<div id="divList">
							<div class="b-fullheight ng-isolate-scope b-content">
								<!-- ngIf: viewType == 'list' -->
								<div class="ng-scope" id="listDiv" style="display: block;">
									<!-- ngInclude: 'clFolderContents/folderContentsAsList.tpl.html' -->

									<%
										int total = 0;

										String sqlBor;
										PreparedStatement pstmtBor = null;
										String sqlList;
										PreparedStatement pstmtBor2 = null;

										String sqlNotice = "SELECT * from board where notice=1 order by ref desc, step asc ";
										PreparedStatement pstmtNotice = conn.prepareStatement(sqlNotice);
										ResultSet rsNotice = null;
										rsNotice = pstmtNotice.executeQuery();

										if (boardCode.equalsIgnoreCase("admin")) {

											sqlBor = "select IFNULL(count(*),0) FROM board";
											pstmtBor = conn.prepareStatement(sqlBor);

											sqlList = "SELECT * from board order by ref desc, step asc ";
											pstmtBor2 = conn.prepareStatement(sqlList);

										} else {
											sqlBor = "select IFNULL(count(*),0) FROM board WHERE userCode=? or fromAdmin=?";
											pstmtBor = conn.prepareStatement(sqlBor);
											pstmtBor.setString(1, boardCode);
											pstmtBor.setString(2, boardCode);

											sqlList = "SELECT * from board where userCode=? or fromAdmin=? order by ref desc, step asc ";
											pstmtBor2 = conn.prepareStatement(sqlList);
											pstmtBor2.setString(1, boardCode);
											pstmtBor2.setString(2, boardCode);

										}
										ResultSet rsBor = null;
										rsBor = pstmtBor.executeQuery();

										if (rsBor.next()) {
											total = rsBor.getInt(1);
										}
										ResultSet rsBor2 = null;
										rsBor2 = pstmtBor2.executeQuery();
									%>
									<table width="100%" cellpadding="0" cellspacing="0" border="0">
										<tr height="5">
											<td width="5"></td>
										</tr>
										<tr
											style="background: url('../img/table_mid.gif') repeat-x; text-align: center; height: 30;">
											<td style="width: 5;"></td>
											<td style="width: 73;"><b>제목</b></td>
											<td style="width: 379;"><b>작성자</b></td>
											<td style="width: 73;"><b>작성일</b></td>
											<td style="width: 7;"></td>
										</tr>

										<%
											while (rsNotice.next()) {

												int idxN = rsNotice.getInt("num");
												String titleN = rsNotice.getString("title");
												String namePN = rsNotice.getString("userName");
												String timeN = rsNotice.getString("time");

												int indentN = rsNotice.getInt("indent");
										%>
										<tr height="25" align="center"
											style="background-color: #F8F8F9">
											<td>&nbsp;</td>
											<td align="left">
												<%
													for (int j = 0; j < indentN; j++) {
												%> &nbsp;&nbsp;&nbsp;<%
 	}
 		if (indentN != 0) {
 %> <img src='../img/reply_icon.png' /> <%
 	}
 %> <a style="color: red; font-weight: bold"
												href="javascript:locationView(<%=idxN%>);"><%=titleN%></a>
											</td>


											<td align="center" style="color: gray;"><%=namePN%></td>
											<td align="center" style="color: gray;"><%=timeN%></td>

											<td>&nbsp;</td>
										</tr>
										<tr height="1" bgcolor="#D2D2D2">
											<td colspan="6"></td>
										</tr>
										<%
											}
										%>

										<%
											if (total == 0) {
										%>
										<tr align="center" bgcolor="#FFFFFF" height="30">
											<td colspan="6">등록된 글이 없습니다.</td>
										</tr>
										<%
											} else {

												while (rsBor2.next()) {

													int idx = rsBor2.getInt("num");
													String title = rsBor2.getString("title");
													String nameP = rsBor2.getString("userName");
													String time = rsBor2.getString("time");

													int indent = rsBor2.getInt("indent");
										%>
										<tr height="25" align="center">
											<td>&nbsp;</td>
											<td align="left">
												<%
													for (int j = 0; j < indent; j++) {
												%> &nbsp;&nbsp;&nbsp;<%
 	}
 			if (indent != 0) {
 %> <img src='../img/reply_icon.png' /> <%
 	}
 %> <a href="javascript:locationView(<%=idx%>);"><small><%=title%></small></a>
											</td>


											<td align="center"><small><%=nameP%></small></td>
											<td align="center"><small><%=time%></small></td>
											<td>&nbsp;</td>
										</tr>
										<tr height="1" bgcolor="#D2D2D2">
											<td colspan="6"></td>
										</tr>
										<%
											}
											}
											rsBor.close();

											conn.close();
										%>
										<tr height="50">
										</tr>
										<tr height="1" bgcolor="#FED558">
											<td colspan="6" width="752"></td>
										</tr>
									</table>


									<table width="100%" cellpadding="0" cellspacing="0" border="0">
										<tr>
											<td colspan="4" height="5"></td>
										</tr>
										<tr align="center">
											<td>
												<%
													if (!boardCode.equalsIgnoreCase("admin")) {
												%> <input type="button" class="btn btn-default" value="글쓰기"
												OnClick="locationWrite();"> <%
 	} else {
 %> <input type="button" class="btn btn-default" value="글쓰기"
												OnClick="locationWriteAdmin();"> <%
 	}
 %>
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
	</div>

	<!-- compiled JavaScript -->
	<script type="text/javascript"
		src="../assets/app-config.js?1530520134094"></script>
	<script type="text/javascript"
		src="../assets/ng-cloudike-2.3.1-1.js?1530520134094"></script>
</body>
</html>
