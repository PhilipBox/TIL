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
	String userPassword = request.getParameter("password");

	sql = "select userCode from partner where userEmail = ? and userPassword = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, userEmail);
	pstmt.setString(2, userPassword);

	ResultSet loginRS = pstmt.executeQuery();

	if (loginRS.next()) {
		userCode = loginRS.getString(1);
		/* session */
		session.setAttribute("userCodeDB", userCode);	
		if(userEmail.equals("marketing@asdtech.co")){
			n=0;
		}
		else{
			n=1;
		}
	} else {
		n = -1;
	}
%>
<script>
	if (<%=n%>== 0) {
		location.href = "adminPage.jsp"
	} else if (<%=n%>== 1){
		location.href = "partnerPage.jsp"
	}
	else {
		alert("이메일/비밀번호가 올바르지 않습니다.");
		history.go(-1);
	}
</script>