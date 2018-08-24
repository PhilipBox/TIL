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

   String id = request.getParameter("ajax_APM_table_c_code_for_delete");
   System.out.println(id);
   
   String sql = "update partner set state=? where userCode =?";
   PreparedStatement pstmt = conn.prepareStatement(sql);
   pstmt.setString(1, "none");  pstmt.setString(2, id);
   pstmt.executeUpdate();
   
   //

   String currentYear = Integer.toString(Calendar.getInstance().get(Calendar.YEAR));
   int currentM = Calendar.getInstance().get(Calendar.MONTH) + 1;
   String currentMonth = "0";
   if(currentM <10){
      currentMonth = currentMonth+currentM;
   }

   String day = Integer.toString(Calendar.getInstance().get(Calendar.DATE));
   
   String expire = currentYear+"-"+currentMonth+"-"+day;
   
   String sqlcus = "update customer_list set c_state=?, c_expireDate=? where userCode =?";
   PreparedStatement pstmtcus = conn.prepareStatement(sqlcus);
   pstmtcus.setString(1, "none");
   pstmtcus.setString(2, expire);
   pstmtcus.setString(3, id);
   pstmtcus.executeUpdate();
   
   
   String sqlCount = "update customer_count set c_expireDate=? where userCode =?";
   PreparedStatement pstmtCount = conn.prepareStatement(sqlCount);
   pstmtCount.setString(1, expire);
   pstmtCount.setString(2, id);
   pstmtCount.executeUpdate();
   
   //delete from customer_count where c_billDate > CURDATE();
   String sqldel = "delete from customer_count where c_billDate > CURDATE() and userCode =?";
   PreparedStatement pstmtdel = conn.prepareStatement(sqldel);
   pstmtdel.setString(1, id);
   pstmtdel.executeUpdate();
   
   
%>
<%
   pstmt.close();
   conn.close();

   //response.sendRedirect("adminPage.jsp");
%>