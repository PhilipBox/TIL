<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="util.DatabaseUtil"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.text.*"%>
<%
	DecimalFormat format = new DecimalFormat("###,###");
%>
<%
	request.setCharacterEncoding("utf-8");
%>

<%
	response.setContentType("text/html; charset=utf-8");
%>


<html>
<head>
<title></title>

<script>
function readPagingRM(curPage, countList) {

	alert("adminReadRM"+curPage+" / "+countList);
	$.ajax({
		type : "post",
		url : "./adminReadRM.jsp",
		data : {
			curPageC : curPage,
			countListC : countList

		},
		success : ssSuccess,
		error : ssError
	});
	
}
function ssSuccess(resdata){
    $("#divTable").html(resdata);
    console.log(resdata);
}
function ssError(){
    alert("Error");
}

</script>
</head>
<body>

	<%
		Connection conn = DatabaseUtil.getConnection();

		%>
		
<div id="divTable">
										<div style="margin: 5px">
											<h3 style="display: inline-block; margin-right: 10px;">내역</h3>

											<button
												style="display: inline-block; vertical-align: baseline;"
												class="btn" onclick="totalTable();">전체</button>

											<button id="currentMonth" class="btn" name="currentMonth"
												style="display: inline-block; vertical-align: baseline;"
												onclick="currentMonthFunction();">이번달</button>
											<button id="preMonth" name="preMonth" class="btn"
												style="display: inline-block; vertical-align: baseline;"
												onclick="preMonthFunction();">지난달</button>
										</div>
										<table class="table" id="ARM_table" style="width: 1200px;">
											<thead class="thead-light">
												<tr style="text-align: center;">
													<th scope="col" width="5px" nowrap
														style="text-align: center;"><input type="checkbox"
														name="ARM_index" id="ARM_index_main" value="0" /></th>
													<th scope="col" width="10px" nowrap
														style="text-align: center;">계산서발행일</th>
													<th scope="col" width="10px" nowrap
														style="text-align: center;">파트너사</th>
													<th scope="col" width="10px" nowrap
														style="text-align: center;">파트너명</th>
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
												<%//curPage,

String scurPage_customer = request.getParameter("curPageC");
int countListC = Integer.parseInt(request.getParameter("countListC"));

//out.print("adminReadRM.jsp : "+ scurPage_customer+" / "+countListC);

if(scurPage_customer==null)
	scurPage_customer="1";
int curPageC = Integer.parseInt(scurPage_customer);

int curRowC= (curPageC-1)*countListC;

	// 파트너테이블
	Statement stmt_susuC = conn.createStatement();

	//실적관리 db로딩
	String sql_susuC = "select count(*) FROM CUSTOMER;";
	stmt_susuC.executeQuery(sql_susuC);
	ResultSet rs_susuC = null;
	rs_susuC = stmt_susuC.executeQuery(sql_susuC);
	rs_susuC.next();
%>	
													<%
														// 파트너테이블
														Statement stmtARM = conn.createStatement();

														//ARM db로딩
														//t1 : customer / t2 : partner
														String sqlARM = "select t1.c_billDate, t2.userCompany, t2.userName, t1.c_code, t1.c_name, t1.c_name, t1.c_plan, t1.c_calcul, t1.c_fee, t1.c_margin, t2. margin, t1.c_unpaid FROM customer t1, partner t2 where t1.userCode = t2.userCode order by c_billDate"+" LIMIT "+curRowC+", "+countListC;
														stmtARM.executeQuery(sqlARM);
														ResultSet rsARM = null;
														rsARM = stmtARM.executeQuery(sqlARM);
													%>
													
																										
<%
	int countPageC = 5;
	int totalCountC = rs_susuC.getInt("count(*)");
	
	int totalPageC = totalCountC / countListC;

	
	if (totalCountC % countListC > 0) totalPageC++;
	if (totalPageC < curPageC) {

		curPageC = totalPageC;

	}
	
	int startPageC = ((curPageC - 1) / countPageC) * countPageC + 1;
	
	int endPageC = startPageC + countPageC -1;

	if (endPageC > totalPageC) endPageC = totalPageC;

	
