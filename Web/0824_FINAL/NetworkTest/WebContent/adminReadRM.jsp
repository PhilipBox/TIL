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

</head>
<body>

	<%
		Connection conn = DatabaseUtil.getConnection();

		%>
		
<div id="divTable">
										<FORM method="post" name="ARM_listCount" id="ARM_listCount">
												<SELECT NAME="listCount" id="listCount"
													onchange="ARM_convert_list(this.form)"
													style="border: 1px solid #000000; float: right">
													<OPTION value="0">선택</OPTION>
													<OPTION VALUE="1">10</OPTION>
													<OPTION VALUE="2">30</OPTION>
													<OPTION VALUE="3">50</OPTION>
													<OPTION VALUE="4">100</OPTION>
												</SELECT> <LABEL style="float: right">리스트 수 &nbsp;</LABEL>
											</FORM>

										<table class="table" id="ARM_table" style="width: 1200px;">
											<thead class="thead-light">
												<tr style="text-align: center;">
													<th scope="col" width="5px" nowrap
														style="text-align: center;"><input type="checkbox"
														name="ARM_index" id="ARM_index_main" value="0" /></th>
													<th scope="col" width="10px" nowrap
														style="text-align: center;">고객가입일</th>
													<th scope="col" width="10px" nowrap
														style="text-align: center;">고객해지일</th>
													<th scope="col" width="10px" nowrap
														style="text-align: center;">파트너사</th>
													<th scope="col" width="10px" nowrap
														style="text-align: center;">파트너명</th>
													<th scope="col" width="10px" style="text-align: center;">고객코드</th>
													<th scope="col" width="10px" style="text-align: center;">고객사명</th>
													<th scope="col" width="10px" style="text-align: center;">요금제</th>
													<th scope="col" width="10px" style="text-align: center;">요금</th>
													<th scope="col" width="10px" style="text-align: center;">수익금</th>
													<th scope="col" width="10px" style="text-align: center;">상태</th>
												</tr>
											</thead>
											<tbody>
												<tr>
												<%//curPage,

String scurPage_customer = request.getParameter("curPageC");
String countList_ = request.getParameter("countListC");

if(scurPage_customer==null)
	scurPage_customer="1";

int curPageC = Integer.parseInt(scurPage_customer);
int countListC = Integer.parseInt(countList_);


