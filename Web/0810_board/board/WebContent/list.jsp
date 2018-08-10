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


	String boardCode="PKC222";
	
	Connection conn = DatabaseUtil.getConnection();
	out.print("db 연결 정보 " + conn);
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <title>게시판</title>
 </head>
 <body>
 
 <%

	int total = 0;
	
	String sqlBor = "select IFNULL(count(*),0) FROM board WHERE userCode=? or fromAdmin=?";
	PreparedStatement pstmtBor = conn.prepareStatement(sqlBor);
	pstmtBor.setString(1, boardCode);
	pstmtBor.setString(2, boardCode);
	
	ResultSet rsBor = null;
	rsBor = pstmtBor.executeQuery();
	
	if(rsBor.next()){
		total = rsBor.getInt(1);
	}
	
	//out.print("총 게시물 "+total);
	
	//String sqlList = "select * FROM test order by num desc;";
	String sqlList = "SELECT * from board where userCode=? or fromAdmin=? order by ref desc, step asc ";
	PreparedStatement pstmtBor2 = conn.prepareStatement(sqlList);
	pstmtBor2.setString(1, boardCode); 
	pstmtBor2.setString(2, boardCode);
	
	ResultSet rsBor2 = null;
	rsBor2 = pstmtBor2.executeQuery();
	
 
 %>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr height="5"><td width="5"></td></tr>
 <tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
   <td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
   <td width="73">번호</td>
   <td width="379">제목</td>
   <td width="73">작성자</td>
   <td width="164">작성일</td>
   <td width="7"><img src="img/table_right.gif" width="5" height="30" /></td>
  </tr>
<%
	if(total==0) {
%>
	 		<tr align="center" bgcolor="#FFFFFF" height="30">
	 	   <td colspan="6">등록된 글이 없습니다.</td>
	 	  </tr>
<%
	 	} else {
	 		
		while(rsBor2.next()) {
			int idx = rsBor2.getInt("num");
			String title = rsBor2.getString("title");
			String name = rsBor2.getString("userName");
			String time = rsBor2.getString("time");
			
			int indent = rsBor2.getInt("indent");

%>
<tr height="25" align="center">
	<td>&nbsp;</td>
	<td><%=idx %></td>
	<td align="left">
	<% 
		
	for(int j=0;j<indent;j++){
%>		&nbsp;&nbsp;&nbsp;<%
	}
	if(indent!=0){
%>		<img src='img/reply_icon.gif' />
<%
	}
%> 

	<a href="view.jsp?idx=<%=idx%>"><%=title %></td>


	<td align="center"><%=name %></td>
	<td align="center"><%=time %></td>
	
	<td>&nbsp;</td>
</tr>
  <tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>
<% 
		}
	} 
	rsBor.close();
	
	conn.close();
%>
 <tr height="1" bgcolor="#82B5DF"><td colspan="6" width="752"></td></tr>
 </table>
 
<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr><td colspan="4" height="5"></td></tr>
  <tr align="center">
   <td><input type=button value="글쓰기" OnClick="window.location='write.jsp'"></td>

  </tr>
</table>
</body> 
</html>
