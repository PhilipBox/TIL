<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="util.DatabaseUtil"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>

<% 
Connection conn = DatabaseUtil.getConnection();
out.print("db 연결 정보 "+conn);

Statement stmt = conn.createStatement();

String sql = "select * from TESTPROFILE";
stmt.executeQuery(sql);

ResultSet rs = null;

rs = stmt.executeQuery(sql);


if(rs.next()){
	do{
	out.print("<br>");
	out.print(rs.getString("userCode")+"<br>");
	out.print(rs.getString("userCompany")+"<br>");
	out.print(rs.getString("userName")+"<br>");
	out.print(rs.getString("userPhone")+"<br>");
	}while(rs.next());
	}else {
	out.print("결과X");
}


%>