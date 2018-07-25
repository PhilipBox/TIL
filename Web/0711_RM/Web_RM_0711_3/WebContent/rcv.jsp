<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    </head>
    <body>
    
   
        <h1>전달받은 데이터</h1>
        <ul>
            <li>계산서발행일 : <%= request.getParameter("bill_date") %></li>
            <li>고객사명 : <%= request.getParameter("company_name") %></li>
            <li>요금제 : <%= request.getParameter("rate_system") %></li>
            <li>계약단위 : <%= request.getParameter("contract_unit") %></li>
            <li>요금 : <%= request.getParameter("fee") %></li>
        </ul>
        
        
        
                <h1>전달받은 데이터2</h1>
        <ul>
            <li>시작날짜 : <%= request.getParameter("start_year") %>년 <%= request.getParameter("start_month") %> 월 </li>
            <li>종료날짜 : <%= request.getParameter("end_year") %>년 <%= request.getParameter("start_month") %> 월 </li>
        </ul>
        
        
        
    </body>
</html>