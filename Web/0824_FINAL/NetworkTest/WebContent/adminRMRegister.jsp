<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="util.DatabaseUtil"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.text.*"%>
<%@ page import="java.math.*"%>

<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=utf-8");
%>
<%
	Connection conn = DatabaseUtil.getConnection();
	out.print("db 연결 정보 " + conn + "<br>");

	String register_date = request.getParameter("register_date");
	String expire_date = request.getParameter("expire_date");

	String register = register_date.substring(0, 4) + "-" + register_date.substring(4, 6) + "-"
			+ register_date.substring(6, 8);

	if (expire_date.length() != 8) {
		int year = Integer.parseInt(register_date.substring(0, 4)) + 1;
		String month = register_date.substring(4, 6);

		if (month.length() < 2) {
			month = "0" + month;
		}
		String day = register_date.substring(6, 8);

		expire_date = "";
		expire_date = "" + year + month + day;
	}
	String expire = expire_date.substring(0, 4) + "-" + expire_date.substring(4, 6) + "-"
			+ expire_date.substring(6);

	String userCode = request.getParameter("ajax_ARM_partner_code");
	String c_name = request.getParameter("ajax_ARM_partner_name");
	String c_plan_index = request.getParameter("ajax_ARM_rate_system");
	String c_fee_comma = request.getParameter("ajax_ARM_fee");

	//String p_margin = request.getParameter("p_margin");

	//p_margin Setting
	//String p_margin="";
	String p_margin = "";
	String sqlM = "select margin from partner where userCode=?";

	PreparedStatement pstmtM = conn.prepareStatement(sqlM);

	pstmtM.setString(1, userCode);
	//pstmtM.executeUpdate();

	ResultSet rsM = null;
	rsM = pstmtM.executeQuery();
	int cnt = 0;
	while (rsM.next()) {
		p_margin = rsM.getString("margin");
	}
	//
	System.out.print("ddddddddd" + p_margin);

	String c_calcul;
	String c_plan;

	if (c_plan_index.equals("1")) {
		c_plan = "Basic";
	} else if (c_plan_index.equals("2")) {
		c_plan = "Standard";
	} else if (c_plan_index.equals("3")) {
		c_plan = "Professional";
	} else {
		c_plan = "Custom";
	}

	// 요금,마진,미수금 : 30%계산 및 형변환 부분

	c_fee_comma = c_fee_comma.replaceAll(",", "");
	p_margin = p_margin.replaceAll("%", "");

	long c_fee_temp = Long.parseLong(c_fee_comma);

	long p_marginLong = 30;//Long.parseLong(p_margin);

	double c_margin_temp = c_fee_temp * p_marginLong * 0.01;

	long c_margin_cut = (long) Math.floor(c_margin_temp);

	String c_fee = Long.toString(c_fee_temp);
	String c_margin = Long.toString(c_margin_cut);
	// 요금,마진,미수금 : 30%계산 및 형변환 부분 - END 

	/*코드부여 변수*/
	String c_code = ""; 
	String c_codeType = "";
	String c_codeNumber = "";
	char[] alph = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
			'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
	String sql_code = "select count(*) from customer_list where userCode=?";

	PreparedStatement pstmt = conn.prepareStatement(sql_code);
	pstmt.setString(1,userCode);
	ResultSet Num = pstmt.executeQuery();

	if (userCode.substring(0, 2).equals("PK"))
		c_codeType = "CK";
	else
		c_codeType = "CJ";

	if (Num.next()) {
		int c_codeNum = Num.getInt(1);
		if (c_codeNum >= 0 && c_codeNum < 999) {
			c_codeNumber = String.format("%03d", c_codeNum + 1);
			c_code = userCode + "-" + c_codeType + c_codeNumber;

		} else {
			int first, second, third;

			second = (c_codeNum - 1000) / 26;
			third = (c_codeNum - 1000) % 26;
			first = second / 26;

			c_code = userCode + "-" + c_codeType + alph[first] + alph[second] + alph[third];
		}
	} else {
		c_code = userCode + "-" + c_codeType + "001";
	}

	/* customer_list */
	String sql = "insert into customer_list(userCode, c_code, c_name, c_regiDate, c_expireDate, c_plan, c_fee, c_margin, p_margin, c_state) values(?,?,?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);

	pstmt.setString(1, userCode);
	pstmt.setString(2, c_code);
	pstmt.setString(3, c_name);
	pstmt.setString(4, register);
	pstmt.setString(5, expire);
	pstmt.setString(6, c_plan);
	pstmt.setString(7, c_fee);
	pstmt.setString(8, c_margin);
	pstmt.setString(9, p_margin);
	pstmt.setString(10, "used");
	pstmt.executeUpdate();

	int currentY = Integer.parseInt(register.substring(0, 4));
	int currentM = Integer.parseInt(register.substring(5, 7));

	int expireY = Integer.parseInt(expire.substring(0, 4));
	int expireM = Integer.parseInt(expire.substring(5, 7));

	currentM++;
	expireM--;

	int count = (expireY - currentY) * 12 + (expireM - currentM + 1);

	int cm = currentM;
	int cy = currentY;
	int em = expireM;
	String tt;
	String[] billDate = new String[count];

	if (currentY == expireY) {
		for (int i = 0; i < count; i++) {
			tt = "-01";
			if (cm < 10)
				tt = cy + "-0" + cm + tt;
			else
				tt = cy + "-" + cm + tt;
			cm++;
			billDate[i] = tt;

		}
	} else {
		int idx = 0;
		for (int i = cm; i < 13; i++) {
			tt = "-01";
			if (cm < 10)
				tt = cy + "-0" + cm + tt;
			else
				tt = cy + "-" + cm + tt;
			cm++;

			billDate[idx] = tt;
			idx++;
		}

		cm = 1;
		cy++;
		int yy = expireY - currentY - 1;
		//System.out.println("                             " + yy);
		for (int j = 0; j < yy; j++) {
			for (int i = cm; i < 13; i++) {
				tt = "-01";
				if (cm < 10)
					tt = cy + "-0" + cm + tt;
				else
					tt = cy + "-" + cm + tt;
				cm++;

				billDate[idx] = tt;
				idx++;
			}
			cm = 1;
			cy++;
		}

		cm = 1;

		for (int i = cm; i < em + 1; i++) {
			tt = "-01";
			if (cm < 10)
				tt = cy + "-0" + cm + tt;
			else
				tt = cy + "-" + cm + tt;
			cm++;

			billDate[idx] = tt;
			idx++;
		}

	} //end

	for (int i = 0; i < count; i++) {
		/* customer_count */ //2018-09-09 
		String sqlC = "insert into customer_count(userCode, c_code, c_name, c_regiDate, c_expireDate, c_plan, c_fee, c_margin, p_margin, c_billDate) values(?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmtC = conn.prepareStatement(sqlC);

		pstmtC.setString(1, userCode);
		pstmtC.setString(2, c_code);
		pstmtC.setString(3, c_name);
		pstmtC.setString(4, register);
		pstmtC.setString(5, expire);
		pstmtC.setString(6, c_plan);
		pstmtC.setString(7, c_fee);
		pstmtC.setString(8, c_margin);
		pstmtC.setString(9, p_margin);
		pstmtC.setString(10, billDate[i]);
		pstmtC.executeUpdate();

	}
%>
<%
	pstmt.close();
	conn.close();

	response.sendRedirect("adminPage.jsp");
%>