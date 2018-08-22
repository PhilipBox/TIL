<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="util.DatabaseUtil"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
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

	alert("adminReadRM" + curPage+" / "+countList);
	$.ajax({
		type : "post",
		url : "./partnerReadRM.jsp",
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

		System.out.println("전체 검색");
	
	
		%>
		
<div id="divTable">
											<FORM method="post" name="PRM_listCount" id="PRM_listCount">
												<SELECT NAME="listCount" id="listCount"
													onchange="PRM_convert_list(this.form)" style="border: 1px solid #000000; float:right ">
													<OPTION value="0">선택</OPTION>
													<OPTION VALUE="1">10</OPTION>
													<OPTION VALUE="2">30</OPTION>
													<OPTION VALUE="3">50</OPTION>
													<OPTION VALUE="4">100</OPTION>
												</SELECT>
												<LABEL style="float:right ">리스트 수 &nbsp;</LABEL>
											</FORM>


											<table class="table" id="PRM_table" style="width: 1000px">
												<thead class="thead-light">
													<tr>
														<th scope="col" width="20px" nowrap
															style="text-align: center;">고객가입일</th>
														<th scope="col" width="15px" nowrap
															style="text-align: center;">고객코드</th>
														<th scope="col" width="15px" nowrap
															style="text-align: center;">고객사명</th>
														<th scope="col" width="15px" style="text-align: center;">요금제</th>
														<th scope="col" width="10px" style="text-align: center;">요금</th>
														<th scope="col" width="10px" style="text-align: center;">수익금</th>
														<th scope="col" width="10px" style="text-align: center;">상태</th>
													</tr>
												</thead>
												<tbody>
												
												
												
												
													<tr>
													
													
													<%
													String scurPage_customer = request.getParameter("curPageC"); // curPage : 현재 페이지
													String countList_ = request.getParameter("countListC"); // curPage : 현재 페이지

													//int countListC = 10;
													//들어가는 row의 수
													
													if (scurPage_customer == null)
														scurPage_customer = "1";
													
													
													int curPageC = Integer.parseInt(scurPage_customer);
													int countListC = Integer.parseInt(countList_);
													
													int curRowC = (curPageC - 1) * countListC;
													// 현재 페이지의 가장 첫 번째 row
													
													
													String userCodeInitRM = (String) session.getAttribute("userCodeDB");
													Statement stmt_susuC = conn.createStatement();
													//실적관리 db로딩
													String sql_susuC = "select count(*) FROM customer_list where userCode = \"" + userCodeInitRM +"\"";
													// 파트너가 없는 customer가 있으면 안된다! ! ! count에 오류가 생길 수 있음.

													stmt_susuC.executeQuery(sql_susuC);
													ResultSet rs_susuC = null;
													rs_susuC = stmt_susuC.executeQuery(sql_susuC);
													rs_susuC.next();
													
													%>
													
													
													
														<!-- 기존 파트너 페이지 실적관리 DB table -->											
														<%
															
															String sqlRM = "select * from customer_list where userCode =? order by c_regiDate LIMIT " + curRowC + ", " + countListC;        
														
															PreparedStatement pstmtRM = conn.prepareStatement(sqlRM);
															pstmtRM.setString(1, userCodeInitRM);
															ResultSet rsRM = null;
															rsRM = pstmtRM.executeQuery();
														
														
														
														%>
														
														<%
														int countPageC = 5;	// 페이지의 수 
														int totalCountC = rs_susuC.getInt("count(*)");
															//totalCount : DB에잇는 총 row의 수 
															
														int totalPageC = totalCountC / countListC;
															// totalPage : 전체 row를 기준이 되는 수만큼 나눈 것으로, 전체 page의 수가 된다.
															
														if (totalCountC % countListC > 0)
															totalPageC++;
															// 전체 row의 수가 0으로 나누어 떨어지지 않으면, 나머지를 담아놓을 page를 하나 추가.
															
															
															
														
															
														// >> 버튼을 누르면 +10페이지를 하게된다고 가정했을 때, 그 때  마지막 페이지가 +10한것보다 작을 수 있으니.
														if (totalPageC < curPageC) {
															curPageC = totalPageC;
														}
															
														// 1~5 , 6~10 << 여기서의 start / end를 말하는 것
														int startPageC = ((curPageC - 1) / countPageC) * countPageC + 1;
														int endPageC = startPageC + countPageC - 1;
														
														if (endPageC > totalPageC)
															endPageC = totalPageC;	
														// 6~10인데, 마지막 페이지가 7까지 있으면 endPage를 7로 하겠다는 것.
	
													%>
														
														
														<%
														long customerFee = 0;
														long customerMargin = 0;
														long customerUnpaid = 0;
															while (rsRM.next()) {

																String PRM_id = rsRM.getString("id");
																String billDate = rsRM.getString("c_regiDate");
																String companyCode = rsRM.getString("c_code");
																String companyName = rsRM.getString("c_name");
																String plan = rsRM.getString("c_plan");
																String fee = rsRM.getString("c_fee");
																String margin = rsRM.getString("c_margin");
																String unpaid = rsRM.getString("c_state");

																long c_fee_long = Long.parseLong(fee);
																long c_margin_long = Long.parseLong(margin);

																customerFee += c_fee_long;
																customerMargin += c_margin_long;
																
																fee = format.format(c_fee_long);
																margin = format.format(c_margin_long);

																PRM_id = "PRM" + PRM_id + "_";
														%>
														<td width="10%"><%=billDate%></td>
														<td width="15%"><INPUT type="text"
															name="<%=PRM_id%>0" id="<%=PRM_id%>0" size="25"
															value=<%=companyCode%> readonly="readonly"
															style="border: 0 solid black; text-align: center;"></td>
														<td width="15%"><%=companyName%></td>
														<td width="15%"><%=plan%></td>
														<td width="15%"><INPUT type="text"
															name="<%=PRM_id%>1" id="<%=PRM_id%>1" size="7"
															value=<%=fee%> readonly="readonly"
															style="border: 0 solid black; text-align: center;"></td>

														<td width="15%"><INPUT type="text"
															name="<%=PRM_id%>2" id="<%=PRM_id%>2" size="7"
															value=<%=margin%> readonly="readonly"
															style="border: 0 solid black; text-align: center;"></td>
														<td width="15%"><INPUT type="text"
															name="<%=PRM_id%>3" id="<%=PRM_id%>3" size="7"
															value=<%=unpaid%> readonly="readonly"
															style="border: 0 solid black; text-align: center;"></td>

													</tr>
													<%
														}
													%>

												</tbody>
												<tfoot>
													<%
													String fee, margin, unpaid;

													fee = format.format(customerFee);
													margin = format.format(customerMargin);
												%>
													<tr>
														<td colspan="1" style="font-weight: bold;">합계</td>
														<td colspan="3"></td>
														<td><%=fee%></td>
														<td><%=margin%></td>
														<td></td>
														<%
															
														%>
													
												</tfoot>
											</table>
										
										<div id="pagination" style="text-align: center">
										

											<button type='button' id="firstPage" name="firstPage"
												class='btn btn-default' style="visibility: hidden">
												<<</button>
											<button type='button' id="beforePage" name="beforePage"
												class='btn btn-default' style="visibility: hidden">
												<</button>
											<%
												if (curPageC > 1) {
													// 현재 페이지가 가장 첫번째 페이지가 아닐 경우, 이전으로 가는 버튼 생성
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
															var endPageBtn = document.getElementById("firstPage");
															endPageBtn.style.display = "none";
		
															var nextPageBtn = document.getElementById("beforePage");
															nextPageBtn.style.display = "none";
														</script>
													<%
												}
												for (int i = startPageC; i < endPageC + 1; i++) { 	// i 는 현재 페이지의 번호
													// 1~5, 6~10의 버튼들을 생성하는 부분
													
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
													// 
													
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
													<button type='button' id="nextPage" name="nextPage"
														class='btn btn-default' style="visibility: hidden">
														></button>
													<button type='button' id="endPage" name="endPage"
														class='btn btn-default' style="visibility: hidden">
														>></button>
													
													<%
												}

											%>
										</div>
											
											
											
											
											
										</div>




</body>
</html>
