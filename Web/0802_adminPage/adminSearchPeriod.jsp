<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="util.DatabaseUtil"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("utf-8"); %>

<% response.setContentType("text/html; charset=utf-8"); %>

<html>

<head>

<title>JSP Example</title>

</head>



<body>

<%
	Connection conn = DatabaseUtil.getConnection();
	//out.print("db 연결 정보 " + conn);
/*
 String start_year = request.getParameter("start_year");
 String start_month = request.getParameter("start_month");
 String end_year = request.getParameter("end_year");
 String end_month = request.getParameter("end_month");
 

 String startDate = start_year+"/"+start_month+"/01";
 String endDate = end_year+"/"+end_month+"/01";
*/

PreparedStatement pstmt=null;

 String startDate = request.getParameter("startDate");
 String endDate = request.getParameter("endDate");

 String customer_code = request.getParameter("customer_code");
 String partner_code = request.getParameter("partner_code");

 String sql;
 
 if(customer_code.equals("")&& partner_code.equals("")){
	 //기간만
	 sql = "select t2.userCode, t1.c_billDate, t2.userCompany, t2.userName, t1.c_code, t1.c_name, t1.c_name, t1.c_plan, t1.c_calcul, t1.c_fee, t1.c_margin, t1.c_unpaid FROM customer as t1 join partner as t2 on t1.userCode = t2.userCode and DATE(t1.c_billDate) between ? and ? order by c_billDate";
	 


	  pstmt = conn.prepareStatement(sql);
	 
	 pstmt.setString(1, startDate);
	 pstmt.setString(2, endDate);
	
 
 
 }
 else{
	 //파트너
	 if(!partner_code.equals("")){
		 //파트너만
		 if(startDate.equals("")&& startDate.equals("")){
			 sql = "select t2.userCode, t1.c_billDate, t2.userCompany, t2.userName, t1.c_code, t1.c_name, t1.c_name, t1.c_plan, t1.c_calcul, t1.c_fee, t1.c_margin, t1.c_unpaid FROM customer as t1 join partner as t2 on t1.userCode = t2.userCode and t1.userCode=? order by c_billDate";

			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, partner_code);
		 } 
		 else{ //파트너+기간
			 //and t1.userCode="PKC222" order by c_billDate
			 sql = "select t2.userCode, t1.c_billDate, t2.userCompany, t2.userName, t1.c_code, t1.c_name, t1.c_name, t1.c_plan, t1.c_calcul, t1.c_fee, t1.c_margin, t1.c_unpaid FROM customer as t1 join partner as t2 on t1.userCode = t2.userCode and (DATE(t1.c_billDate) between ? and ?) and t1.userCode=? order by c_billDate";


			  pstmt = conn.prepareStatement(sql);
			 
			 pstmt.setString(1, startDate);
			 pstmt.setString(2, endDate);
			 pstmt.setString(3, partner_code);
		 }
	 } //고객
	 else if (!customer_code.equals("")){
		 //고객만
		 if(startDate.equals("")&& startDate.equals("")){
			 //and t1.c_code="PKC222-CK004"
			 sql = "select t2.userCode, t1.c_billDate, t2.userCompany, t2.userName, t1.c_code, t1.c_name, t1.c_name, t1.c_plan, t1.c_calcul, t1.c_fee, t1.c_margin, t1.c_unpaid FROM customer as t1 join partner as t2 on t1.userCode = t2.userCode and t1.c_code=? order by c_billDate";

			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, customer_code);
		 }
		 else{ //고객+기간
			 sql = "select t2.userCode, t1.c_billDate, t2.userCompany, t2.userName, t1.c_code, t1.c_name, t1.c_name, t1.c_plan, t1.c_calcul, t1.c_fee, t1.c_margin, t1.c_unpaid FROM customer as t1 join partner as t2 on t1.userCode = t2.userCode and (DATE(t1.c_billDate) between ? and ?) and t1.c_code=? order by c_billDate";


			  pstmt = conn.prepareStatement(sql);
			 
			 pstmt.setString(1, startDate);
			 pstmt.setString(2, endDate);
			 pstmt.setString(3, customer_code);
		 }
	 
	 }
	 
	 
 }

 
 
// if(c.equals("")) out.print("2");
	
