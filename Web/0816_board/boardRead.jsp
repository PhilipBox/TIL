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
	//out.print("db 연결 정보 " + conn + "  + boardCode");
%>
<html>
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
	font-size: 14px"
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
	<div id="divList">
		<div class="b-fullheight ng-isolate-scope b-content">
			<!-- ngIf: viewType == 'list' -->
			<div class="ng-scope" id="listDiv" style="display: block;">
				<!-- ngInclude: 'clFolderContents/folderContentsAsList.tpl.html' -->
				<%
					String scurPage = request.getParameter("curPageP");
					int countList = Integer.parseInt(request.getParameter("countList"));

					if (scurPage == null)
						scurPage = "1";
					int curPage = Integer.parseInt(scurPage);
				%>

				<%
					int totalCount = 0;
				int tempCount = 0;
					int noticeCount = 0;

					String sqlBor;
					PreparedStatement pstmtBor = null;
					String sqlList;
					PreparedStatement pstmtBor2 = null;

					Statement stmt_susu = conn.createStatement();
					String sql_susu = "select count(*) FROM board where notice=1 ;";
					stmt_susu.executeQuery(sql_susu);
					ResultSet rs_susu = null;
					rs_susu = stmt_susu.executeQuery(sql_susu);

					if (rs_susu.next())
						noticeCount = rs_susu.getInt("count(*)");

					int curRow = (curPage - 1) * (countList);

					//select * from board where notice=1 order by ref desc, step asc LIMIT 1,10;
					String sqlNotice = "SELECT * from board where notice=1 order by ref desc, step asc ";
					PreparedStatement pstmtNotice = conn.prepareStatement(sqlNotice);
					ResultSet rsNotice = null;
					rsNotice = pstmtNotice.executeQuery();

					if (boardCode.equalsIgnoreCase("admin")) {

						sqlBor = "select IFNULL(count(*),0) FROM board";
						pstmtBor = conn.prepareStatement(sqlBor);

						sqlList = "SELECT * from board order by ref desc, step asc " + " LIMIT " + curRow + ", " + countList;
						pstmtBor2 = conn.prepareStatement(sqlList);

					} else {
						sqlBor = "select IFNULL(count(*),0) FROM board WHERE userCode=? or fromAdmin=?";
						pstmtBor = conn.prepareStatement(sqlBor);
						pstmtBor.setString(1, boardCode);
						pstmtBor.setString(2, boardCode);

						sqlList = "SELECT * from board where userCode=? or fromAdmin=? order by ref desc, step asc " + " LIMIT "
								+ curRow + ", " + countList;
						pstmtBor2 = conn.prepareStatement(sqlList);
						pstmtBor2.setString(1, boardCode);
						pstmtBor2.setString(2, boardCode);

					}
					ResultSet rsBor = null;
					rsBor = pstmtBor.executeQuery();

					if (rsBor.next()) {
						totalCount = rsBor.getInt(1);
					}
					ResultSet rsBor2 = null;
					rsBor2 = pstmtBor2.executeQuery();
				%>
				<table style="width: 100%">
					<tr align="right">
						<td style="padding: 10px;">

							<div class="searchDiv">
								<input class="searchText" type="text" id="search" name="search"
									placeholder="검색어를 입력하세요">

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
				<table class="type01">
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
 %> <a style="color: #A6A6A6; font-size: 12px;"
							href="javascript:locationView(<%=idxN%>);"><%=titleN%></a>
						</td>


						<td style="align: center; font-size: 12px;"><%=namePN%></td>
						<td style="align: center; font-size: 12px;"><%=timeN%></td>
						<td style="align: center; font-size: 12px;"><%=hitN%></td>
					</tr>
					<tr height="1" bgcolor="#D2D2D2">
						<td colspan="6"></td>
					</tr>
					<%
						}
					%>

					<%
						if (totalCount == 0) {
					%>
					<tr align="center" height="30">
						<td colspan="6">등록된 글이 없습니다.</td>
					</tr>
					<%
						} else {
							out.print(totalCount+"  / "+curRow);
							int tempNum = totalCount + 1 -curRow;
							int num = 0;
							if(countList < tempNum){
								 num = countList + 1;
							} else{
								 num = totalCount + 1;
							}
							

							while (rsBor2.next()) {
								num--;
								int idx = rsBor2.getInt("num");
								String title = rsBor2.getString("title");
								String nameP = rsBor2.getString("userName");
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
							%>&nbsp;&nbsp; <%
 	}
 			if (indent != 0) {
 %> <img src='../img/reply_icon.png' /> <%
 	}
 %> <a style="color: #A6A6A6; font-size: 12px"
							href="javascript:locationView(<%=idx%>);"><%=title%></a>
						</td>


						<td style="align: center; font-size: 12px;"><%=nameP%></td>
						<td style="align: center; font-size: 12px;"><%=time%></td>
						<td style="align: center; font-size: 12px;"><%=hit%></td>
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
				<div id="pagination" style="text-align: center">
					<%
						int countPage = 10;

						int totalPage = totalCount / countList;

						if (totalCount % countList > 0)
							totalPage++;
						if (totalPage < curPage) {

							curPage = totalPage;

						}

						int startPage = ((curPage - 1) / countPage) * countPage + 1;

						int endPage = startPage + countPage - 1;

						if (endPage > totalPage)
							endPage = totalPage;
					%>
					 <button type='button' id="firstPage" name="firstPage"  class='btn btn-default' style="visibility:hidden" > << </button>
					 <button type='button' id="beforePage" name="beforePage" class='btn btn-default' style="visibility:hidden" > < </button>
					<%
						if (curPage > 1) {
							%>
							<script type="text/javascript">
								var firstPageBtn=document.getElementById("firstPage");
								firstPageBtn.style.display = "none";
								
								var beforePageBtn=document.getElementById("beforePage");
								beforePageBtn.style.display = "none";
							</script>
							<% 
							
							if (curPage > countPage) {
								out.print(" <button type='button' onclick='readPaging(" + (curPage - countPage) + ", " + countList
										+ ");' class='btn btn-default'> << </button> ");
							} else {
								out.print(" <button type='button' onclick='readPaging(" + 1 + ", " + countList
										+ ");' class='btn btn-default'> << </button> ");
							}

							//		out.print("<a href=\"?scurPage_partenr=" + 1 + "\">처음</a>");
							//out.print("<a href=\"?curPage=" + (curPage - 1) + "\">< 이전</a>");
							out.print(" <button type='button' onclick='readPaging(" + (curPage - 1) + ", " + countList
									+ ");' class='btn btn-default'> < </button> ");

						}
					
						// 1~10 버튼 생성
						for (int i = startPage; i < endPage + 1; i++) {
							//out.print("<a href=\"?scurPage_partenr=" + i + "\">"+i+"</a>");
							out.print(" <button type='button' onclick='readPaging(" + i + ", " + countList
									+ ");' class='btn btn-default'>" + i + "</button> ");
						}
						
						
						%>
				 <button type='button' id="endPage" name="endPage"  class='btn btn-default' style="visibility:hidden"> >> </button>
				 <button type='button' id="nextPage" name="nextPage" class='btn btn-default' style="visibility:hidden"> > </button>
						<%
						if (curPage < totalPage) {
							
							%>
							<script type="text/javascript">
								var nextPageBtn=document.getElementById("endPage");
								nextPageBtn.style.visibility = "hidden";
							
								var nextPageBtn=document.getElementById("nextPage");
								nextPageBtn.style.display = "none";
							</script>
							
							<% 
							
							//out.print("<a href=\"?scurPage_partenr=" + (curPage + 1) + "\">다음 ></a>");
							out.print(" <button type='button' onclick='readPaging(" + (curPage + 1) + ", " + countList
									+ ");' class='btn btn-default'> > </button> ");

						}
						//if (endPage < totalPage){
						//out.print("<a href=\"?scurPage_partenr=" + totalPage + "\">끝</a>");
						if (curPage < (totalPage - countPage)) {
							
							%>
							<script type="text/javascript">
								var endPageBtn=document.getElementById("endPage");
								endPageBtn.style.display = "none";
							
								var nextPageBtn=document.getElementById("nextPage");
								nextPageBtn.style.visibility = "hidden";
							</script>
							<% 
							out.print(" <button type='button' onclick='readPaging(" + (curPage + countPage) + ", " + countList
									+ ");' class='btn btn-default'> >></button> ");
						} 
						
						else if(curPage == endPage) {
							%>
							<script type="text/javascript">
								var endPageBtn=document.getElementById("endPage");
								endPageBtn.style.visibility = "hidden";
							
								var nextPageBtn=document.getElementById("nextPage");
								nextPageBtn.style.visibility = "hidden";
							</script>
							<% 
							out.print("curPage  " + curPage);
						}
						
						else {
							%>
							<script type="text/javascript">
								var endPageBtn=document.getElementById("endPage");
								endPageBtn.style.display = "none";
							
								var nextPageBtn=document.getElementById("nextPage");
								nextPageBtn.style.display = "none";
							</script>
							<% 
							out.print(" <button type='button' onclick='readPaging(" + totalPage + ", " + countList
									+ ");' class='btn btn-default'> >></button> ");
							
							//}
							out.print("curPage  " + curPage);
						}
					%>
				</div>

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