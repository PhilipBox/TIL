<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="util.DatabaseUtil"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
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

   String id = request.getParameter("ajax_id");
   String fee = request.getParameter("ajax_modified_c_fee");
   String margin = request.getParameter("ajax_modified_c_margin");
   String unpaid = request.getParameter("ajax_modified_c_unpaid");

	/*id 값으로 고객코드, 파트너코드 가져오는 부분*/
	String sql = "select * from customer where id = ?";
	String customerCode = "";
	String partnerCode = "";

	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	ResultSet rsCustom = null;

	rsCustom = pstmt.executeQuery();

	while (rsCustom.next()) {
		partnerCode = rsCustom.getString("userCode").toString();
		customerCode = rsCustom.getString("c_code").toString();
	}
   
	/*고객 알림에 insert하는 부분*/
	sql = "insert into partner_notification values(?,?,?,?)";

	Date today = new Date();
	SimpleDateFormat date = new SimpleDateFormat("yy.MM.dd");
	SimpleDateFormat time = new SimpleDateFormat("hh:mm a");

	String dateTime = date.format(today) + " " + time.format(today);
	String message = customerCode + "에 대한 수정 메시지가 거절되었습니다.";
	String messageCheck = "-1";

	pstmt = conn.prepareStatement(sql);

	pstmt.setString(1, partnerCode);
	pstmt.setString(2, dateTime);
	pstmt.setString(3, message);
	pstmt.setString(4, messageCheck);

	pstmt.executeUpdate();

   System.out.println("-------수정 완료-------");
%>
<%
   pstmt.close();
   conn.close();

   response.sendRedirect("adminPage.jsp");
%>