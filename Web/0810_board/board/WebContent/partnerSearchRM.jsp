<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="util.DatabaseUtil"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter"%>
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
	
	PreparedStatement pstmt = null;

	String sql;


		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String userCode = request.getParameter("userCode");
		String customer_code = request.getParameter("customer_code");


		if (customer_code.equals("")) {
			//out.print("기간만");
			//기간만
			//select * from customer where userCode="PKC222" and (DATE(c_billDate) between '2018/07/01' and '2018/09/01') order by c_billDate ;
			sql = "select * from customer where userCode=? and (DATE(c_billDate) between ? and ?) order by c_billDate ;";
			//"select t2.userCode, t1.c_billDate, t2.userCompany, t2.userName, t1.c_code, t1.c_name, t1.c_name, t1.c_plan, t1.c_calcul, t1.c_fee, t1.c_margin, t1.c_unpaid FROM customer as t1 join partner as t2 on t1.userCode = t2.userCode and DATE(t1.c_billDate) between ? and ? order by c_billDate";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userCode);
			pstmt.setString(2, startDate);
			pstmt.setString(3, endDate);

		} else {
			//파트너
			
			if (!customer_code.equals("")) {
				//고객만
				if (startDate.equals("") && startDate.equals("")) {
					//out.print("고객만");
					//and t1.c_code="PKC222-CK004"
					sql = "select * from customer where userCode=? and c_code=? order by c_billDate ;";
					//"select t2.userCode, t1.c_billDate, t2.userCompany, t2.userName, t1.c_code, t1.c_name, t1.c_name, t1.c_plan, t1.c_calcul, t1.c_fee, t1.c_margin, t1.c_unpaid FROM customer as t1 join partner as t2 on t1.userCode = t2.userCode and t1.c_code=? order by c_billDate";

					pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(1, userCode);
					pstmt.setString(2, customer_code);
					
				} else { //고객+기간
					//out.print("고객+기간");
					
					//select * from customer where userCode="PKC222" and (DATE(c_billDate) between '2018/07/01' and '2018/09/01') and c_code='PKC222-CK002' order by c_billDate ;
					sql = "select * from customer where userCode=? and (DATE(c_billDate) between ? and ?) and c_code=? order by c_billDate ;";
							//"select t2.userCode, t1.c_billDate, t2.userCompany, t2.userName, t1.c_code, t1.c_name, t1.c_name, t1.c_plan, t1.c_calcul, t1.c_fee, t1.c_margin, t1.c_unpaid FROM customer as t1 join partner as t2 on t1.userCode = t2.userCode and (DATE(t1.c_billDate) between ? and ?) and t1.c_code=? order by c_billDate";

					pstmt = conn.prepareStatement(sql);

					pstmt.setString(1, userCode);
					pstmt.setString(2, startDate);
					pstmt.setString(3, endDate);
					pstmt.setString(4, customer_code);
				}

			}

		}

		ResultSet rsRM = null;
		rsRM = pstmt.executeQuery();
		
	%>
	<div id="divTable">
											<table class="table" id="PRM_table" style="width: 1000px">
												<thead class="thead-light">
													<tr>
														<th scope="col" width="10px" nowrap
															style="text-align: center;"><input type="checkbox" name="PRM_index" id="PRM_index_main"/></th>
														<th scope="col" width="10px" nowrap
															style="text-align: center;">계산서발행일</th>
														<th scope="col" width="20px" nowrap
															style="text-align: center;">고객코드</th>
														<th scope="col" width="20px" nowrap
															style="text-align: center;">고객사명</th>
														<th scope="col" width="20px" style="text-align: center;">요금제</th>
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
                                             String billDate = rsRM.getString("c_billDate");
                                             String companyCode = rsRM.getString("c_code");
                                             String companyName = rsRM.getString("c_name");
                                             String plan = rsRM.getString("c_plan");
                                             String contract = rsRM.getString("c_calcul");
                                             String fee = rsRM.getString("c_fee");
                                             String margin = rsRM.getString("c_margin");
                                             String unpaid = rsRM.getString("c_unpaid");
                                       %>
                                       <th scope="row"><input type="checkbox" class="PRM_checkSelect" id="<%=companyCode%>" name="PRM_index" value=<%=companyCode%>/></th>
                                       <td width="5%"><%=billDate%></td>
                                       <td width="20%"><INPUT type="text" name="<%=companyCode%>0" id="<%=companyCode%>0" size="7" value=<%=companyCode%> readonly="readonly" style="border:0 solid black; text-align:center;"></td>
                                       <td width="20%"><%=companyName%></td>
                                       <td width="15%"><%=plan%></td>
                                       <td width="15%"><%=contract%></td>
                                       <td width="15%"><INPUT type="text" name="<%=companyCode%>1" id="<%=companyCode%>1" size="7" value=<%=fee%> readonly="readonly" style="border:0 solid black; text-align:center;"></td>
                                       
                                       <td width="15%"><INPUT type="text" name="<%=companyCode%>2" id="<%=companyCode%>2" size="7" value=<%=margin%> readonly="readonly" style="border:0 solid black; text-align:center;"></td>
                                       <td width="15%"><INPUT type="text" name="<%=companyCode%>3" id="<%=companyCode%>3" size="7" value=<%=unpaid%> readonly="readonly" style="border:0 solid black; text-align:center;"></td>
                                       
                                    </tr>
                                    <%
                                          }
                                       %>
													
												</tbody>
											</table>

</div>
	


	</body>
	</html>