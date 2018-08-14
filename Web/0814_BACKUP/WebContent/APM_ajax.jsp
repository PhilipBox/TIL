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
<!-- ARM ajax -->
      <% 
      String start_year = request.getParameter("start_year");
      String start_month = request.getParameter("start_month");
      String end_year = request.getParameter("end_year");
      String end_month = request.getParameter("end_month");
      %>
      
      <% 
      String ajax_bill_date = request.getParameter("ajax_bill_date");
      String ajax_ARM_partner_code = request.getParameter("ajax_ARM_partner_code");
      String ajax_ARM_partner_name = request.getParameter("ajax_ARM_partner_name");
      String ajax_ARM_rate_system = request.getParameter("ajax_ARM_rate_system");
      String ajax_ARM_contract_unit = request.getParameter("ajax_ARM_contract_unit");
      String ajax_ARM_fee = request.getParameter("ajax_ARM_fee");
      %>

      <% 
      String ajax_ARM_customer_code_for_search = request.getParameter("ajax_ARM_customer_code_for_search");
      String ajax_ARM_partner_code_for_search = request.getParameter("ajax_ARM_partner_code_for_search");
      %>
      
      <% 
      String ajax_APM_table_c_code = request.getParameter("ajax_APM_table_c_code");
      String ajax_APM_table_fee = request.getParameter("ajax_APM_table_fee");
      String ajax_APM_table_margin = request.getParameter("ajax_APM_table_margin");
      String ajax_APM_table_unpaid = request.getParameter("ajax_APM_table_unpaid");
      %>


      <%
      System.out.println("■■■■■■■ Admin Result Page ■■■■■■■");
         System.out.println("[등록정보]" + ajax_bill_date +" "+ ajax_ARM_partner_code +" "+ajax_ARM_partner_name +" "+ ajax_ARM_rate_system + " "+ ajax_ARM_contract_unit + " "+ ajax_ARM_fee);
         System.out.println("[기간검색] " + start_year +" "+ start_month +" "+end_year +" "+ end_month);
         System.out.println("[코드검색] " + ajax_ARM_partner_code_for_search + "" + ajax_ARM_customer_code_for_search);
         System.out.println("[ARM 테이블 정보] " + "요금:" +ajax_APM_table_fee +" 마진:"+ ajax_APM_table_margin +" 미수금:"+ajax_APM_table_unpaid);
         System.out.println("[PRIMARY KEY - 고객 코드] " + ajax_APM_table_c_code);
      %>
      
      </p>

</body>

</html>