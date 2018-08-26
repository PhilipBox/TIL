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

<script>

function readPagingSearchRM(curPage, countList, customer_code) {
	$.ajax({
		type : "post",
		url : "./partnerReadSearchRM.jsp",
		data : {
			curPageC : curPage,
			countListC : countList,
			userCode : $('#userCode').val(),
			startDate : "2018/08/01",
			endDate : "2018/08/31",
			customer_code : "",
			customer_name : ""
		},
		success : ssSuccess,
		error : ssSuccess
	});
}


</script>

<body>


	<%
	
		Connection conn = DatabaseUtil.getConnection();

	//2는 sum
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;

		String sql;
		String sql2;
		
		String scurPage_customer = request.getParameter("curPageC"); // curPage : 현재 페이지
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String userCode = request.getParameter("userCode");
		String customer_code = request.getParameter("customer_code");
		String customer_name = request.getParameter("customer_name");
		
		System.out.println("------------- 2222222222------------");

		System.out.println("2/페이지정보 : " + scurPage_customer );
		System.out.println("2/시작날짜 : " + startDate);
		System.out.println("2/끝날짜 : " +endDate);
		System.out.println("2/유저코드 : " +userCode);
		System.out.println("2/고객코드 : " +customer_code);
		System.out.println("2/고객이름 : " +customer_name);
