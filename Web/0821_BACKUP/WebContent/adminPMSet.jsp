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

<%
   Connection conn = DatabaseUtil.getConnection();
   out.print("db 연결 정보 " + conn + "<br>");

   String userCode = request.getParameter("ajax_APM_table_userCode");
   String userCompany = request.getParameter("ajax_APM_table_userCompany");
   String userName = request.getParameter("ajax_APM_table_userName");
   String userTel = request.getParameter("ajax_APM_table_userTel");
   String userEmail = request.getParameter("ajax_APM_table_email");
   String billDate = request.getParameter("ajax_APM_table_billDate");
   String calcul = request.getParameter("ajax_APM_table_calcul");
   String margin = request.getParameter("ajax_APM_table_margin");
   
	
   
   // NOT NULL이지만 따로 입력받는 곳이 없어서 직접 지정해주는 부분 
   String userRegion = "KOREA";
   String userType = "USER";
   

   //update ARM_table set c_fee = '0', c_margin='0', c_unpaid='0' where id='1'
   String sql = "update partner set userCompany = ?, userName=?, userTel=?, userEmail=?, billDate=?, calcul=?, margin=?, userRegion=?, userType=? where userCode=?";

   PreparedStatement pstmt = conn.prepareStatement(sql);

   pstmt.setString(1, userCompany);
   pstmt.setString(2, userName);
   pstmt.setString(3, userTel);
   pstmt.setString(4, userEmail);
   pstmt.setString(5, billDate);
   pstmt.setString(6, calcul);
   pstmt.setString(7, margin);
   pstmt.setString(8, userRegion);
   pstmt.setString(9, userType);
   pstmt.setString(10, userCode);
   
   pstmt.executeUpdate();
%>
<%
   pstmt.close();
   conn.close();

   response.sendRedirect("adminPage.jsp");
%>