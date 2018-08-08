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

   String id = request.getParameter("ajax_ARM_table_c_code_for_delete");
   
   String sql = "delete from customer where c_code =?";
   PreparedStatement pstmt = conn.prepareStatement(sql);
   pstmt.setString(1, id);
   pstmt.executeUpdate();
%>
<%
   pstmt.close();
   conn.close();

   response.sendRedirect("adminPage.jsp");
%>