/*
if(customer_code.equals("")&& partner_code.equals(""))
	 sql = "select t1.c_billDate, t2.userCompany, t2.userName, t1.c_code, t1.c_name, t1.c_name, t1.c_plan, t1.c_calcul, t1.c_fee, t1.c_margin, t1.c_unpaid FROM customer as t1 join partner as t2 on t1.userCode = t2.userCode and DATE(t1.c_billDate) between ? and ? order by c_billDate";
else if()
*/
		 /*
 start_year : $('#start_year').val(),
				start_month : $('#start_month').val(),
				end_year : $('#end_year').val(),
				end_month : $('#end_month').val(),
				customer_code : $(
						'#customer_code').val(),
				partner_code : $(
						'#partner_code').val(),
 */
	


	//ARM db로딩
	 //sql = "select t1.c_billDate, t2.userCompany, t2.userName, t1.c_code, t1.c_name, t1.c_name, t1.c_plan, t1.c_calcul, t1.c_fee, t1.c_margin, t1.c_unpaid FROM customer as t1 join partner as t2 on t1.userCode = t2.userCode and DATE(t1.c_billDate) between ? and ? order by c_billDate";


	 //PreparedStatement pstmt = conn.prepareStatement(sql);
	 
// pstmt.setString(1, startDate);
	// pstmt.setString(2, endDate);
	
	 
	 ResultSet rsARM = null;
		rsARM = pstmt.executeQuery();
%>

<div id="divTable">

				<table class="table" id="ARM_table" style="width: 1100px;">
					<thead class="thead-light">
						<tr style="text-align: center;">
							<th scope="col" width="5px" nowrap style="text-align: center;"><input
								type="checkbox" name="ARM_index" id="ARM_index_main" value="0" /></th>
							<th scope="col" width="10px" nowrap style="text-align: center;">계산서발행일</th>
							<th scope="col" width="10px" nowrap style="text-align: center;">파트너사</th>
							<th scope="col" width="10px" nowrap style="text-align: center;">파트너명</th>
							<th scope="col" width="10px" style="text-align: center;">고객코드</th>
							<th scope="col" width="10px" style="text-align: center;">고객사명</th>
							<th scope="col" width="10px" style="text-align: center;">요금제</th>
							<th scope="col" width="10px" style="text-align: center;">정산주기</th>
							<th scope="col" width="10px" style="text-align: center;">요금</th>
							<th scope="col" width="10px" style="text-align: center;">마진</th>
							<th scope="col" width="10px" style="text-align: center;">미납금</th>
						</tr>
					</thead>
					<tbody>
						<tr>

							<%
								while (rsARM.next()) {
									String id = rsARM.getString("c_code");
									String billDate = rsARM.getString("c_billDate");
									String userCompany = rsARM.getString("userCompany");
									String userName = rsARM.getString("userName");
									String c_code = rsARM.getString("c_code");
									String c_name = rsARM.getString("c_name");
									String c_plan = rsARM.getString("c_plan");
									String c_calcul = rsARM.getString("c_calcul");
									String c_fee = rsARM.getString("c_fee");
									String c_margin = rsARM.getString("c_margin");
									String c_unpaid = rsARM.getString("c_unpaid");

									//out.print("code "+c_code+"<br>");
							%>
							<th scope="row" width="2%"><input type="checkbox"
								class="ARM_checkSelect" id="<%=id%>" name="ARM_index"
								value=<%=id%> /></th>
							<td width="5%"><%=billDate%></td>
							<td width="8%"><%=userCompany%></td>
							<td width="8%"><%=userName%></td>
							<td width="7%"><INPUT type="text" name="rm<%=id%>0"
								id="<%=id%>0" size="7" value=<%=c_code%> readonly="readonly"
								style="border: 0 solid black; text-align: center;"></td>
							<td width="7%"><%=c_name%></td>
							<td width="7%"><%=c_plan%></td>
							<td width="8%"><%=c_calcul%></td>
							<td width="7%"><INPUT type="text" name="<%=id%>1"
								id="<%=id%>1" size="7" value=<%=c_fee%> readonly="readonly"
								style="border: 0 solid black; text-align: center;"></td>
							<td width="5%"><INPUT type="text" name="<%=id%>2"
								id="<%=id%>2" size="7" value=<%=c_margin%> readonly="readonly"
								style="border: 0 solid black; text-align: center;"></td>
							<td width="7%"><INPUT type="text" name="<%=id%>3"
								id="<%=id%>3" size="7" value=<%=c_unpaid%> readonly="readonly"
								style="border: 0 solid black; text-align: center;"></td>
						</tr>
						<%
							}
						%>

					</tbody>
				</table>
			</div>

<%
pstmt.close();
conn.close();
%>


</body>

</html>