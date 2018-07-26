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

	String ajax_bill_date = request.getParameter("ajax_bill_date");
	String c_bill_date = ajax_bill_date.substring(0,4) + "/" + ajax_bill_date.substring(4,6) + "/" + ajax_bill_date.substring(6,8);
	
	String userCode = request.getParameter("ajax_ARM_partner_code");
	String c_name = request.getParameter("ajax_ARM_partner_name");
	String c_plan = request.getParameter("ajax_ARM_rate_system");
	String c_calcul = request.getParameter("ajax_ARM_contract_unit");
	String c_fee = request.getParameter("ajax_ARM_fee");
    
   	String c_code = "NO2";	// 이게 priamry key인데, 아직은 할당하는 알고리즘이 읎어서.... 한번 추가할때마다 숫자 바꿔줘야행
   
   //String sql = "insert into customer set userCode=?, c_code=?, c_name=?, c_billDate=?, c_plan=?, c_calcul=?, c_fee=?";
   String sql = "insert into customer(userCode, c_code, c_name, c_billDate, c_plan, c_calcul, c_fee, c_margin, c_unpaid) values(?,?,?,?,?,?,?,?,?)";
   PreparedStatement pstmt = conn.prepareStatement(sql);

   pstmt.setString(1, userCode);
   pstmt.setString(2, c_code);
   pstmt.setString(3, c_name);
   pstmt.setString(4, c_bill_date);
   pstmt.setString(5, c_plan);
   pstmt.setString(6, c_calcul);
   pstmt.setString(7, c_fee);
   pstmt.setString(8, "NULL");
   pstmt.setString(9, "NULL");
   pstmt.executeUpdate();
%>
<%
   pstmt.close();
   conn.close();

   response.sendRedirect("adminPage.jsp");
%>