<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="util.DatabaseUtil"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<%
	response.setContentType("text/html; charset=utf-8");
%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
}

table.type01 td {
	color: #A6A6A6;
	font-size: 16px;
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
</head>
<body>

	<%
		Connection conn = DatabaseUtil.getConnection();

		String boardCode = (String) session.getAttribute("userCodeDB");
		String text = request.getParameter("text");
	%>
	<script>
		
	</script>

	<div id="divList">
		<div class="b-fullheight ng-isolate-scope b-content">
			<!-- ngIf: viewType == 'list' -->
			<div class="ng-scope" id="listDiv" style="display: block;">
				<!-- ngInclude: 'clFolderContents/folderContentsAsList.tpl.html' -->

				<%
					//SELECT * from board  where (title like '%r%') or (memo like 'ㅇ') order by ref desc, step asc ;
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
				<!-- 검색창 / 전체보기 버튼-->
				<table style="width: 100%">
					<tr align="right">
						<td style="padding: 10px;">

							<div class="searchDiv">
								<input class="searchText" type="text" id="search"
														name="search" style ="font-size: 12px; width: 130px" placeholder="검색어를 입력하세요">

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
				<table class="type01" style="width: 1200px;">
					<colgroup>
						<col class="col-md-1">
						<col class="col-md-7">
						<col class="col-md-2">
						<col class="col-md-1">
						<col class="col-md-1">
					<tr style="background: #F2F2F2; text-align: center; height: 30;">
						<td><b>번호</b></td>
						<td><b>제목</b></td>
						<td><b>작성자</b></td>
						<td><b>작성일</b></td>
						<td><b>조회수</b></td>

					</tr>
					<%
						while (rsNotice.next()) {

							int idxN = rsNotice.getInt("num");
							String titleN = rsNotice.getString("title");
							String namePN = rsNotice.getString("userName");
							String timeN = rsNotice.getString("time");
							timeN = timeN.substring(0, 11);
							int indentN = rsNotice.getInt("indent");
							int hitN = rsNotice.getInt("hit");
					%>

					<tr height="25" align="center">
						<td><img src='../img/notice_icon.png' /></td>
						<td align="left">
							<%
								for (int j = 0; j < indentN; j++) {
							%> <%
 	}
 		if (indentN != 0) {
 %> <img src='../img/reply_icon.png' /> <%
 	}
 %> <a style="color: #A6A6A6; font-size: 14px; padding:10px;"
							href="javascript:locationView(<%=idxN%>);"><%=titleN%></a>
						</td>


						<td style="align: center; font-size: 14px; padding:10px;"><%=namePN%></td>
						<td style="align: center; font-size: 14px; padding:10px;"><%=timeN%></td>
						<td style="align: center; font-size: 14px; padding:10px;"><%=hitN%></td>
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
					<tr align="center" height="30">
						<td colspan="6">등록된 글이 없습니다.</td>
					</tr>
					<%
						} else {
							int num = total + 1;

							while (rsBor2.next()) {

								num--;
								int idx = rsBor2.getInt("num");
								String title = rsBor2.getString("title");
								String memo = rsBor2.getString("memo");
								String nameP = rsBor2.getString("userName");

								String tempN = nameP.toLowerCase();
								String tmepT = title.toLowerCase();
								String tempM = memo.toLowerCase();
								text = text.toLowerCase();
								//out.print(title+"<br>");
								if (tmepT.contains(text) == false && tempM.contains(text) == false && tempN.contains(text) == false)
									continue;

								String time = rsBor2.getString("time");
								time = time.substring(0, 11);
								int indent = rsBor2.getInt("indent");
								int hit = rsBor2.getInt("hit");
					%>
					<tr height="25" align="center">

						<td align="center"><%=num%></td>
						<td align="left">
							<%
								for (int j = 0; j < indent; j++) {
							%><%
 	}
 			if (indent != 0) {
 %> <img src='../img/reply_icon.png' /> <%
 	}
 %> <a style="color: #A6A6A6; font-size: 14px; padding:10px;"
							href="javascript:locationView(<%=idx%>);"><%=title%></a>
						</td>


						<td style="align: center; font-size: 14px; padding:10px;"><%=nameP%></td>
						<td style="align: center; font-size: 14px; padding:10px;"><%=time%></td>
						<td style="align: center; font-size: 14px; padding:10px;"><%=hit%></td>
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
					<tr height="15">
					</tr>
				</table>

				<table style="width: 100%">
					<tr align="right">
						<td>
							<%
								if (!boardCode.equalsIgnoreCase("admin")) {
							%>
							<button class="btn btn-primary" onclick="locationWrite();">작성하기</button>
							<%
								} else {
							%>
							<button class="btn btn-primary" onclick="locationWriteAdmin();">작성하기</button>
							<%
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

</body>
</html>