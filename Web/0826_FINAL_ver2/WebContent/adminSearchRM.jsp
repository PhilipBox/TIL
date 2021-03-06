<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="util.DatabaseUtil"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.text.*" %> 
<% DecimalFormat format = new DecimalFormat("###,###"); %>

<%
	request.setCharacterEncoding("utf-8");
%>

<%
	response.setContentType("text/html; charset=utf-8");
%>

<html>

<head>

<title>JSP Example</title>

</head>


<!-- 지환 아작스 함수 -->
<script type="text/javascript">


	  $(document).ready(function(){
	   	     
	   	      
	   	      // APM
	     	    $("#ARM_index_main").click(function(){
	       	        //클릭되었으면
	       	        if($("#ARM_index_main").prop("checked")){
	       	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
	       	            $("input[name=ARM_index]").prop("checked",true);
	       	            //클릭이 안되있으면
	       	        }else{
	       	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
	       	            $("input[name=ARM_index]").prop("checked",false);
	       	        }
	       	    })
	       	     $("#APM_index_main").click(function(){
	       	        //클릭되었으면
	       	        if($("#APM_index_main").prop("checked")){
	       	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
	       	            $("input[name=APM_index]").prop("checked",true);
	       	            //클릭이 안되있으면
	       	        }else{
	       	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
	       	            $("input[name=APM_index]").prop("checked",false);
	       	        }
	       	    })
   	    }); // END READY FUNCTION
   	    
</script>





<body>
<%//curPage,
Connection conn = DatabaseUtil.getConnection();
String scurPage_customer = request.getParameter("curPageC");
int countListC = 10;


if(scurPage_customer==null)
	scurPage_customer="1";
int curPageC = Integer.parseInt(scurPage_customer);

int curRowC= (curPageC-1)*countListC;

/*
	// 파트너테이블
	Statement stmt_susuC = conn.createStatement();

	//실적관리 db로딩
	String sql_susuC = "select count(*) FROM CUSTOMER;";
	stmt_susuC.executeQuery(sql_susuC);
	ResultSet rs_susuC = null;
	rs_susuC = stmt_susuC.executeQuery(sql_susuC);
	rs_susuC.next();
	
	*/
