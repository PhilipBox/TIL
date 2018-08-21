<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Ajax data</title>
</head>

<body>
	<h1>APM ajax data</h1>
		<p>
<!-- APM ajax -->
		<% 
		
		
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String userCode = request.getParameter("userCode");
		String customer_code = request.getParameter("customer_code");
		String customer_name = request.getParameter("customer_name");
		%>
		

		<%
		 	System.out.println("■■■■■■■ Ajax Data Test ■■■■■■■");
			System.out.println("[전송받은 DATA]" + startDate + " // " + endDate + " // " + userCode + " // " + customer_code + " // " + customer_name);
		%>
		
		</p>

</body>

</html>