int curRowC= (curPageC-1)*countListC;

	// 파트너테이블
	Statement stmt_susuC = conn.createStatement();

	//실적관리 db로딩
	String sql_susuC = "select count(*) FROM CUSTOMER_list;";
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
														String sqlARM = "select t1.id, t1.c_regiDate, t1.c_expireDate, t2.userCompany, t2.userName, t1.c_code, t1.c_name, t1.c_plan, t1.c_fee, t1.c_margin, t1.c_state FROM customer_list t1, partner t2 where t1.userCode = t2.userCode order by c_regiDate" + " LIMIT " + curRowC + ", " + countListC;
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
														while (rsARM.next()) {
															String id = rsARM.getString("id");
															String billDate = rsARM.getString("c_regiDate");
															String c_expireDate = rsARM.getString("c_expireDate");
															String userCompany = rsARM.getString("userCompany");
															String userName = rsARM.getString("userName");
															String c_code = rsARM.getString("c_code");
															String c_name = rsARM.getString("c_name");
															String c_plan = rsARM.getString("c_plan");
															String c_fee = rsARM.getString("c_fee");
															String c_margin = rsARM.getString("c_margin");
															String state = rsARM.getString("c_state");

															long c_fee_long = Long.parseLong(c_fee);
															long c_margin_long = Long.parseLong(c_margin);
															
															 customerFee += c_fee_long;
																customerMargin += c_margin_long;
															

															c_fee = format.format(c_fee_long);
															c_margin = format.format(c_margin_long);

															//out.print("code "+c_code+"<br>");
													%>
												<th scope="row" width="2%"><input type="checkbox"
														class="ARM_checkSelect" id="<%=id%>" name="ARM_index"
														value=<%=id%> /></th>
													<td width="10%"><%=billDate%></td>
													<td width="10%"><%=c_expireDate%></td>
													<td width="8%"><%=userCompany%></td>
													<td width="8%"><%=userName%></td>
													<td width="7%"><INPUT type="text" name="rm<%=id%>0"
														id="<%=id%>0" size="15" value=<%=c_code%>
														readonly="readonly"
														style="border: 0 solid black; text-align: center;"></td>
													<td width="7%"><%=c_name%></td>
													<td width="7%"><%=c_plan%></td>
													<td width="7%"><INPUT type="text" name="<%=id%>1"
														id="<%=id%>1" size="7" value=<%=c_fee%>
														readonly="readonly"
														style="border: 0 solid black; text-align: center;"></td>
													<td width="5%"><INPUT type="text" name="<%=id%>2"
														id="<%=id%>2" size="7" value=<%=c_margin%>
														readonly="readonly"
														style="border: 0 solid black; text-align: center;"></td>
													<td width="7%">
															<%
																if (state.equalsIgnoreCase("used")) {
															%><img src='./img/state_used.png' /> <%
 	} else {
 %><img
															src='./img/state_none.png' /> <%
 	}
 %></td>
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
												
																
														%>
												<tr>
													<td colspan="2" style="font-weight: bold;">합계</td>
													<td colspan="6"></td>
													<td><%=fee%></td>
													<td><%=margin%></td>
													<td></td>
													<%
														//}
													%>
												
											</tfoot>
										</table>
										<div id="pagination" style=text-align:center>
										
											<div id="pagination" style="text-align: center">
											<button type='button' id="firstPage2" name="firstPage2"
												class='btn btn-default' style="visibility: hidden">
												<<</button>
											<button type='button' id="beforePage2" name="beforePage2"
												class='btn btn-default' style="visibility: hidden">
												<</button>										
										
								
												<%
													if (curPageC > 1) {

														out.print("<button type='button' onclick='readPagingRM(" + 1 + ", " + countListC
																+ ");' class='btn btn-default'><<</button>");
														//		out.print("<a href=\"?scurPage_partenr=" + 1 + "\">처음</a>");
														//out.print("<a href=\"?curPage=" + (curPage - 1) + "\">< 이전</a>");
														%>
														<script>
															spacing(0);
														</script>
														<%		
														out.print("<button type='button' onclick='readPagingRM(" + (curPageC - 1) + ", " + countListC
																+ ");' class='btn btn-default'><</button>");

														%>
														<script>
															var endPageBtn = document.getElementById("firstPage2");
															endPageBtn.style.display = "none";
		
															var nextPageBtn = document.getElementById("beforePage2");
															nextPageBtn.style.display = "none";
														</script>
														<%														
														
														
													}
													for (int i = startPageC; i < endPageC + 1; i++) {
														//out.print("<a href=\"?scurPage_partenr=" + i + "\">"+i+"</a>");
														out.print("<button type='button' onclick='readPagingRM(" + i + ", " + countListC
																+ ");' class='btn btn-default'>" + i + "</button>");
														
														%>
														<script>
															spacing(0);
														</script>
														<%														
													}
													if (curPageC < totalPageC) {
														//out.print("<a href=\"?scurPage_partenr=" + (curPage + 1) + "\">다음 ></a>");
														out.print("<button type='button' onclick='readPagingRM(" + (curPageC + 1) + ", " + countListC
																+ ");' class='btn btn-default'>></button>");
														%>
														<script>
															spacing(0);
														</script>
														<%		
														
														out.print("<button type='button' onclick='readPagingRM(" + totalPageC + ", " + countListC
																+ ");' class='btn btn-default'>>></button>");
													} else if(curPageC == endPageC) {
														%>
														<button type='button' id="nextPage2" name="nextPage2"
															class='btn btn-default' style="visibility: hidden">
															></button>
														<button type='button' id="endPage2" name="endPage2"
															class='btn btn-default' style="visibility: hidden">
															>></button>
														
														<%
													}
													
													
												%>
											</div>
									</div>
</div>



</body>
</html>
