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

	//customer table data
	String id = request.getParameter("ajax_PRM_table_id_for_delete");
	String customerCode = request.getParameter("ajax_PRM_table_c_code_for_delete");

	id = id.replaceAll("/", "");
	id = id.replaceAll("PRM", "");
	id = id.replaceAll("_", "");
	//System.out.println("id : " + id + "// c_code : " + c_code);

	String sql = "insert into admin_notification values(?,?,'noting','nothing','nothing',?,?,?)";

	String userCode = (String) session.getAttribute("userCodeDB");

	Date today = new Date();
	SimpleDateFormat date = new SimpleDateFormat("yy.MM.dd");
	SimpleDateFormat time = new SimpleDateFormat("hh:mm a");

	String dateTime = date.format(today) + " " + time.format(today);
	String message = "삭제 요청이 도착했습니다.";
	String messageCheck = "-2";

	PreparedStatement pstmt = conn.prepareStatement(sql);

	pstmt.setString(1, userCode);
	pstmt.setString(2, customerCode);
	pstmt.setString(3, dateTime);
	pstmt.setString(4, message);
	pstmt.setString(5, messageCheck);

	pstmt.executeUpdate();
%>
<%
	pstmt.close();
	conn.close();
	response.sendRedirect("adminPage.jsp");
%>S
