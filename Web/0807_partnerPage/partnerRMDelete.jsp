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
String id = request.getParameter("ajax_PRM_table_id_for_delete");
String c_code = request.getParameter("ajax_PRM_table_c_code_for_delete");

id = id.replaceAll("/","");
id = id.replaceAll("PRM","");
id = id.replaceAll("_","");

System.out.println("id : " + id + "// c_code : " + c_code);


/*
   Connection conn = DatabaseUtil.getConnection();
   out.print("db 연결 정보 " + conn + "<br>");

   String id = request.getParameter("ajax_PRM_table_id_for_delete");
   id = id.replaceAll("/","");
   id = id.replaceAll("PRM","");
   id = id.replaceAll("_","");
   
   
   System.out.println("요놈의 인덱스가 선택되었습니다 -> " + id);
   
   String sql = "delete from customer where id =?";
   PreparedStatement pstmt = conn.prepareStatement(sql);
   pstmt.setString(1, id);
   pstmt.executeUpdate();
   */

%>
<%
/*
   pstmt.close();
   conn.close();
 */ 
   response.sendRedirect("partnerPage.jsp");
%>