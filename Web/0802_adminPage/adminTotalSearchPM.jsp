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


	<%
		Connection conn = DatabaseUtil.getConnection();

	// 파트너테이블
	Statement stmtPM = conn.createStatement();

	//실적관리 db로딩
	String sqlPM = "select * from partner";
	stmtPM.executeQuery(sqlPM);
	ResultSet rsPM = null;
	rsPM = stmtPM.executeQuery(sqlPM);
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
<%
stmtPM.close();
conn.close();
%>

</body>
</html>