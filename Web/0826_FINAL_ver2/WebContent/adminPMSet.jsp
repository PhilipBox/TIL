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

	String userCode = request.getParameter("ajax_APM_table_userCode");
	String userCompany = request.getParameter("ajax_APM_table_userCompany");
	String userName = request.getParameter("ajax_APM_table_userName");
	String userTel = request.getParameter("ajax_APM_table_userTel");
	String userEmail = request.getParameter("ajax_APM_table_email");
	String margin = request.getParameter("ajax_APM_table_margin");
	String userRegion = "";
	String userType = "";

	// NOT NULL이지만 따로 입력받는 곳이 없어서 직접 지정해주는 부분 
	
	if (userCode.substring(0, 3).equals("PKC")) { //한국 기업
		userRegion = "ko";
		userType = "cor";
	} else if (userCode.substring(0, 3).equals("PKP")) { //한국 개인
		userRegion = "ko";
		userType = "ind";
	} else if (userCode.substring(0, 3).equals("PJC")) { //일본 기업
		userRegion = "ja";
		userType = "cor";
	} else { //일본 개인
		userRegion = "ja";
		userType = "ind";
	}

	//update ARM_table set c_fee = '0', c_margin='0', c_unpaid='0' where id='1'
	String sql = "update partner set userCompany = ?, userName=?, userTel=?, userEmail=?, margin=?, userRegion=?, userType=? where userCode=?";

	PreparedStatement pstmt = conn.prepareStatement(sql);

	pstmt.setString(1, userCompany);
	pstmt.setString(2, userName);
	pstmt.setString(3, userTel);
	pstmt.setString(4, userEmail);
	pstmt.setString(5, margin);
	pstmt.setString(6, userRegion);
	pstmt.setString(7, userType);
	pstmt.setString(8, userCode);

	pstmt.executeUpdate();
%>
<%
	pstmt.close();
	conn.close();

	//response.sendRedirect("adminPage.jsp");
%>