<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="util.DatabaseUtil"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@page import="java.util.Enumeration"%>
<%@ page import="java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
			
<%
	
	
		try{
			
			request.setCharacterEncoding("euc-kr");
			int idx = Integer.parseInt(request.getParameter("idx"));
			String title = request.getParameter("title");
			String memo = request.getParameter("memo");
			//String passw = request.getParameter("password");
		
			Connection conn = DatabaseUtil.getConnection();
			Statement stmt = conn.createStatement();
		
			String sql = "SELECT PASSWORD FROM test WHERE NUM=" + idx;
			ResultSet rs = stmt.executeQuery(sql);
		
		// if(rs.next()){
		//		password = rs.getString(1);
		 //}
		
		 //if(password.equals(passw)) {
				sql = "UPDATE test SET TITLE='" + title+ "' ,MEMO='"+ memo +"' WHERE NUM=" + idx;				
				stmt.executeUpdate(sql);
				
%>
				  <script language=javascript>
				  	self.window.alert("글이 수정되었습니다.");
				  	location.href="view.jsp?idx=<%=idx%>";
				  </script>
<%

			rs.close();
			stmt.close();
			conn.close();
			
		
		 
 } catch(SQLException e) {
	out.println( e.toString() );
} 
%>
