<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="util.DatabaseUtil"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.text.*" %> 
<%DecimalFormat format = new DecimalFormat("###,###");
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

<script type="text/javascript">

	$(document).ready(function(){

		$("#PRM_index_main").click(
				function() {
					//클릭되었으면
					if ($("#PRM_index_main").prop("checked")) {
						//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
						$("input[name=PRM_index]").prop(
								"checked", true);
						//클릭이 안되있으면
					} else {
						//input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
						$("input[name=PRM_index]").prop(
								"checked", false);
					}
				})
		
	    }); // END READY FUNCTION

</script>
<body>


	<%
		Connection conn = DatabaseUtil.getConnection();

	//2는 sum
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;

		String sql;
		String sql2;

		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String userCode = request.getParameter("userCode");
		String customer_code = request.getParameter("customer_code");
//select sum(c_fee), sum(c_margin), sum(c_unpaid)
		if (customer_code.equals("")) {
			//out.print("기간만");
			//기간만
			//select * from customer where userCode="PKC222" and (DATE(c_billDate) between '2018/07/01' and '2018/09/01') order by c_billDate ;
			sql = "select * from customer where userCode=? and (DATE(c_billDate) between ? and ?) order by c_billDate ;";
			//"select t2.userCode, t1.c_billDate, t2.userCompany, t2.userName, t1.c_code, t1.c_name, t1.c_name, t1.c_plan, t1.c_calcul, t1.c_fee, t1.c_margin, t1.c_unpaid FROM customer as t1 join partner as t2 on t1.userCode = t2.userCode and DATE(t1.c_billDate) between ? and ? order by c_billDate";

			sql2 = " select IFNULL(sum(c_fee),0), IFNULL(sum(c_margin),0), IFNULL(sum(c_unpaid),0) from customer where userCode=? and (DATE(c_billDate) between ? and ?) order by c_billDate ";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userCode);
			pstmt.setString(2, startDate);
			pstmt.setString(3, endDate);
			
			pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setString(1, userCode);
			pstmt2.setString(2, startDate);
			pstmt2.setString(3, endDate);

		} else {
			if (!customer_code.equals("")) {
				//고객만
				if (startDate.equals("") || endDate.equals("")) {
					//out.print("고객만");
					//and t1.c_code="PKC222-CK004"
					sql = "select * from customer where userCode=? and c_code=? order by c_billDate ;";
					//"select t2.userCode, t1.c_billDate, t2.userCompany, t2.userName, t1.c_code, t1.c_name, t1.c_name, t1.c_plan, t1.c_calcul, t1.c_fee, t1.c_margin, t1.c_unpaid FROM customer as t1 join partner as t2 on t1.userCode = t2.userCode and t1.c_code=? order by c_billDate";

					sql2 = " select IFNULL(sum(c_fee),0), IFNULL(sum(c_margin),0), IFNULL(sum(c_unpaid),0) from customer where userCode=? and c_code=? order by c_billDate ;";
					
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, userCode);
					pstmt.setString(2, customer_code);
					
					pstmt2 = conn.prepareStatement(sql2);
					pstmt2.setString(1, userCode);
					pstmt2.setString(2, customer_code);

				} else { //고객+기간
					//out.print("고객+기간");

					//select * from customer where userCode="PKC222" and (DATE(c_billDate) between '2018/07/01' and '2018/09/01') and c_code='PKC222-CK002' order by c_billDate ;
					sql = "select * from customer where userCode=? and (DATE(c_billDate) between ? and ?) and c_code=? order by c_billDate ;";
					//"select t2.userCode, t1.c_billDate, t2.userCompany, t2.userName, t1.c_code, t1.c_name, t1.c_name, t1.c_plan, t1.c_calcul, t1.c_fee, t1.c_margin, t1.c_unpaid FROM customer as t1 join partner as t2 on t1.userCode = t2.userCode and (DATE(t1.c_billDate) between ? and ?) and t1.c_code=? order by c_billDate";

					sql2 = " select IFNULL(sum(c_fee),0), IFNULL(sum(c_margin),0), IFNULL(sum(c_unpaid),0) from customer where userCode=? and (DATE(c_billDate) between ? and ?) and c_code=? order by c_billDate ;";
					
					
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, userCode);
					pstmt.setString(2, startDate);
					pstmt.setString(3, endDate);
					pstmt.setString(4, customer_code);
					
					pstmt2 = conn.prepareStatement(sql2);
					pstmt2.setString(1, userCode);
					pstmt2.setString(2, startDate);
					pstmt2.setString(3, endDate);
					pstmt2.setString(4, customer_code);
				}

			}

		}

		ResultSet rsRM = null;
		rsRM = pstmt.executeQuery();
		
		ResultSet rsRM2 = null;
		rsRM2 = pstmt2.executeQuery();
	%>
	<div id="divTable">
		<table class="table" id="PRM_table" style="width: 1000px">
			<thead class="thead-light">
				<tr>
					<th scope="col" width="10px" nowrap style="text-align: center;"><input
						type="checkbox" name="PRM_index" id="PRM_index_main" /></th>
					<th scope="col" width="10px" nowrap style="text-align: center;">계산서발행일</th>
					<th scope="col" width="15px" nowrap style="text-align: center;">고객코드</th>
					<th scope="col" width="15px" nowrap style="text-align: center;">고객사명</th>
					<th scope="col" width="15px" style="text-align: center;">요금제</th>
					<th scope="col" width="10px" style="text-align: center;">정산주기</th>
					<th scope="col" width="10px" style="text-align: center;">요금</th>
					<th scope="col" width="10px" style="text-align: center;">마진</th>
					<th scope="col" width="10px" style="text-align: center;">미수금</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<%
						//실적관리 !!!!!!  

						//out.print("db 연결 정보 " + conn);
					%>
					<%
						while (rsRM.next()) {
							
	                       	String PRM_id = rsRM.getString("id");
							String billDate = rsRM.getString("c_billDate");
							String companyCode = rsRM.getString("c_code");
							String companyName = rsRM.getString("c_name");
							String plan = rsRM.getString("c_plan");
							String contract = rsRM.getString("c_calcul");
							String fee = rsRM.getString("c_fee");
							String margin = rsRM.getString("c_margin");
							String unpaid = rsRM.getString("c_unpaid");
							
							long c_fee_long = Long.parseLong(fee);
                            long c_margin_long = Long.parseLong(margin);
                            long c_unpaid_long = Long.parseLong(unpaid);

                            fee = format.format(c_fee_long);
                            margin = format.format(c_margin_long);
                            unpaid = format.format(c_unpaid_long);
                            
							PRM_id = "PRM" + PRM_id + "_";

					%>
					<th scope="row"><input type="checkbox" class="PRM_checkSelect"
						id="<%=PRM_id%>" name="PRM_index" value=<%=PRM_id%> /></th>
					<td width="5%"><%=billDate%></td>
					<td width="15%"><INPUT type="text" name="<%=companyCode%>0"
						id="<%=PRM_id%>0" size="25" value=<%=companyCode%>
						readonly="readonly"
						style="border: 0 solid black; text-align: center;"></td>
					<td width="15%"><%=companyName%></td>
					<td width="15%"><%=plan%></td>
					<td width="15%"><%=contract%></td>
					<td width="15%"><INPUT type="text" name="<%=PRM_id%>1"
						id="<%=PRM_id%>1" size="7" value=<%=fee%> readonly="readonly"
						style="border: 0 solid black; text-align: center;"></td>

					<td width="15%"><INPUT type="text" name="<%=PRM_id%>2"
						id="<%=PRM_id%>2" size="7" value=<%=margin%>
						readonly="readonly"
						style="border: 0 solid black; text-align: center;"></td>
					<td width="15%"><INPUT type="text" name="<%=PRM_id%>3"
						id="<%=PRM_id%>3" size="7" value=<%=unpaid%>
						readonly="readonly"
						style="border: 0 solid black; text-align: center;"></td>

				</tr>
				<%
					}
				%>

			</tbody>
				<tfoot>
												
														<%
															while (rsRM2.next()) {	
																//c_margin c_unpaid
																//String str = String.format("%,d", i); //%,d",
																String fee = rsRM2.getString("IFNULL(sum(c_fee),0)"); 
																String margin = rsRM2.getString("IFNULL(sum(c_margin),0)");
																String unpaid = rsRM2.getString("IFNULL(sum(c_unpaid),0)");
																
																
																long value = Long.parseLong(fee);
																fee = format.format(value);
																value = Long.parseLong(margin);
																margin = format.format(value);
																value = Long.parseLong(unpaid);
																unpaid = format.format(value);
																
																
														%>
												<tr>
												<td colspan="2" style="font-weight:bold; ">
													합계
													</td>
													<td  colspan="4" ></td>
													<td>
													<%=fee %>
													</td>
													<td>
													<%=margin %>
													</td>
													<td>
													<%=unpaid %>
													</td>
													<%} %>
												</tfoot>
		</table>

	</div>



</body>
</html>