%>

	<%
		
		
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;

		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");

		String customer_code = request.getParameter("customer_code");
		String partner_code = request.getParameter("partner_code");

		//out.print("sD "+startDate +" / eD "+endDate);
		
		String sql;
		String sql2;

		if (customer_code.equals("") && partner_code.equals("")) {
			//기간만
			
			sql = "select t1.id, t2.userCode, t1.c_regiDate, t1.c_expireDate, t2.userCompany, t2.userName, t1.c_code, t1.c_name, t1.c_plan, t1.c_fee, t1.c_margin, t1.c_state FROM customer_list as t1 join partner as t2 on t1.userCode = t2.userCode and DATE(t1.c_regiDate) between ? and ? order by c_regiDate"+" LIMIT "+curRowC+", "+countListC;
			
			sql2 = "select IFNULL(count(c_code), 0) FROM customer_list as t1 join partner as t2 on t1.userCode = t2.userCode and DATE(t1.c_regiDate) between ? and ? order by c_regiDate";
// select IFNULL(SUM(c_fee), 0), IFNULL(SUM(c_margin), 0), IFNULL(SUM(c_state), 0)   FROM customer as t1 join partner as t2 on t1.userCode = t2.userCode and DATE(t1.c_regiDate) between '2018/07/01' and '2018/09/01' order by c_regiDate;
			System.out.println("기간만");
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, startDate);
			pstmt.setString(2, endDate);
			
			pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setString(1, startDate);
			pstmt2.setString(2, endDate);

		} else {
	
			if (!partner_code.equals("")) {
		
				if (startDate.equals("") || endDate.equals("")) {
					startDate="";
					endDate="";
					System.out.println("파트너만");
					//파트너만
					sql = "select t1.id, t2.userCode, t1.c_regiDate, t1.c_expireDate,t2.userCompany, t2.userName, t1.c_code, t1.c_name, t1.c_plan, t1.c_fee, t1.c_margin, t1.c_state FROM customer_list as t1 join partner as t2 on t1.userCode = t2.userCode and t1.userCode=? order by c_regiDate"+" LIMIT "+curRowC+", "+countListC;
					sql2 = "select IFNULL(count(c_code), 0) FROM customer_list as t1 join partner as t2 on t1.userCode = t2.userCode and t1.userCode=? order by c_regiDate";
					
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, partner_code);
					
					pstmt2 = conn.prepareStatement(sql2);
					pstmt2.setString(1, partner_code);
					
				} else { 	System.out.println("파트너+기간");
					//파트너 + 기간
								//and t1.userCode="PKC222" order by c_regiDate
					sql = "select t1.id, t2.userCode, t1.c_regiDate, t1.c_expireDate, t2.userCompany, t2.userName, t1.c_code, t1.c_name, t1.c_plan, t1.c_fee, t1.c_margin, t1.c_state FROM customer_list as t1 join partner as t2 on t1.userCode = t2.userCode and (DATE(t1.c_regiDate) between ? and ?) and t1.userCode=? order by c_regiDate"+" LIMIT "+curRowC+", "+countListC;
					sql2 = "select IFNULL(count(c_code), 0) FROM customer_list as t1 join partner as t2 on t1.userCode = t2.userCode and (DATE(t1.c_regiDate) between ? and ?) and t1.userCode=? order by c_regiDate";

					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, startDate);
					pstmt.setString(2, endDate);
					pstmt.setString(3, partner_code);
					
					pstmt2 = conn.prepareStatement(sql2);
					pstmt2.setString(1, startDate);
					pstmt2.setString(2, endDate);
					pstmt2.setString(3, partner_code);
				}
			} //怨좉컼
			else if (!customer_code.equals("")) {
				//고객
				if (startDate.equals("") || endDate.equals("")) {	System.out.println("고객만");
					//고객만
					//and t1.c_code="PKC222-CK004"
					startDate="";
					endDate="";
					sql = "select t1.id, t2.userCode, t1.c_regiDate, t1.c_expireDate, t2.userCompany, t2.userName, t1.c_code, t1.c_name, t1.c_plan, t1.c_fee, t1.c_margin, t1.c_state FROM customer_list as t1 join partner as t2 on t1.userCode = t2.userCode and t1.c_code=? order by c_regiDate"+" LIMIT "+curRowC+", "+countListC;
					sql2 = "select IFNULL(count(c_code), 0) FROM customer_list as t1 join partner as t2 on t1.userCode = t2.userCode and t1.c_code=? order by c_regiDate";

					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, customer_code);
					
					pstmt2 = conn.prepareStatement(sql2);
					pstmt2.setString(1, customer_code);
				} else { 	
					System.out.println("고객+기간");
					//고객+ 기간
					sql = "select t2.userCode, t1.id, t1.c_regiDate, t1.c_expireDate, t2.userCompany, t2.userName, t1.c_code, t1.c_name, t1.c_plan, t1.c_fee, t1.c_margin, t1.c_state FROM customer_list as t1 join partner as t2 on t1.userCode = t2.userCode and (DATE(t1.c_regiDate) between ? and ?) and t1.c_code=? order by c_regiDate"+" LIMIT "+curRowC+", "+countListC;
					sql2 = "select IFNULL(count(c_code), 0) FROM customer_list as t1 join partner as t2 on t1.userCode = t2.userCode and (DATE(t1.c_regiDate) between ? and ?) and t1.c_code=? order by c_regiDate";

					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, startDate);
					pstmt.setString(2, endDate);
					pstmt.setString(3, customer_code);
					
					pstmt2 = conn.prepareStatement(sql2);
					pstmt2.setString(1, startDate);
					pstmt2.setString(2, endDate);
					pstmt2.setString(3, customer_code);
				}

			}

		}

		// if(c.equals("")) out.print("2");

		/*
		if(customer_code.equals("")&& partner_code.equals(""))
			 sql = "select t1.c_regiDate, t2.userCompany, t2.userName, t1.c_code, t1.c_name, t1.c_name, t1.c_plan, t1.c_fee, t1.c_margin, t1.c_state FROM customer as t1 join partner as t2 on t1.userCode = t2.userCode and DATE(t1.c_regiDate) between ? and ? order by c_regiDate";
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

		//ARM db濡쒕뵫
		//sql = "select t1.c_regiDate, t2.userCompany, t2.userName, t1.c_code, t1.c_name, t1.c_name, t1.c_plan, t1.c_fee, t1.c_margin, t1.c_state FROM customer as t1 join partner as t2 on t1.userCode = t2.userCode and DATE(t1.c_regiDate) between ? and ? order by c_regiDate";

		//PreparedStatement pstmt = conn.prepareStatement(sql);

		// pstmt.setString(1, startDate);
		// pstmt.setString(2, endDate);

		ResultSet rsARM = null;
		rsARM = pstmt.executeQuery();
		
		ResultSet rsRM2 = null;
		rsRM2 = pstmt2.executeQuery();
		rsRM2.next();
	%>
	
													

	<div id="divTable">
					<div style="display:none;">
					<input id="startDate" name = "startDate" value=<%=startDate%>> 
					<input id="endDate" name = "endDate" value=<%=endDate%>> 
					<input id="customer_code" name = "customer_code" value=<%=customer_code%>> 
					<input id="partner_code" name = "partner_code" value=<%=partner_code%>> 
					</div>
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

<%
	int countPageC = 5;
	int totalCountC = rsRM2.getInt("IFNULL(count(c_code), 0)");
	
	System.out.println("totalCount "+ totalCountC);
	
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
							
							id = "rm" + id + "_";
							
		                     long c_fee_long = Long.parseLong(c_fee);
		                     long c_margin_long = Long.parseLong(c_margin);

		                     customerFee += c_fee_long;
								customerMargin += c_margin_long;
							
		                     c_fee = format.format(c_fee_long);
		                     c_margin = format.format(c_margin_long);
							
		                     
		                     //System.out.println(id);
							
					%>
					
					
					<th scope="row" width="2%"><input type="checkbox"
						class="ARM_checkSelect" id="<%=id%>" name="ARM_index"
						value=<%=id%> /></th>
					<td width="10%"><%=billDate%></td>
					<td width="10%"><%=c_expireDate%></td>
					<td width="8%"><%=userCompany%></td>
					<td width="8%"><%=userName%></td>
					<td width="7%"><INPUT type="text" name="rm<%=id%>0"
						id="<%=id%>0" size="15" value=<%=c_code%> readonly="readonly"
						style="border: 0 solid black; text-align: center;"></td>
					<td width="7%"><%=c_name%></td>
					<td width="7%"><%=c_plan%></td>
					<td width="7%"><INPUT type="text" name="<%=id%>1"
						id="<%=id%>1" size="7" value=<%=c_fee%> readonly="readonly"
						style="border: 0 solid black; text-align: center;"></td>
					<td width="5%"><INPUT type="text" name="<%=id%>2"
						id="<%=id%>2" size="7" value=<%=c_margin%> readonly="readonly"
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
															//실적관리 !!!!!!  

															//out.print("db 연결 정보 " + conn);

												
														%>
														<%
														String fee,margin;
														
														fee = format.format(customerFee); 
														margin = format.format(customerMargin); 
														
																
														%>
												<tr>
												<td colspan="2" style="font-weight:bold; ">
													합계
													</td>
													<td  colspan="6" ></td>
													<td>
													<%=fee %>
													</td>
													<td>
													<%=margin %>
													</td>
													<td>
													</td>
									
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
												String startDate2 = '\"' + startDate + '\"';
												String endDate2 = '\"' + endDate + '\"';
												String customer_code2 = "";
												String partner_code2="";
												
												if(customer_code != null) {
													customer_code2 =  "\"" + customer_code +  "\"";
												}
												customer_code2 =  "\"" + customer_code +  "\"";

												partner_code2 =  "\"" + partner_code +  "\"";
												
												System.out.println("데이터확인 " + startDate +"~"+ endDate +"/고객/"+ customer_code + "/파트너/"+ partner_code);
												System.out.println("데이터확인 " + startDate2 +"~"+ endDate2 +"/고객/"+ customer_code2 + "/파트너/"+ partner_code2);

												
													if (curPageC > 1) {

														out.print("<button type='button' onclick='readPagingSearchRM(" + 1 + ", " + countListC + ","+ startDate2+","+endDate2+","+ customer_code2 +","+partner_code2+");' class='btn btn-default'><<</button>");
														//		out.print("<a href=\"?scurPage_partenr=" + 1 + "\">처음</a>");
														//out.print("<a href=\"?curPage=" + (curPage - 1) + "\">< 이전</a>");
														%>
														<script>
															spacing(0);
														</script>
														<%		
														out.print("<button type='button' onclick='readPagingSearchRM(" + (curPageC - 1) + ", " + countListC	+ ","+ startDate2+","+endDate2+","+ customer_code2 +","+partner_code2+");' class='btn btn-default'><</button>");

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
														out.print("<button type='button' onclick='readPagingSearchRM(" + i + ", " + countListC
																+ ","+ startDate2+","+endDate2+","+ customer_code2 +","+partner_code2+");' class='btn btn-default'>" + i + "</button>");
														
														%>
														<script>
															spacing(0);
														</script>
														<%
													}
													if (curPageC < totalPageC) {
														//out.print("<a href=\"?scurPage_partenr=" + (curPage + 1) + "\">다음 ></a>");
														out.print("<button type='button' onclick='readPagingSearchRM(" + (curPageC + 1) + ", " + countListC
																+ ","+ startDate2+","+endDate2+","+ customer_code2 +","+partner_code2+");' class='btn btn-default'>></button>");
														%>
														<script>
															spacing(0);
														</script>
														<%		
														out.print("<button type='button' onclick='readPagingSearchRM(" + totalPageC + ", " + countListC
																+ ","+ startDate2+","+endDate2+","+ customer_code2 +","+partner_code2+");' class='btn btn-default'>>></button>");
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

<%%>

</body>

</html>