
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

	String ajax_regiDate = request.getParameter("ajax_APM_rgs_contract_date");
	String regiDate = ajax_regiDate.substring(0, 4) + "-" + ajax_regiDate.substring(4, 6) + "-"
			+ ajax_regiDate.substring(6, 8);

	String userCompany = request.getParameter("ajax_APM_rgs_company_name");
	String userName = request.getParameter("ajax_APM_rgs_partner_name");
	String userTel = request.getParameter("ajax_APM_rgs_phone_number");
	String userEmail = request.getParameter("ajax_APM_rgs_email");

	/*코드부여 변수*/
	String codeType = "";
	String codeNumber = "";
	char[] alph = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
			'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };

	/*쿼리 변수*/
	String sql = "";

	// 아래서부터는 받아오지 않은 정보들이지만 NOT NULL에 디폴트값이 없어서 넣어줘야하는 값들.
	String userCode = ""; 
	String userPassword = "000000";
	String userRegion = "ko";
	String userType = "";

	if (userCompany.equals("개인"))
		userType = "ind";
	else
		userType = "cor";

	if (userType.equals("cor")) {
		codeType = "PKC";
	} else {
		codeType = "PKP";
	}

	if (codeType.equals("PKP")) {
		sql = " select MAX(id) from PKP_code";
	} else if (codeType.equals("PKC")) {
		sql = " select MAX(id) from PKC_code";
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

			userCode= codeType + alph[first] + alph[second] + alph[third];	
		}
	} else {
		userCode = codeType + "001";
	}
	// 아래는 NOT NULL이지만, DEFAULT가 있어서 안넣어줘도 됨!

	// String business
	// String account
	// String calcul
	// String billDate
	// String depositDate 
	// String margin 
	// String note
	// String userRegion
	// String userType

	System.out.println("userCode" + userCode);
	sql = "insert into partner(userCode, userName, userEmail, userPassword, userCompany, userTel, regiDate, userRegion, userType) values(?,?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);

	pstmt.setString(1, userCode);
	pstmt.setString(2, userName);
	pstmt.setString(3, userEmail);
	pstmt.setString(4, userPassword);
	pstmt.setString(5, userCompany);
	pstmt.setString(6, userTel);
	pstmt.setString(7, regiDate);
	pstmt.setString(8, userRegion);
	pstmt.setString(9, userType);
	pstmt.executeUpdate();

	if (codeType.equals("PKP")) {
		sql = "insert into PKP_code(userCode) VALUES(?)";
	} else if (codeType.equals("PKC")) {
		sql = "insert into PKC_code(userCode) VALUES(?)";
	}
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, userCode);
	pstmt.executeUpdate();
%>
<%
	pstmt.close();
	conn.close();

	response.sendRedirect("adminPage.jsp");
%>