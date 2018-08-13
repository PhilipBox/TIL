<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>APM Ajax data</title>
</head>

<body>
	<h1>APM ajax data</h1>
		<p>
<!-- APM ajax -->
		<% 
		String ajax_APM_rgs_contract_date = request.getParameter("ajax_APM_rgs_contract_date");
		String ajax_APM_rgs_company_name = request.getParameter("ajax_APM_rgs_company_name");
		String ajax_APM_rgs_partner_name = request.getParameter("ajax_APM_rgs_partner_name");
		String ajax_APM_rgs_phone_number = request.getParameter("ajax_APM_rgs_phone_number");
		String APM_register_email = request.getParameter("ajax_APM_rgs_email");
		%>
		
		
		<% 
		String ajax_APM_search_name = request.getParameter("ajax_APM_search_name");
		String ajax_APM_search_company = request.getParameter("ajax_APM_search_company");
		%>



		<% 
		String ajax_APM_table_userCode = request.getParameter("ajax_APM_table_userCode");
		String ajax_APM_table_userCompany = request.getParameter("ajax_APM_table_userCompany");
		String ajax_APM_table_userName = request.getParameter("ajax_APM_table_userName");
		String ajax_APM_table_userTel = request.getParameter("ajax_APM_table_userTel");
		String ajax_APM_table_email = request.getParameter("ajax_APM_table_email");
		String ajax_APM_table_billDate = request.getParameter("ajax_APM_table_billDate");
		String ajax_APM_table_calcul = request.getParameter("ajax_APM_table_calcul");
		String ajax_APM_table_margin = request.getParameter("ajax_APM_table_margin");
		%>




		<%
		 	System.out.println("■■■■■■■ Admin Partner Page ■■■■■■■");
			System.out.println("[등록정보]" + ajax_APM_rgs_contract_date + " " + ajax_APM_rgs_company_name + " " + ajax_APM_rgs_partner_name + " " + ajax_APM_rgs_phone_number + " " + APM_register_email );
			System.out.println("[이름 검색] " + ajax_APM_search_name +"    [회사명 검색] "+ ajax_APM_search_company);
			System.out.println("[APM 테이블 정보 ] " + ajax_APM_table_userCode + " " + ajax_APM_table_userCompany + " " + ajax_APM_table_userName + " " + ajax_APM_table_userTel + " " + ajax_APM_table_email + " " + ajax_APM_table_billDate + " " + ajax_APM_table_calcul + " " + ajax_APM_table_margin );
		%>
		
		</p>

</body>

</html>