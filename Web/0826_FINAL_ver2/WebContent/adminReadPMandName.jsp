<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%


String startDate = request.getParameter("startDate");
String endDate = request.getParameter("endDate");
String customer_code = request.getParameter("customer_code");
String partner_code = request.getParameter("partner_code");

String curPageP = request.getParameter("curPageC");
String countList = request.getParameter("countList");


%>

<div id="divTableP">

<p> name </p>
<p> startDate : <%=startDate %> </p>
<p> endDate : <%=endDate %> </p>
<p> customer_code : <%=customer_code %> </p>
<p> partner_code : <%=partner_code %> </p>

<p> curPageP : <%=curPageP %> </p>
<p> countList : <%=countList %> </p>

</div>

</body>
</html>