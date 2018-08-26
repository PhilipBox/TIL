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

   String id = request.getParameter("ajax_ARM_table_c_code");
   String fee = request.getParameter("ajax_ARM_table_fee");
   String margin = request.getParameter("ajax_ARM_table_margin");

   fee = fee.replaceAll(",","");
   margin = margin.replaceAll(",","");

   System.out.println("c_code : "+id);
   
   //update ARM_table set c_fee = '0', c_margin='0', c_unpaid='0' where id='1'
   String sql = "update customer_list set c_fee = ?, c_margin=?, p_margin=? where c_code=?";

   PreparedStatement pstmt = conn.prepareStatement(sql);

   pstmt.setString(1, fee);
   pstmt.setString(2, margin);
   pstmt.setString(3, "-1");
   pstmt.setString(4, id);
   pstmt.executeUpdate();
%>
<%
   pstmt.close();
   conn.close();

   response.sendRedirect("adminPage.jsp");
%>