%>

													<%
													long customerFee = 0;
													long customerMargin = 0;
													long customerUnpaid = 0;
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
															String p_margin = rsARM.getString("margin");

															long c_fee_long = Long.parseLong(c_fee);
															long c_margin_long = Long.parseLong(c_margin);
															long c_unpaid_long = Long.parseLong(c_unpaid);
															
															 customerFee += c_fee_long;
																customerMargin += c_margin_long;
																customerUnpaid += c_unpaid_long;
															

															c_fee = format.format(c_fee_long);
															c_margin = format.format(c_margin_long);
															c_unpaid = format.format(c_unpaid_long);

															//out.print("code "+c_code+"<br>");
													%>
													<th scope="row" width="2%"><input type="checkbox"
														class="ARM_checkSelect" id="<%=id%>" name="ARM_index"
														value=<%=id%> /></th>
													<td width="5%"><%=billDate%></td>
													<td width="8%"><%=userCompany%></td>
													<td width="8%"><%=userName%></td>
													<td width="7%"><INPUT type="text" name="rm<%=id%>0"
														id="<%=id%>0" size="15" value=<%=c_code%>
														readonly="readonly"
														style="border: 0 solid black; text-align: center;"></td>
													<td width="7%"><%=c_name%></td>
													<td width="7%"><%=c_plan%></td>
													<td width="8%"><%=c_calcul%></td>
													<td width="7%"><INPUT type="text" name="<%=id%>1"
														id="<%=id%>1" size="7" value=<%=c_fee%>
														readonly="readonly"
														style="border: 0 solid black; text-align: center;"></td>
													<td width="5%"><INPUT type="text" name="<%=id%>2"
														id="<%=id%>2" size="7" value=<%=c_margin%>
														readonly="readonly"
														style="border: 0 solid black; text-align: center;"></td>
													<td width="7%"><INPUT type="text" name="<%=id%>3"
														id="<%=id%>3" size="7" value=<%=c_unpaid%>
														readonly="readonly"
														style="border: 0 solid black; text-align: center;"></td>
												</tr>
												<%
													}
												%>

											</tbody>

											<tfoot>

												<%
												String fee,margin,unpaid;
												
												fee = format.format(customerFee); 
												margin = format.format(customerMargin); 
												unpaid = format.format(customerUnpaid); 
												
																
														%>
												<tr>
													<td colspan="2" style="font-weight: bold;">합계</td>
													<td colspan="6"></td>
													<td><%=fee%></td>
													<td><%=margin%></td>
													<td><%=unpaid%></td>
													<%
														//}
													%>
												
											</tfoot>
										</table>
										<div id="pagination" style=text-align:center>
												<%
													if (curPageC > 1) {

														out.print("<button type='button' onclick='readPagingRM(" + 1 + ", " + countListC
																+ ");' class='btn btn-default'> << 처음</button>");
														//		out.print("<a href=\"?scurPage_partenr=" + 1 + "\">처음</a>");
														//out.print("<a href=\"?curPage=" + (curPage - 1) + "\">< 이전</a>");
														out.print("<button type='button' onclick='readPagingRM(" + (curPageC - 1) + ", " + countListC
																+ ");' class='btn btn-default'>< 이전</button>");

													}
													for (int i = startPageC; i < endPageC + 1; i++) {
														//out.print("<a href=\"?scurPage_partenr=" + i + "\">"+i+"</a>");
														out.print("<button type='button' onclick='readPagingRM(" + i + ", " + countListC
																+ ");' class='btn btn-default'>" + i + "</button>");
													}
													if (curPageC < totalPageC) {
														//out.print("<a href=\"?scurPage_partenr=" + (curPage + 1) + "\">다음 ></a>");
														out.print("<button type='button' onclick='readPagingRM(" + (curPageC + 1) + ", " + countListC
																+ ");' class='btn btn-default'> > 다음</button>");

													}
													if (endPageC < totalPageC){
														//out.print("<a href=\"?scurPage_partenr=" + totalPage + "\">끝</a>");
														out.print("<button type='button' onclick='readPagingRM(" + totalPageC + ", " + countListC
																+ ");' class='btn btn-default'> >> 끝</button>");
													}
												%>
											</div>
									</div>




</body>
</html>
