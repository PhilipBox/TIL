<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="util.DatabaseUtil"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.text.*" %> 
<%DecimalFormat format = new DecimalFormat("###,###");
 %>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=utf-8");
%>


<html>

<head>
<title></title>
</head>


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
		String customer_name = request.getParameter("customer_name");
		
		System.out.println("------------- 111111------------");
		System.out.println("시작날짜 : " + startDate);
		System.out.println("끝날짜 : " +endDate);
		System.out.println("유저코드 : " +userCode);
		System.out.println("고객이름 : " +customer_name);
%>

													<%
													
													String scurPage_customer = request.getParameter("curPageC"); // curPage : 현재 페이지
													
													int countListC = 10;
													//들어가는 row의 수
													
													if (scurPage_customer == null)
														scurPage_customer = "1";
													
													
													int curPageC = Integer.parseInt(scurPage_customer);

													int curRowC = (curPageC - 1) * countListC;
													// 현재 페이지의 가장 첫 번째 row
													
													
													String userCodeInitRM = (String) session.getAttribute("userCodeDB");
													Statement stmt_susuC = conn.createStatement();
													//실적관리 db로딩
													//String sql_susuC = "select count(*) FROM CUSTOMER where userCode = \"" + userCodeInitRM +"\"";
													// 파트너가 없는 customer가 있으면 안된다! ! ! count에 오류가 생길 수 있음.

													String sql_susuC = "";

													%>




<%
		
