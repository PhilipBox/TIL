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
	String Str_id = request.getParameter("ajax_id_for_delete_cancel");
	
	int id = Integer.parseInt(Str_id);
	//System.out.print(id);
	
	String sql = "select * from customer where id = ?";
	String customerCode = "";
	String partnerCode = "";


	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, id);
	ResultSet rsCustom = null;

	rsCustom = pstmt.executeQuery();

	
	while (rsCustom.next()) {
		partnerCode = rsCustom.getString("userCode").toString();
		customerCode = rsCustom.getString("c_code").toString();
	}

	sql = "insert into partner_notification values(?,?,?,?)";

	Date today = new Date();
	SimpleDateFormat date = new SimpleDateFormat("yy.MM.dd");
	SimpleDateFormat time = new SimpleDateFormat("hh:mm a");

	String dateTime = date.format(today) + " " + time.format(today);
	String message = customerCode + "에 대한 삭제 메시지가 거절되었습니다.";
	String messageCheck = "-2"; //오빠는 그냥 -1 넣기 : 수정

	pstmt = conn.prepareStatement(sql);

	pstmt.setString(1, partnerCode);
	pstmt.setString(2, dateTime);
	pstmt.setString(3, message);
	pstmt.setString(4, messageCheck);

	pstmt.executeUpdate();
%>
<%
	//pstmt.close();
	//conn.close();
	response.sendRedirect("adminPage.jsp");
%>
