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
System.out.print("reply: idx  "+idx);

	int max = 0;
	try {	
		Connection conn = DatabaseUtil.getConnection();
		Statement stmt = conn.createStatement();
		
		String sql = "DELETE FROM board WHERE num=?"; 
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, idx);
		pstmt.execute();
		
		pstmt.close();
		conn.close();
} catch(SQLException e) {
	out.println( e.toString() );
	}
%>
<script language=javascript>
	self.window.alert("게시물을 삭제하였습니다.");
	location.href="boardList.jsp"; 
</script>
