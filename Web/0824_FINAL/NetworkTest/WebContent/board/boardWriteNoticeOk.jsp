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

	//TODO : code, name session으로 받기
	
	String code = (String) session.getAttribute("userCodeDB");
	String name = (String) session.getAttribute("userNameDB");
	String email = (String) session.getAttribute("userEmailDB");
	//String code="PKC222";
	//String name = "susu";//request.getParameter("name");
	String title = request.getParameter("title");
	String memo = request.getParameter("memo");
	
	int max = 0;
	try {	
		Connection conn = DatabaseUtil.getConnection();
		Statement stmt = conn.createStatement();
		String sql = "SELECT MAX(NUM) FROM board"; 
		ResultSet rsM = stmt.executeQuery(sql); if(rsM.next()){ max = rsM.getInt(1); }

		sql = "INSERT INTO board (userCode, userName,title,memo, ref, userEmail, notice) VALUES(?,?,?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		
		pstmt.setString(1, code);
		pstmt.setString(2, name);
		pstmt.setString(3, title);
		pstmt.setString(4, memo);
		pstmt.setInt(5, max+1);
		pstmt.setString(6, email);
		pstmt.setInt(7, 1);
		pstmt.execute();
		
		
		
		
		pstmt.close();
		
		conn.close();
} catch(SQLException e) {
	out.println( e.toString() );
	}
%>
  <script language=javascript>
   self.window.alert("입력한 글을 저장하였습니다.");
   location.href="boardList.jsp"; 

</script>
