<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="util.DatabaseUtil"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@page import="java.util.Enumeration"%>
<%@ page import="java.text.*"%>
<%
	/* session userCode  */
	String userCode = "";
	userCode = (String) session.getAttribute("userCodeDB");
	//String email = (String) session.getAttribute("userEmailDB");
%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	int idx = Integer.parseInt(request.getParameter("idx"));
	//out.print(idx);

	try {

		Connection conn = DatabaseUtil.getConnection();
		Statement stmt = conn.createStatement();

		String sql = "SELECT userName, title, memo, time, hit, notice, userCode, userEmail FROM board WHERE num=" + idx;
		ResultSet rs = stmt.executeQuery(sql);
		if (rs.next()) {
			String name = rs.getString(1);
			String title = rs.getString(2);
			String memo = rs.getString(3);
			String time = (rs.getString(4)).substring(0, 11);
			int hit = rs.getInt(5);
			int notice = rs.getInt(6);
			String codeCh = rs.getString(7);
			String email = rs.getString(8);

			hit++;

			memo = memo.replaceAll("\n", "<br>");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<script>
function codeCheckForModify(idx){

    var who = $('#who').val();
   var me = $('#me').val();
   // alert(who);alert(me);
    
    who = who.toLowerCase();
    me = me.toLowerCase();
    
    
    if (me == who){
		if(me == "admin"){
			  locationModifyAdmin(idx);
		}
		else{
			locationModify(idx);
		}
	}else{
		alert("본인이 올린 글만 수정할 수 있습니다.");
	}
    
 }

 function locationReply(idx){
     // alert(idx);
      $.ajax({
         type : "post",
         url : "./boardReply.jsp",
         data : {
            idx:idx
         },
         success : moveSuccess,
         error : moveError
      });
   }

 function locationModify(idx){
     // alert(idx);
      $.ajax({
         type : "post",
         url : "./boardModify.jsp",
         data : {
            idx:idx
         },
         success : moveSuccess,
         error : moveError
      });
   }
 

 function locationModifyAdmin(idx){
     // alert(idx);
      $.ajax({
         type : "post",
         url : "./boardModifyAdmin.jsp",
         data : {
            idx:idx
         },
         success : moveSuccess,
         error : moveError
      });
   }
 function button_delete(idx){
      alert(idx);
      $.ajax({
         type : "post",
         url : "./boardDelete.jsp",
         data : {
            idx:idx
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
				<!-- ngInclude: 'clFolderContents/folderContentsAsList.tpl.html' -->
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


				<table class="type01" width="1200px">

					<colgroup>
						<col class="col-md-2">
						<col class="col-md-2">
						<col class="col-md-2">
						<col class="col-md-2">
						<col class="col-md-2">
						<col class="col-md-2">
					</colgroup>

					<tr>
						<td style="text-align: center;" colspan="1">제목</td>
						<td colspan="5"><%=title%></td>
					</tr>
					<tr>
						<td style="text-align: center;" colspan="1">글쓴이</td>
						<td colspan="5"><%=name%> / <%=email%> <input
							style="display: none;" id="who" value="<%=codeCh%>"></input> <input
							style="display: none;" id="me" value="<%=userCode%>"></input></td>

					</tr>
					<tr>
						<td style="text-align: center;">구분</td>
						<%
							if (notice == 1) {
						%>
						<td style="text-align: center;">공지</td>
						<%
							} else if (notice == 0 && name.equals("관리자(한국)")) {
						%>
						<td style="text-align: center;">안내</td>
						<%
							} else {
						%>
						<td style="text-align: center;">일반</td>
						<%
							}
						%>
						<td style="text-align: center;">조회수</td>
						<td style="text-align: center;"><%=hit%></td>
						<td style="text-align: center;">작성일</td>
						<td style="text-align: center;"><%=time%></td>
					</tr>

					<tr>
						<td style="text-align: center; padding: 100px 40px 100px 40px;"
							colspan="1">내용</td>
						<td colspan="5"><%=memo%></td>
					</tr>
				</table>

				<table style="width: 100%">

					<%
						String sqlHit = "UPDATE board SET HIT=" + hit + " where NUM=" + idx;
								stmt.executeUpdate(sqlHit);
							}
							rs.close();
							stmt.close();
							conn.close();

						} catch (SQLException e) {
						}
					%>
					<tr height="10px">
						<td></td>
					</tr>
					<tr>
						<td>
							<button class="btn btn-primary" style="float: left;"
								onclick="window.location='boardList.jsp'">목록보기</button>
							<button class="btn btn-primary" style="float: right;"
								onclick="locationReply(<%=idx%>);">답변하기</button>
						</td>
					</tr>
					<tr height="10px">
						<td></td>
					</tr>
					<tr>
						
						<td>
							<button class="btn btn-primary" style="float: right;"
								onclick="codeCheckForModify(<%=idx%>);">수정하기</button>
						</td>
					</tr>

				</table>
			</div>
		</div>
	</div>
</body>

</html>