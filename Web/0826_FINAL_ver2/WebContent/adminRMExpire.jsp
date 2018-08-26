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

   String id = request.getParameter("ajax_ARM_table_c_code_for_delete");
   String state = request.getParameter("state");
   String update="";
   if(state.equalsIgnoreCase("used")){
      update = "none";
   }
   
   String currentYear = Integer.toString(Calendar.getInstance().get(Calendar.YEAR));
   int currentM = Calendar.getInstance().get(Calendar.MONTH) + 1;
   String currentMonth = "0";
   if(currentM <10){
      currentMonth = currentMonth+currentM;
   }

   String day = Integer.toString(Calendar.getInstance().get(Calendar.DATE));
   
   String expire = currentYear+"-"+currentMonth+"-"+day;
   
   String sql = "update customer_list set c_state=?, c_expireDate=? where c_code =?";
   PreparedStatement pstmt = conn.prepareStatement(sql);
   pstmt.setString(1, update);
   pstmt.setString(2, expire);
   pstmt.setString(3, id);
   pstmt.executeUpdate();
   
   
   String sqlCount = "update customer_count set c_expireDate=? where c_code =?";
   PreparedStatement pstmtCount = conn.prepareStatement(sqlCount);
   pstmtCount.setString(1, expire);
   pstmtCount.setString(2, id);
   pstmtCount.executeUpdate();
   
   //delete from customer_count where c_billDate > CURDATE();
   String sqldel = "delete from customer_count where c_billDate > CURDATE() and c_code =?";
   PreparedStatement pstmtdel = conn.prepareStatement(sqldel);
   pstmtdel.setString(1, id);
   pstmtdel.executeUpdate();
   
   
   
%>
<%
   pstmt.close();
   conn.close();

   response.sendRedirect("adminPage.jsp");
%>