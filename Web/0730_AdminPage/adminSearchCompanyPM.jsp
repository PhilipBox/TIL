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

		String company = request.getParameter("company");

		
		sql = "select * from partner where userCompany=?";
		//"select t2.userCode, t1.c_billDate, t2.userCompany, t2.userName, t1.c_code, t1.c_name, t1.c_name, t1.c_plan, t1.c_calcul, t1.c_fee, t1.c_margin, t1.c_unpaid FROM customer as t1 join partner as t2 on t1.userCode = t2.userCode and (DATE(t1.c_billDate) between ? and ?) and t1.c_code=? order by c_billDate";

		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, company);

		ResultSet rsPM = null;
		rsPM = pstmt.executeQuery();
	%>
	<div id="divTableP">

		<table class="table" id="APM_table" style="width: 1200px;">
			<thead class="thead-light">
				<tr>
					<th scope="col" width="5px" nowrap><input type="checkbox"
						name="APM_index" id="APM_index_main" value="0" /></th>
					<th scope="col" width="10px" nowrap>계약시작일</th>
					<th scope="col" width="10px" nowrap>파트너코드</th>
					<th scope="col" width="10px" nowrap>회사명</th>
					<th scope="col" width="10px">이름</th>
					<th scope="col" width="10px">전화번호</th>
					<th scope="col" width="10px">이메일</th>
					<th scope="col" width="10px">계산서발행일</th>
					<th scope="col" width="10px">정산주기</th>
					<th scope="col" width="10px">마진율</th>
					<th scope="col" width="10px">사업자등록증</th>
					<th scope="col" width="10px">통장사본</th>
				</tr>
			</thead>


			<tr>


				<%
					while (rsPM.next()) {
						String APM_id = rsPM.getString("userCode");
						String APM_contDate = rsPM.getString("contDate");
						String APM_userCode = rsPM.getString("userCode");
						String APM_userCompany = rsPM.getString("userCompany");
						String APM_userName = rsPM.getString("userName");
						String APM_phoneNum = rsPM.getString("userTel");
						String APM_email = rsPM.getString("userEmail");
						String APM_billDate = rsPM.getString("billDate");
						String APM_calcul = rsPM.getString("calcul");
						String APM_margin = rsPM.getString("margin");
				%>


				<th scope="row" width="2%"><input type="checkbox"
					class="APM_checkSelect" id="<%=APM_id%>" name="APM_index"
					value=<%=APM_id%> /></th>
				<td width="5%"><%=APM_contDate%></td>
				<td width="8%"><INPUT type="text" NAME="<%=APM_id%>0"
					id="<%=APM_id%>0" SIZE="14" value="<%=APM_userCode%>"
					readonly="readonly"
					style="border: 0 solid black; text-align: center"></td>
				<td width="6%"><INPUT type="text" NAME="<%=APM_id%>1"
					id="<%=APM_id%>1" SIZE="14" value="<%=APM_userCompany%>"
					readonly="readonly"
					style="border: 0 solid black; text-align: center"></td>
				<td width="7%"><INPUT type="text" NAME="<%=APM_id%>2"
					id="<%=APM_id%>2" SIZE="5" value="<%=APM_userName%>"
					readonly="readonly"
					style="border: 0 solid black; text-align: center"></td>
				<td width="7%"><INPUT type="text" NAME="<%=APM_id%>3"
					id="<%=APM_id%>3" SIZE="11" value="<%=APM_phoneNum%>"
					readonly="readonly"
					style="border: 0 solid black; text-align: center"></td>

				<td width="10%"><INPUT type="text" NAME="<%=APM_id%>4"
					id="<%=APM_id%>4" SIZE="25" value="<%=APM_email%>"
					readonly="readonly"
					style="border: 0 solid black; text-align: center"></td>

				<td width="4%"><INPUT type="text" NAME="<%=APM_id%>5"
					id="<%=APM_id%>5" SIZE="3" value="<%=APM_billDate%>"
					readonly="readonly"
					style="border: 0 solid black; text-align: center;"></td>

				<td width="7%"><SELECT NAME="<%=APM_id%>6" disabled="disabled"
					id="<%=APM_id%>6" style="border: 1px bold #000000;">
						<OPTION VALUE="3개월">3 개월</OPTION>
						<OPTION VALUE="1개월">1 개월</OPTION>
				</SELECT></td>
				<td width="5%"><INPUT type="text" NAME="<%=APM_id%>7"
					id="<%=APM_id%>7" SIZE="3" value="<%=APM_margin%>"
					readonly="readonly"
					style="border: 0 solid black; text-align: center;"></td>
				<td width="7%">
					<BUTTON type="button"
						style="border: 2px solid #737373; width: 40px; height: 20px; font-size: 9px;">확인</button>
					<BUTTON type="button"
						style="border: 2px solid #737373; width: 40px; height: 20px; font-size: 9px;">수정</button>
				</td>
				<td width="7%">
					<BUTTON type="button"
						style="border: 2px solid #737373; width: 40px; height: 20px; font-size: 9px;">확인</button>
					<BUTTON type="button"
						style="border: 2px solid #737373; width: 40px; height: 20px; font-size: 9px;">수정</button>
				</td>
			</tr>
			<%
				}
			%>
		</table>



	</div>


</body>
</html>