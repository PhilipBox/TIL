<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="util.DatabaseUtil"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@page import="java.util.Enumeration"%>
<%@ page import="java.text.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	int idx = Integer.parseInt(request.getParameter("idx"));
	out.print(idx);

	try {

		Connection conn = DatabaseUtil.getConnection();
		Statement stmt = conn.createStatement();

		String sql = "SELECT userName, title, memo, time, hit FROM board WHERE num=" + idx;
		ResultSet rs = stmt.executeQuery(sql);
		if (rs.next()) {
			String name = rs.getString(1);
			String title = rs.getString(2);
			String memo = rs.getString(3);
			String time = rs.getString(4);
			int hit = rs.getInt(5);

			hit++;

			memo = memo.replaceAll("\n", "<br>");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
 function locationReply(idx){
		alert(idx);
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
		alert(idx);
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
 
 
 </script>
</head>
<body>
	<div id="divList">
		<table>
			<tr>
				<td>
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr
							style="background: url('img/table_mid.gif') repeat-x; text-align: center;">
							<td width="5"><img src="img/table_left.gif" width="5"
								height="30" /></td>
							<td>내 용</td>
							<td width="5"><img src="img/table_right.gif" width="5"
								height="30" /></td>
						</tr>
					</table>
					<table width="413">
						<tr>
							<td width="0">&nbsp;</td>
							<td align="center" width="76">글번호</td>
							<td width="319"><%=idx%></td>
							<td width="0">&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4" width="407"></td>
						</tr>
						<tr>
							<td width="0">&nbsp;</td>
							<td align="center" width="76">이름</td>
							<td width="319"><%=name%></td>
							<td width="0">&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4" width="407"></td>
						</tr>
						<tr>
							<td width="0">&nbsp;</td>
							<td align="center" width="76">작성일</td>
							<td width="319"><%=time%></td>
							<td width="0">&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4" width="407"></td>
						</tr>
						<tr>
							<td width="0">&nbsp;</td>
							<td align="center" width="76">제목</td>
							<td width="319"><%=title%></td>
							<td width="0">&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4" width="407"></td>
						</tr>
						<tr>
							<td width="0">&nbsp;</td>
							<td align="center" width="76">조회수</td>
							<td width="319"><%=hit%></td>
							<td width="0">&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4" width="407"></td>
						</tr>
						<tr>
							<td width="0"></td>
							<td width="399" colspan="2" height="200"><%=memo%>
						</tr>
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
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4" width="407"></td>
						</tr>
						<tr height="1" bgcolor="#82B5DF">
							<td colspan="4" width="407"></td>
						</tr>
						<tr align="center">
							<td width="0">&nbsp;</td>
							<td colspan="2" width="399"><input type=button value="답글"
								class="btn btn-default" onclick="locationReply(<%=idx%>);">
								<input type=button value="목록" class="btn btn-default"
								OnClick="window.location='boardList.jsp'"> <input type=button value="수정" class="btn btn-default" OnClick="locationModify(<%=idx%>);">
<input class="btn btn-default" type=button value="삭제" OnClick="button_delete(<%=idx%>);">
   
							<td width="0">&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
</body>

</html>
