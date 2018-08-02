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

	String ajax_contDate = request.getParameter("ajax_APM_rgs_contract_date");
	String contDate = ajax_contDate.substring(0,4) + "/" + ajax_contDate.substring(4,6) + "/" + ajax_contDate.substring(6,8);

	String userCompany = request.getParameter("ajax_APM_rgs_company_name");
	String userName = request.getParameter("ajax_APM_rgs_partner_name");
	String userTel = request.getParameter("ajax_APM_rgs_phone_number");
	String userEmail = request.getParameter("ajax_APM_rgs_email");
    
	// 아래서부터는 받아오지 않은 정보들이지만 NOT NULL에 디폴트값이 없어서 넣어줘야하는 값들.
   	String userCode = "PKC503";	// 이게 priamry key인데, 아직은 할당하는 알고리즘이 읎어서.... 한번 추가할때마다 숫자 바꿔줘야행
   	String userPassword = "0000";
   	String userRegion = "KOREA";
   	String userType = "USER";
   	
   	
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
   	
   	
   String sql = "insert into partner(userCode, userName, userEmail, userPassword, userCompany, userTel, contDate, userRegion, userType) values(?,?,?,?,?,?,?,?,?)";
   PreparedStatement pstmt = conn.prepareStatement(sql);

   pstmt.setString(1, userCode);
   pstmt.setString(2, userName);
   pstmt.setString(3, userEmail);
   pstmt.setString(4, userPassword);
   pstmt.setString(5, userCompany);
   pstmt.setString(6, userTel);
   pstmt.setString(7, contDate);
   pstmt.setString(8, userRegion);
   pstmt.setString(9, userType);
   pstmt.executeUpdate();
%>
<%
   pstmt.close();
   conn.close();

   response.sendRedirect("adminPage.jsp");
%>