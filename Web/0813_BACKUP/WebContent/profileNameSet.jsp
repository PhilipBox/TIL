<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="util.DatabaseUtil"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("utf-8"); %>

<% response.setContentType("text/html; charset=utf-8"); %>


<% 
Connection conn = DatabaseUtil.getConnection();
out.print("db 연결 정보 "+conn+"<br>");
 String userName = request.getParameter("userName");
 String userCode = request.getParameter("userCode");

 out.println("name!!!!!!!!!!"+userName);
   //TODO: where 뒤에 효진이꺼랑 합쳐서 id등으로 고치기!!!!!!!
   String sql = "update partner SET userName=? where userCode=?";
 
 PreparedStatement pstmt = conn.prepareStatement(sql);
 
 pstmt.setString(1, userName);
 pstmt.setString(2, userCode);
 pstmt.executeUpdate();
%>
<%
pstmt.close();
conn.close();

response.sendRedirect("partnerPage.jsp");
%>