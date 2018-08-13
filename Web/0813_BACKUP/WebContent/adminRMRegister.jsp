<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="util.DatabaseUtil"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.text.*" %> 
<%@ page import="java.math.*" %> 

<%
   request.setCharacterEncoding("utf-8"); 
   response.setContentType("text/html; charset=utf-8");
%>
<%
   Connection conn = DatabaseUtil.getConnection();
   out.print("db 연결 정보 " + conn + "<br>");

	String ajax_bill_date = request.getParameter("ajax_bill_date");
	String c_bill_date = ajax_bill_date.substring(0,4) + "/" + ajax_bill_date.substring(4,6) + "/" + ajax_bill_date.substring(6,8);
	
	String userCode = request.getParameter("ajax_ARM_partner_code");
	String c_name = request.getParameter("ajax_ARM_partner_name");
	String c_plan_index = request.getParameter("ajax_ARM_rate_system");
	String c_calcul_index = request.getParameter("ajax_ARM_contract_unit");
	String c_fee_comma = request.getParameter("ajax_ARM_fee");
  
	String p_margin = request.getParameter("p_margin");
	
	String c_calcul;
	String c_plan;
	
	if (c_plan_index.equals("1"))
	{
		c_plan = "Basic";
	}
	else if ( c_plan_index.equals("2"))
	{
		c_plan = "Standard";
	}
	else if ( c_plan_index.equals("3"))
	{
		c_plan = "Professional";
	}
	else {
		c_plan = "Custom";
	}
		
	
	if (c_calcul_index.equals("1"))
	{
		c_calcul = "3개월";
	}
	else if ( c_calcul_index.equals("2"))
	{
		c_calcul = "6개월";
	}
	else
	{
		c_calcul = "1년";
	}
	
	
	
	
	
	// 요금,마진,미수금 : 30%계산 및 형변환 부분
	
	c_fee_comma = c_fee_comma.replaceAll(",","");
    long c_fee_temp = Long.parseLong(c_fee_comma);
    
    long p_marginLong = Long.parseLong(p_margin);
    
    double c_margin_temp = c_fee_temp*p_marginLong*0.01;
    double c_unpaid_temp = c_fee_temp*p_marginLong*0.01;
    
	long c_margin_cut = (long)Math.floor(c_margin_temp);
	long c_unpaid_cut = (long)Math.floor(c_margin_temp);

	String c_fee = Long.toString(c_fee_temp);
	String c_margin = Long.toString(c_margin_cut);
	String c_unpaid = Long.toString(c_margin_cut);
    // 요금,마진,미수금 : 30%계산 및 형변환 부분 - END 
    
   	String c_code = "PKC222-ABC249";	// 이게 priamry key인데, 아직은 할당하는 알고리즘이 읎어서.... 한번 추가할때마다 숫자 바꿔줘야행
   
   String sql = "insert into customer(userCode, c_code, c_name, c_billDate, c_plan, c_calcul, c_fee, c_margin, c_unpaid, p_margin) values(?,?,?,?,?,?,?,?,?,?)";
   PreparedStatement pstmt = conn.prepareStatement(sql);

   pstmt.setString(1, userCode);
   pstmt.setString(2, c_code);
   pstmt.setString(3, c_name);
   pstmt.setString(4, c_bill_date);
   pstmt.setString(5, c_plan);
   pstmt.setString(6, c_calcul);
   pstmt.setString(7, c_fee);
   pstmt.setString(8, c_margin);
   pstmt.setString(9, c_unpaid);
   pstmt.setString(10, p_margin);
   pstmt.executeUpdate();
%>
<%
   pstmt.close();
   conn.close();

   response.sendRedirect("adminPage.jsp");
%>