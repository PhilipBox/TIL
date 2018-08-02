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

   /*
   ajax_ARM_table_fee : $(fee).val(),
          ajax_ARM_table_margin : $(margin).val(),
          ajax_ARM_table_unpaid : $(unpaid).val(),*/

   //update customer set c_fee = '0', c_margin='0', c_unpaid='0' where c_code='PKC201-CK001'

   //update ARM_table set c_fee = '0', c_margin='0', c_unpaid='0' where id='1'
   String id = request.getParameter("ajax_ARM_table_c_code");
   String fee = request.getParameter("ajax_ARM_table_fee");
   String margin = request.getParameter("ajax_ARM_table_margin");
   String unpaid = request.getParameter("ajax_ARM_table_unpaid");

   fee = fee.replaceAll(",","");
   margin = margin.replaceAll(",","");
   unpaid = unpaid.replaceAll(",","");

   
   //update ARM_table set c_fee = '0', c_margin='0', c_unpaid='0' where id='1'
   String sql = "update customer set c_fee = ?, c_margin=?, c_unpaid=? where c_code=?";

   PreparedStatement pstmt = conn.prepareStatement(sql);

   pstmt.setString(1, fee);
   pstmt.setString(2, margin);
   pstmt.setString(3, unpaid);
   pstmt.setString(4, id);
   pstmt.executeUpdate();
%>
<%
   pstmt.close();
   conn.close();

   response.sendRedirect("adminPage.jsp");
%>