//select sum(c_fee), sum(c_margin), sum(c_unpaid)

		if ( customer_name == null ) {
				// 기간 ㅇ , 이름 null			
			System.out.println("기간만일때 진입하였음 : 고객이름 null");
			sql = "select * from customer_list where userCode=? and (DATE(c_regiDate) between ? and ?) order by c_regiDate LIMIT " + curRowC + ", " + countListC;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userCode);
			pstmt.setString(2, startDate);
			pstmt.setString(3, endDate);
			
			sql_susuC = "select count(*) from customer_list where userCode=\"" + userCodeInitRM +"\" and (DATE(c_regiDate) between \"" + startDate +"\" and \"" + endDate +"\")";
			stmt_susuC.executeQuery(sql_susuC);
			ResultSet rs_susuC = null;
			rs_susuC = stmt_susuC.executeQuery(sql_susuC);
			rs_susuC.next();
			
		}
		else if ( customer_name.equals("")){
			// 기간 ㅇ, 이름 공백
			System.out.println("기간만일때 진입하였음 : 고객이름 빈칸");
			sql = "select * from customer_list where userCode=? and (DATE(c_regiDate) between ? and ?) order by c_regiDate LIMIT " + curRowC + ", " + countListC;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userCode);
			pstmt.setString(2, startDate);
			pstmt.setString(3, endDate);
			
			sql_susuC = "select count(*) from customer_list where userCode=\"" + userCodeInitRM +"\" and (DATE(c_regiDate) between \"" + startDate +"\" and \"" + endDate +"\")";
			stmt_susuC.executeQuery(sql_susuC);
			ResultSet rs_susuC = null;
			rs_susuC = stmt_susuC.executeQuery(sql_susuC);
			rs_susuC.next();
			
			
		}
		else if (!customer_name.equals("")){
			if (startDate.equals("") || endDate.equals("")) {
				sql = "select * from customer_list where userCode=? and c_name like ? order by c_regiDate LIMIT " + curRowC + ", " + countListC;
				customer_name="%"+customer_name+"%";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userCode);
				pstmt.setString(2, customer_name);
				
				sql_susuC = "select count(*) from customer_list where userCode=\"" + userCodeInitRM +"\" and c_name like \""+customer_name+"\"";
				stmt_susuC.executeQuery(sql_susuC);
				ResultSet rs_susuC = null;
				rs_susuC = stmt_susuC.executeQuery(sql_susuC);
				rs_susuC.next();
				
				
				
				
			} else { //고객+기간
				//out.print("고객+기간");

				sql = "select * from customer_list where userCode=? and (DATE(c_regiDate) between ? and ?) and c_name like ? order by c_regiDate LIMIT " + curRowC + ", " + countListC;
				customer_name="%"+customer_name+"%";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userCode);
				pstmt.setString(2, startDate);
				pstmt.setString(3, endDate);
				pstmt.setString(4, customer_name);
			
				
				sql_susuC = "select count(*) from customer_list where userCode=\"" + userCodeInitRM +"\" and (DATE(c_regiDate) between \"" + startDate +"\" and \"" + endDate +"\") and c_name like \""+customer_name+"\"";
				stmt_susuC.executeQuery(sql_susuC);
				ResultSet rs_susuC = null;
				rs_susuC = stmt_susuC.executeQuery(sql_susuC);
				rs_susuC.next();
				
			}
			
		}

		ResultSet rsRM = null;
		rsRM = pstmt.executeQuery();
		
		//ResultSet rsRM2 = null;
		//rsRM2 = pstmt2.executeQuery();
	%>
	<div id="divTable">
		<table class="table" id="PRM_table" style="width: 1000px">
			<thead class="thead-light">
				<tr>
					<th scope="col" width="10px" nowrap style="text-align: center;">고객가입일</th>
					<th scope="col" width="15px" nowrap style="text-align: center;">고객코드</th>
					<th scope="col" width="15px" nowrap style="text-align: center;">고객사명</th>
					<th scope="col" width="15px" style="text-align: center;">요금제</th>
					<th scope="col" width="10px" style="text-align: center;">요금</th>
					<th scope="col" width="10px" style="text-align: center;">수익금</th>
					<th scope="col" width="10px" style="text-align: center;">상태</th>
				</tr>
			</thead>
			<tbody>
				<tr>
												<%
												stmt_susuC.executeQuery(sql_susuC);
												ResultSet rs_susuC = null;
												rs_susuC = stmt_susuC.executeQuery(sql_susuC);
												rs_susuC.next();
												
												
												
														int countPageC = 5;	// 페이지의 수 
														int totalCountC = rs_susuC.getInt("count(*)");
														System.out.println("전체 갯수 ! : " + totalCountC);
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
								/// 이위에는 변수명 주의
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
							String state = rsRM.getString("c_state");
							
							long c_fee_long = Long.parseLong(fee);
                            long c_margin_long = Long.parseLong(margin);

                            customerFee += c_fee_long;
							customerMargin += c_margin_long;

							
                            fee = format.format(c_fee_long);
                            margin = format.format(c_margin_long);
                            
							PRM_id = "PRM" + PRM_id + "_";

					%>
					<td width="10%"><%=billDate%></td>
					<td width="15%"><INPUT type="text" name="<%=companyCode%>0"
						id="<%=PRM_id%>0" size="25" value=<%=companyCode%>
						readonly="readonly"
						style="border: 0 solid black; text-align: center;"></td>
					<td width="15%"><%=companyName%></td>
					<td width="15%"><%=plan%></td>
					<td width="15%"><INPUT type="text" name="<%=PRM_id%>1"
						id="<%=PRM_id%>1" size="7" value=<%=fee%> readonly="readonly"
						style="border: 0 solid black; text-align: center;"></td>

					<td width="15%"><INPUT type="text" name="<%=PRM_id%>2"
						id="<%=PRM_id%>2" size="7" value=<%=margin%>
						readonly="readonly"
						style="border: 0 solid black; text-align: center;"></td>
					<td width="15%"><%
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
													String fee, margin, unpaid;

													fee = format.format(customerFee);
													margin = format.format(customerMargin);
												%>
												<tr>
												<td colspan="1" style="font-weight:bold; ">
													합계
													</td>
													<td  colspan="3" ></td>
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

								<div id="pagination" style="text-align: center">
								
								
											<button type='button' id="firstPage" name="firstPage"
												class='btn btn-default' style="visibility: hidden">
												<<</button>
											<button type='button' id="beforePage" name="beforePage"
												class='btn btn-default' style="visibility: hidden">
												<</button>
											<%
											
													String startDate2 = '\"' + startDate + '\"';
													String endDate2 = '\"' + endDate + '\"';
													String customer_name2 = "";
													if(customer_name != null) {
													customer_name2 = customer_name.replaceAll("%", "");
													customer_name2 =  '\"' + customer_name2 +  '\"';
													}
													
												if (curPageC > 1) {
													// 현재 페이지가 가장 첫번째 페이지가 아닐 경우, 이전으로 가는 버튼 생성
													out.print("<button type='button' onclick='readPagingSearchRM(" + 1 + ", " + countListC + ","+startDate2+ "," + endDate2 +"," + customer_name2+");' class='btn btn-default'><<</button>");
													//		out.print("<a href=\"?scurPage_partenr=" + 1 + "\">처음</a>");
													//out.print("<a href=\"?curPage=" + (curPage - 1) + "\">< 이전</a>");
													%>
													<script>
														spacing(0);
													</script>
													<%
													out.print("<button type='button' onclick='readPagingSearchRM(" + (curPageC - 1) + ", " + countListC + ","+startDate2+ "," + endDate2 +"," + customer_name2+");' class='btn btn-default'><</button>");

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
													
													out.print("<button type='button' onclick='readPagingSearchRM(" + i + ", " + countListC + ","+startDate2+ "," + endDate2 +"," + customer_name2+");' class='btn btn-default'>" + i + "</button>");
												

													%>
													<script>
														spacing(0);
													</script>
													<%
												}
												if (curPageC < totalPageC) {
													// 	
													
													//out.print("<a href=\"?scurPage_partenr=" + (curPage + 1) + "\">다음 ></a>");
													out.print("<button type='button' onclick='readPagingSearchRM(" + (curPageC + 1) + ", " + countListC + ","+startDate2+ "," + endDate2 +"," + customer_name2+");' class='btn btn-default'>></button>");


													%>
													<script>
														spacing(0);
													</script>
													<%
													
													out.print("<button type='button' onclick='readPagingSearchRM(" + totalPageC + ", " + countListC + ","+startDate2+ "," + endDate2 +"," + customer_name2+");' class='btn btn-default'>>></button>");
												 }else if( curPageC == endPageC){
													
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