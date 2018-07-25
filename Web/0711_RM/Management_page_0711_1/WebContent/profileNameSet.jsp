<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="util.DatabaseUtil"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("utf-8"); %>

<% response.setContentType("text/html; charset=utf-8"); %>

<html>

<head>

<title>ajax_namechange</title>

</head>

<body>

<p>

<% 
Connection conn = DatabaseUtil.getConnection();
out.print("db 연결 정보 "+conn+"<br>");

//Statement stmt = conn.createStatement();
//request.setCharacterEncoding("utf-8");

 String userName = request.getParameter("userName");
 String userPhone = request.getParameter("userPhone");

 out.println("name!!!!!!!!!!"+userName);
 //HashMap<String,String> map = new HashMap<String,String>();
 //  map.put("number",userName);
 //  map.put("id",userPhone);

   //TODO: where 뒤에 효진이꺼랑 합쳐서 id등으로 고치기!!!!!!!
   String sql = "update TESTPROFILE SET userName=? where userCode='PKC221'";
 //"update TESTPROFILE SET userName=? where userCode=?";

 

 PreparedStatement pstmt = conn.prepareStatement(sql);
 
 pstmt.setString(1, userName);
 
 pstmt.executeUpdate();
%>
<%
pstmt.close();
conn.close();

response.sendRedirect("myPage.jsp");
%>
</p>

</body>

</html>