%>

													<%
													
													
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
		if (customer_code.equals("") && ( customer_name == null  ) ) {
			
			System.out.println("기간만일때 진입하였음 : 고객이름 null");
			//out.print("기간만");
			//기간만
			//select * from customer where userCode="PKC222" and (DATE(c_billDate) between '2018/07/01' and '2018/09/01') order by c_billDate ;
			sql = "select * from customer where userCode=? and (DATE(c_billDate) between ? and ?) order by c_billDate LIMIT " + curRowC + ", " + countListC;
			//"select t2.userCode, t1.c_billDate, t2.userCompany, t2.userName, t1.c_code, t1.c_name, t1.c_name, t1.c_plan, t1.c_calcul, t1.c_fee, t1.c_margin, t1.c_unpaid FROM customer as t1 join partner as t2 on t1.userCode = t2.userCode and DATE(t1.c_billDate) between ? and ? order by c_billDate";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userCode);
			pstmt.setString(2, startDate);
			pstmt.setString(3, endDate);
			
			sql_susuC = "select count(*) from customer where userCode=\"" + userCodeInitRM +"\" and (DATE(c_billDate) between \"" + startDate +"\" and \"" + endDate +"\")";
			stmt_susuC.executeQuery(sql_susuC);
			ResultSet rs_susuC = null;
			rs_susuC = stmt_susuC.executeQuery(sql_susuC);
			rs_susuC.next();
			
		} 
		// 고객코드가 있다면,
		
		else if (customer_code.equals("") && customer_name.equals("") ) {
			
			System.out.println("기간만일때 진입하였음 : 고객이름 빈칸");
			//out.print("기간만");
			//기간만
			//select * from customer where userCode="PKC222" anㅋd (DATE(c_billDate) between '2018/07/01' and '2018/09/01') order by c_billDate ;
			sql = "select * from customer where userCode=? and (DATE(c_billDate) between ? and ?) order by c_billDate LIMIT " + curRowC + ", " + countListC;
			//"select t2.userCode, t1.c_billDate, t2.userCompany, t2.userName, t1.c_code, t1.c_name, t1.c_name, t1.c_plan, t1.c_calcul, t1.c_fee, t1.c_margin, t1.c_unpaid FROM customer as t1 join partner as t2 on t1.userCode = t2.userCode and DATE(t1.c_billDate) between ? and ? order by c_billDate";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userCode);
			pstmt.setString(2, startDate);
			pstmt.setString(3, endDate);
			
			sql_susuC = "select count(*) from customer where userCode=\"" + userCodeInitRM +"\" and (DATE(c_billDate) between \"" + startDate +"\" and \"" + endDate +"\")";
			stmt_susuC.executeQuery(sql_susuC);
			ResultSet rs_susuC = null;
			rs_susuC = stmt_susuC.executeQuery(sql_susuC);
			rs_susuC.next();
		} 
		else if (customer_code == null && customer_name == null ) {
			
			System.out.println("기간만일때 진입하였음 : 고객이름 빈칸");
			//out.print("기간만");
			//기간만
			//select * from customer where userCode="PKC222" anㅋd (DATE(c_billDate) between '2018/07/01' and '2018/09/01') order by c_billDate ;
			sql = "select * from customer where userCode=? and (DATE(c_billDate) between ? and ?) order by c_billDate LIMIT " + curRowC + ", " + countListC;
			//"select t2.userCode, t1.c_billDate, t2.userCompany, t2.userName, t1.c_code, t1.c_name, t1.c_name, t1.c_plan, t1.c_calcul, t1.c_fee, t1.c_margin, t1.c_unpaid FROM customer as t1 join partner as t2 on t1.userCode = t2.userCode and DATE(t1.c_billDate) between ? and ? order by c_billDate";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userCode);
			pstmt.setString(2, startDate);
			pstmt.setString(3, endDate);
			
			sql_susuC = "select count(*) from customer where userCode=\"" + userCodeInitRM +"\" and (DATE(c_billDate) between \"" + startDate +"\" and \"" + endDate +"\")";
			stmt_susuC.executeQuery(sql_susuC);
			ResultSet rs_susuC = null;
			rs_susuC = stmt_susuC.executeQuery(sql_susuC);
			rs_susuC.next();
		} 

		// 고객코드가 있다면,
		else if (!customer_code.equals("")) {	
				// 날짜가 없으면, 고객 코드로만.
				if (startDate.equals("") || endDate.equals("")) {
					//out.print("고객만");
					//and t1.c_code="PKC222-CK004"
					sql = "select * from customer where userCode=? and c_code=? order by c_billDate LIMIT " + curRowC + ", " + countListC;
					//"select t2.userCode, t1.c_billDate, t2.userCompany, t2.userName, t1.c_code, t1.c_name, t1.c_name, t1.c_plan, t1.c_calcul, t1.c_fee, t1.c_margin, t1.c_unpaid FROM customer as t1 join partner as t2 on t1.userCode = t2.userCode and t1.c_code=? order by c_billDate";

					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, userCode);
					pstmt.setString(2, customer_code);
					
					
					sql_susuC = "select count(*) from customer where userCode=\"" + userCodeInitRM +"\" and c_code=\""+customer_code+"\"";
					stmt_susuC.executeQuery(sql_susuC);
					ResultSet rs_susuC = null;
					rs_susuC = stmt_susuC.executeQuery(sql_susuC);
					rs_susuC.next();
					
					

				} else { //고객+기간
					//out.print("고객+기간");

					//select * from customer where userCode="PKC222" and (DATE(c_billDate) between '2018/07/01' and '2018/09/01') and c_code='PKC222-CK002' order by c_billDate ;
					sql = "select * from customer where userCode=? and (DATE(c_billDate) between ? and ?) and c_code=? order by c_billDate LIMIT " + curRowC + ", " + countListC;
					//"select t2.userCode, t1.c_billDate, t2.userCompany, t2.userName, t1.c_code, t1.c_name, t1.c_name, t1.c_plan, t1.c_calcul, t1.c_fee, t1.c_margin, t1.c_unpaid FROM customer as t1 join partner as t2 on t1.userCode = t2.userCode and (DATE(t1.c_billDate) between ? and ?) and t1.c_code=? order by c_billDate";

					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, userCode);
					pstmt.setString(2, startDate);
					pstmt.setString(3, endDate);
					pstmt.setString(4, customer_code);
					
					
					sql_susuC = "select count(*) from customer where userCode=\"" + userCodeInitRM +"\" and (DATE(c_billDate) between \"" + startDate +"\" and \"" + endDate +"\") and c_code=\""+customer_code+"\"";
					stmt_susuC.executeQuery(sql_susuC);
					ResultSet rs_susuC = null;
					rs_susuC = stmt_susuC.executeQuery(sql_susuC);
					rs_susuC.next();
					
					
				}
		}
		// 고객이름이 있다면,
		else if (!customer_name.equals("")) {
			// 날짜가 없으면, 고객 이름으로만.
			if (startDate.equals("") || endDate.equals("")) {
				//out.print("고객만");
				//and t1.c_code="PKC222-CK004"
				sql = "select * from customer where userCode=? and c_name like ? order by c_billDate LIMIT " + curRowC + ", " + countListC;
				//"select t2.userCode, t1.c_billDate, t2.userCompany, t2.userName, t1.c_code, t1.c_name, t1.c_name, t1.c_plan, t1.c_calcul, t1.c_fee, t1.c_margin, t1.c_unpaid FROM customer as t1 join partner as t2 on t1.userCode = t2.userCode and t1.c_code=? order by c_billDate";

				//select * from customer where c_name like '%고%';
					
				customer_name="%"+customer_name+"%";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userCode);
				pstmt.setString(2, customer_name);
				
					sql_susuC = "select count(*) from customer where userCode=\"" + userCodeInitRM +"\" and c_name like \""+customer_name+"\"";
				stmt_susuC.executeQuery(sql_susuC);
				ResultSet rs_susuC = null;
				rs_susuC = stmt_susuC.executeQuery(sql_susuC);
				rs_susuC.next();
				
				
				
				
			} else { //고객+기간
				//out.print("고객+기간");

				//select * from customer where userCode="PKC222" and (DATE(c_billDate) between '2018/07/01' and '2018/09/01') and c_code='PKC222-CK002' order by c_billDate ;
				sql = "select * from customer where userCode=? and (DATE(c_billDate) between ? and ?) and c_name like ? order by c_billDate LIMIT " + curRowC + ", " + countListC;
				//"select t2.userCode, t1.c_billDate, t2.userCompany, t2.userName, t1.c_code, t1.c_name, t1.c_name, t1.c_plan, t1.c_calcul, t1.c_fee, t1.c_margin, t1.c_unpaid FROM customer as t1 join partner as t2 on t1.userCode = t2.userCode and (DATE(t1.c_billDate) between ? and ?) and t1.c_code=? order by c_billDate";

				
				customer_name="%"+customer_name+"%";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userCode);
				pstmt.setString(2, startDate);
				pstmt.setString(3, endDate);
				pstmt.setString(4, customer_name);
			
				
				sql_susuC = "select count(*) from customer where userCode=\"" + userCodeInitRM +"\" and (DATE(c_billDate) between \"" + startDate +"\" and \"" + endDate +"\") and c_name like \""+customer_name+"\"";
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
	partnerReadSearchRM.jsp
	<div id="divTable">
		<table class="table" id="PRM_table" style="width: 1000px">
			<thead class="thead-light">
				<tr>
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

                            customerFee += c_fee_long;
							customerMargin += c_margin_long;
							customerUnpaid += c_unpaid_long;

							
                            fee = format.format(c_fee_long);
                            margin = format.format(c_margin_long);
                            unpaid = format.format(c_unpaid_long);
                            
							PRM_id = "PRM" + PRM_id + "_";

					%>
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
													String fee, margin, unpaid;

													fee = format.format(customerFee);
													margin = format.format(customerMargin);
													unpaid = format.format(customerUnpaid);
												%>
												<tr>
												<td colspan="1" style="font-weight:bold; ">
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
											
												</tfoot>
		</table>

								<div id="pagination" style="text-align: center">
											<%
													String startDate2 = '\"' + startDate + '\"';
													String endDate2 = '\"' + endDate + '\"';
													String userCode2 = userCode;
													String customer_name2 = customer_name;
													String customer_code2 = customer_code;
											System.out.println("최종데이터 검사 : curPage,countListC : " + curPageC+" / "+countListC);
											System.out.println("최종데이터 검사 : 유저코드/날짜/고객이름,코드 : " + userCode+" / "+startDate+"~"+endDate+" / "+customer_code+" / "+customer_name);
												if (curPageC > 1) {
													// 현재 페이지가 가장 첫번째 페이지가 아닐 경우, 이전으로 가는 버튼 생성
													out.print("<button type='button' onclick='readPagingSearchRM(" + 1 + ", " + countListC + ");' class='btn btn-default'> << 처음</button>");
													//		out.print("<a href=\"?scurPage_partenr=" + 1 + "\">처음</a>");
													//out.print("<a href=\"?curPage=" + (curPage - 1) + "\">< 이전</a>");
													out.print("<button type='button' onclick='readPagingSearchRM(" + (curPageC - 1) + ", " + countListC + ");' class='btn btn-default'>< 이전</button>");

												}
												for (int i = startPageC; i < endPageC + 1; i++) { 	// i 는 현재 페이지의 번호
													// 1~5, 6~10의 버튼들을 생성하는 부분
													//out.print("<a href=\"?scurPage_partenr=" + i + "\">"+i+"</a>");
													System.out.println("스타뚜" + customer_code);
													
													out.print("<button type='button' onclick='readPagingSearchRM(" + i + ", " + countListC + ", " + customer_code +");' class='btn btn-default'>" + i + "</button>");

												}
												if (curPageC < totalPageC) {
													// 
													
													//out.print("<a href=\"?scurPage_partenr=" + (curPage + 1) + "\">다음 ></a>");
													out.print("<button type='button' onclick='readPagingSearchRM(" + (curPageC + 1) + ", " + countListC +");' class='btn btn-default'> > 다음</button>");

												}
												if (endPageC < totalPageC)
													//out.print("<a href=\"?scurPage_partenr=" + totalPage + "\">끝</a>");
													out.print("<button type='button' onclick='readPagingSearchRM(" + totalPageC + ", " + countListC + ");' class='btn btn-default'> >> 끝</button>");
											%>
								</div>

	</div>



</body>
</html>