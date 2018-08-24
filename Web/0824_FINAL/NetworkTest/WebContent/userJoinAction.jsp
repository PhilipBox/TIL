<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="util.DatabaseUtil"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	response.setContentType("text/html; charset=utf-8");
%>


<%
	Connection conn = DatabaseUtil.getConnection();
	//out.print("db 연결 정보 " + conn + "<br>");

	String codeType = "";
	String codeNumber = "";
	//String userCode = "";
	String sql = "";
	char[] alph = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
			'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'};

	int n = 0;

	String userRegion = request.getParameter("userRegion");
	String userType = request.getParameter("userType");

	if (userType.equals("cor")) {
		if (userRegion.equals("ja"))
			codeType = "PJC";
		else
			codeType = "PKC";
	} else {
		if (userRegion.equals("ja"))
			codeType = "PJP";
		else
			codeType = "PKP";
	}

	String userCode = request.getParameter("userCode");
	String userName = request.getParameter("name");
	String userEmail = request.getParameter("email");
	String userPassword = request.getParameter("password");
	String userCompany = request.getParameter("company_name");
	String userTel = request.getParameter("phone_number");

	Date today = new Date();
	SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
	String regiDate = date.format(today);
	/*
	out.print("유저타입" + userType + "<br>");
	out.print("지역 정보 " + userRegion + "<br>");
	out.print("유형 정보 " + userType + "<br>");
	out.print("이름 정보 " + userName + "<br>");
	out.print("이메일 정보 " + userEmail + "<br>");
	out.print("비밀번호 정보 " + userPassword + "<br>");
	out.print("회사 정보 " + userCompany + "<br>");
	out.print("전화번호 정보 " + userTel + "<br>");
	*/

	if (codeType.equals("PKP")) {
		sql = " select MAX(id) from PKP_code";
	} else if (codeType.equals("PKC")) {
		sql = " select MAX(id) from PKC_code";
	} else if (codeType.equals("PJP")) {
		sql = " select MAX(id) from PJP_code";
	} else if (codeType.equals("PJC")) {
		sql = " select MAX(id) from PJC_code";
	}
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet Num = pstmt.executeQuery();

	if (Num.next()) {
		int codeNum = Num.getInt(1);
		if (codeNum >= 0 && codeNum < 999) {
			codeNumber = String.format("%03d", codeNum + 1);
			userCode = codeType + codeNumber;

		} else {
			int first, second, third;

			second = (codeNum - 1000) / 26;
			third = (codeNum - 1000) % 26;
			first = second / 26;

			userCode = codeType + alph[first] + alph[second] + alph[third];
		}
	} else {
		userCode = codeType + "001";
	}

	int dupEmail = -1;
	int dupComp = -1;

	sql = "select count(*) from partner where userEmail=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, userEmail);
	ResultSet resEmail = pstmt.executeQuery();
	if (resEmail.next()) {
		dupEmail = Integer.parseInt(resEmail.getString(1));
	}

	sql = "select count(*) from partner where userCompany=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, userCompany);
	ResultSet resCompany = pstmt.executeQuery();
	if (resCompany.next()) {
		dupComp = Integer.parseInt(resCompany.getString(1));
	}
	if (dupComp == 0 && dupEmail == 0) {

		sql = "insert into partner(userCode, userName, userEmail, userPassword, userCompany, userTel, userRegion,userType, regiDate) VALUES(?,?,?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, userCode);
		pstmt.setString(2, userName);
		pstmt.setString(3, userEmail);
		pstmt.setString(4, userPassword);
		if (userCompany == null)
			pstmt.setString(5, "개인");
		else
			pstmt.setString(5, userCompany);
		pstmt.setString(6, userTel);
		pstmt.setString(7, userRegion);
		pstmt.setString(8, userType);
		pstmt.setString(9, regiDate);

		n = pstmt.executeUpdate();

		if (codeType.equals("PKP")) {
			sql = "insert into PKP_code(userCode) VALUES(?)";
		} else if (codeType.equals("PKC")) {
			sql = "insert into PKC_code(userCode) VALUES(?)";
		} else if (codeType.equals("PJP")) {
			sql = "insert into PJP_code(userCode) VALUES(?)";
		} else if (codeType.equals("PJC")) {
			sql = "insert into PJC_code(userCode) VALUES(?)";
		}
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userCode);
		pstmt.executeUpdate();

		pstmt.close();
	} else {
		if (dupComp > 0) {
			n = -1;
		} else if (dupEmail > 0) {
			n = -2;
		}
	}
%>
<%
	conn.close();
%>
<script>
	if (
<%=n%>
	> 0) {
		alert("정상적으로 회원가입이 되었습니다.");
		location.href = "userSignin.jsp"
	} else if (
<%=n%>
	== -1) {
		alert("같은 이름의 기업이 이미 존재합니다.");
		history.go(-1);
		//$('#companyDuplicateMessage').css("display", "block");
	} else if (
<%=n%>
	== -2) {
		alert("같은 이메일이 이미 존재합니다.");
		history.go(-1);
		//$('#emailDuplicateMessage').css("display", "block");
	}
</script>