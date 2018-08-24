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
	String userCode = "";
	String sql = "";
	int n;
	String userEmail = request.getParameter("email");

	sql = "select userCode from partner where userEmail = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, userEmail);

	ResultSet loginRS = pstmt.executeQuery();

	if (loginRS.next()) {
		n = 0;
	} else {
		n = -1;
	}
%>
<script>
	if (<%=n%>== 0) {
		/*재설정 메일 보내기 미완성*/
		alert("비밀번호 재설정 메일을 보냈습니다.")
		location.href = "userResetpassword.jsp"
	} else {
		alert("이메일이 올바르지 않습니다.");
		history.go(-1);
	}
</script>