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

		System.out.println("��ü �˻�");
	
	
		%>
		
<div id="divTable">
											<FORM method="post" name="PRM_listCount" id="PRM_listCount">
												<SELECT NAME="listCount" id="listCount"
													onchange="PRM_convert_list(this.form)" style="border: 1px solid #000000; float:right ">
													<OPTION value="0">����</OPTION>
													<OPTION VALUE="1">10</OPTION>
													<OPTION VALUE="2">30</OPTION>
													<OPTION VALUE="3">50</OPTION>
													<OPTION VALUE="4">100</OPTION>
												</SELECT>
												<LABEL style="float:right ">����Ʈ �� &nbsp;</LABEL>
											</FORM>


											<table class="table" id="PRM_table" style="width: 1000px">
												<thead class="thead-light">
													<tr>
														<th scope="col" width="20px" nowrap
															style="text-align: center;">��������</th>
														<th scope="col" width="15px" nowrap
															style="text-align: center;">���ڵ�</th>
														<th scope="col" width="15px" nowrap
															style="text-align: center;">�����</th>
														<th scope="col" width="15px" style="text-align: center;">�����</th>
														<th scope="col" width="10px" style="text-align: center;">���</th>
														<th scope="col" width="10px" style="text-align: center;">���ͱ�</th>
														<th scope="col" width="10px" style="text-align: center;">����</th>
													</tr>
												</thead>
												<tbody>
												
												
												
												
													<tr>
													
													
													<%
													String scurPage_customer = request.getParameter("curPageC"); // curPage : ���� ������
													String countList_ = request.getParameter("countListC"); // curPage : ���� ������

													//int countListC = 10;
													//���� row�� ��
													
													if (scurPage_customer == null)
														scurPage_customer = "1";
													
													
													int curPageC = Integer.parseInt(scurPage_customer);
													int countListC = Integer.parseInt(countList_);
													
													int curRowC = (curPageC - 1) * countListC;
													// ���� �������� ���� ù ��° row
													
													
													String userCodeInitRM = (String) session.getAttribute("userCodeDB");
													Statement stmt_susuC = conn.createStatement();
													//�������� db�ε�
													String sql_susuC = "select count(*) FROM customer_list where userCode = \"" + userCodeInitRM +"\"";
													// ��Ʈ�ʰ� ���� customer�� ������ �ȵȴ�! ! ! count�� ������ ���� �� ����.

													stmt_susuC.executeQuery(sql_susuC);
													ResultSet rs_susuC = null;
													rs_susuC = stmt_susuC.executeQuery(sql_susuC);
													rs_susuC.next();
													
													%>
													
													
													
														<!-- ���� ��Ʈ�� ������ �������� DB table -->											
														<%
															
															String sqlRM = "select * from customer_list where userCode =? order by c_regiDate LIMIT " + curRowC + ", " + countListC;        
														
															PreparedStatement pstmtRM = conn.prepareStatement(sqlRM);
															pstmtRM.setString(1, userCodeInitRM);
															ResultSet rsRM = null;
															rsRM = pstmtRM.executeQuery();
														
														
														
														%>
														
														<%
														int countPageC = 5;	// �������� �� 
														int totalCountC = rs_susuC.getInt("count(*)");
															//totalCount : DB���մ� �� row�� �� 
															
														int totalPageC = totalCountC / countListC;
															// totalPage : ��ü row�� ������ �Ǵ� ����ŭ ���� ������, ��ü page�� ���� �ȴ�.
															
														if (totalCountC % countListC > 0)
															totalPageC++;
															// ��ü row�� ���� 0���� ������ �������� ������, �������� ��Ƴ��� page�� �ϳ� �߰�.
															
															
															
														
															
														// >> ��ư�� ������ +10�������� �ϰԵȴٰ� �������� ��, �� ��  ������ �������� +10�Ѱͺ��� ���� �� ������.
														if (totalPageC < curPageC) {
															curPageC = totalPageC;
														}
															
														// 1~5 , 6~10 << ���⼭�� start / end�� ���ϴ� ��
														int startPageC = ((curPageC - 1) / countPageC) * countPageC + 1;
														int endPageC = startPageC + countPageC - 1;
														
														if (endPageC > totalPageC)
															endPageC = totalPageC;	
														// 6~10�ε�, ������ �������� 7���� ������ endPage�� 7�� �ϰڴٴ� ��.
	
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
														<td colspan="1" style="font-weight: bold;">�հ�</td>
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
													// ���� �������� ���� ù��° �������� �ƴ� ���, �������� ���� ��ư ����
													out.print("<button type='button' onclick='readPagingRM(" + 1 + ", " + countListC
															+ ");' class='btn btn-default'><<</button>");
													//		out.print("<a href=\"?scurPage_partenr=" + 1 + "\">ó��</a>");
													//out.print("<a href=\"?curPage=" + (curPage - 1) + "\">< ����</a>");
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
												for (int i = startPageC; i < endPageC + 1; i++) { 	// i �� ���� �������� ��ȣ
													// 1~5, 6~10�� ��ư���� �����ϴ� �κ�
													
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
													
													//out.print("<a href=\"?scurPage_partenr=" + (curPage + 1) + "\">���� ></a>");
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
