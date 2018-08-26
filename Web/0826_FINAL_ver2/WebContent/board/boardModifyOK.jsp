<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="util.DatabaseUtil"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@page import="java.util.Enumeration"%>
<%@ page import="java.text.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	//admin 로그인 용
	//String code ="admin";
	//String name="admin";
	//String fromAdmin="PKC222";

	//String name = request.getParameter("name");
	
		String code = (String) session.getAttribute("userCodeDB");
		
	String name = (String) session.getAttribute("userNameDB");
	
	String title = request.getParameter("title");
	String memo = request.getParameter("memo");
	int notice = 0;
	if (code.equals("admin")) {
		notice = Integer.parseInt(request.getParameter("notice"));
	}
	int idx = Integer.parseInt(request.getParameter("idx"));

	try {
		Connection conn = DatabaseUtil.getConnection();
		String sql = "";
		if (code.equals("admin")) {
			sql = "UPDATE board set title=?, memo=?, notice=? where num=?";
		} else {
			sql = "UPDATE board set title=?, memo=? where num=?";
		}
		PreparedStatement pstmt = conn.prepareStatement(sql);

		if (code.equals("admin")) {
			pstmt.setString(1, title);
			pstmt.setString(2, memo);
			pstmt.setInt(3, notice);
			pstmt.setInt(4, idx);
		} else {
			pstmt.setString(1, title);
			pstmt.setString(2, memo);
			pstmt.setInt(3, idx);
		}
		pstmt.execute();
		pstmt.close();
		conn.close();

	} catch (Exception e) {

	}
%>
<script language=javascript>
	self.window.alert("게시물을 수정하였습니다.");
	location.href = "boardList.jsp";
</script>
