<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="util.DatabaseUtil"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
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
	partner table data
	String userCode = request.getParameter("ajax_APM_table_userCode");
	String userCompany = request.getParameter("ajax_APM_table_userCompany");
	String userName = request.getParameter("ajax_APM_table_userName");
	String userTel = request.getParameter("ajax_APM_table_userTel");
	String userEmail = request.getParameter("ajax_APM_table_email");
	String billDate = request.getParameter("ajax_APM_table_billDate");
	String calcul = request.getParameter("ajax_APM_table_calcul");
	String margin = request.getParameter("ajax_APM_table_margin");
	*/

	//customer table data
	String customerCode = request.getParameter("ajax_APM_table_c_code");
	String customerFee = request.getParameter("ajax_APM_table_fee");
	String customerMargin = request.getParameter("ajax_APM_table_margin");
	String customerUnpaid = request.getParameter("ajax_APM_table_unpaid");

	/*
	// NOT NULL이지만 따로 입력받는 곳이 없어서 직접 지정해주는 부분 
	String userRegion = "KOREA";
	String userType = "USER";
	*/

	//update ARM_table set c_fee = '0', c_margin='0', c_unpaid='0' where id='1'
	String sql = "insert into admin_notification values(?,?,?,?,?,?,?,?)";

	String userCode = (String) session.getAttribute("userCodeDB");

	Date today = new Date();
	SimpleDateFormat date = new SimpleDateFormat("yy.MM.dd");
	SimpleDateFormat time = new SimpleDateFormat("hh:mm a");

	String dateTime = date.format(today) + " " + time.format(today);
	String message = "수정 요청이 도착했습니다.";
	String messageCheck = "-1";

	PreparedStatement pstmt = conn.prepareStatement(sql);

	pstmt.setString(1, userCode);
	pstmt.setString(2, customerCode);
	pstmt.setString(3, customerFee);
	pstmt.setString(4, customerMargin);
	pstmt.setString(5, customerUnpaid);
	pstmt.setString(6, dateTime);
	pstmt.setString(7, message);
	pstmt.setString(8, messageCheck);

	pstmt.executeUpdate();
%>
<%
	pstmt.close();
	conn.close();

	response.sendRedirect("adminPage.jsp");
%>