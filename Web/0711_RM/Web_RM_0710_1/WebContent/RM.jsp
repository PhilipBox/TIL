<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
        <title>Result Management</title>
        <link rel="stylesheet" href="main.css">
        
<!-- 부트스트랩 CSS 추가하기 -->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<!-- 커스텀 CSS 추가하기 -->
<link rel="stylesheet" href="./css/custom.css">



<link rel="stylesheet" type="text/css" href="./assets/ng-cloudike-2.3.1-1.css">


			<script language="javascript">
				function spacing(num)
				{
		            for(i=0; i<num; i++)
                    {
                    document.write("&nbsp");
                    }
				}
				
				 var tbl;
				 //addRow()와 delRow()에서 모두 쓰기 위해
				function addRow()
				{
				 tbl=document.getElementById("changeTbl");
				 //dom을 쓰기 위해 객체 생성
				 
				 tbl.rows[tbl.clickedRowIndex].cells[1].innerHTML =
				 //클릭 이벤트 발생한 Row에 삭제 넣기   cell이 <td> 이고 row 가 <tr>
				    "<input type='button' value='삭제' onClick='delRow()'>";


				 //첫번째 row(tr)추가   
				 var oRow = tbl.insertRow();
				 oRow.onmouseover = function() { tbl.clickedRowIndex = this.rowIndex };
				 var oCell1 = oRow.insertCell();
				 var oCell2 = oRow.insertCell();

				 oCell1.innerHTML = "<input type='text'>";
				 oCell2.innerHTML = "<input type='button' value='추가' onClick='addRow()'> ";

				//두번째 row(tr) 추가
				 oRow = tbl.insertRow();
				 oRow.onmouseover = function() { tbl.clickedRowIndex = this.rowIndex };
				 var oCell1 = oRow.insertCell();
				 var oCell2 = oRow.insertCell();

				 oCell1.innerHTML = "시험";
				 oCell2.innerHTML = "<input type='text' value='추가' > ";

				//이렇게 구현했을 경우 문제 점은   row[0]번째 값을  삭제 했을때 원래의 테이블의 크기가 깨질수가 있다는 것이다.
				//그럴 경우 oCell1.width = 150; 요런식으로  addRow()에 각 row가 추가될때 마다 cell(td)크기를 지정해 주면 된다.
				              
				}
				function delRow()
				{


				 tbl.deleteRow(tbl.clickedRowIndex);
				 tbl.deleteRow(tbl.clickedRowIndex);


				}


			    
			    
            </script>




</head>
    
    <!--

 style="background-color:transparent;border:0 solid black;text-align:right;"

-->
    <body>
    
		<!--  최상단 : 등록 AREA  -->
        <div>
 <FORM method="post">
         
            &nbsp;<LABEL>계산서발행일</LABEL>
            	<INPUT type="text" name="bill_date" id="bill_date" size="5" style="border:2px solid #000000;">&nbsp;&nbsp;
         
         
            <LABEL>고객사명</LABEL>
            	<INPUT type="text" name="company_name" id="company_name" size="12" style="border:2px solid #000000;">&nbsp;&nbsp;
         
         
            <LABEL>요금제</LABEL>
            			<SELECT NAME="rate_system" id="rate_system" style="border:2px solid #000000;" >
                        <OPTION VALUE="1">Basic (50GB)</OPTION>
                        <OPTION VALUE="2">Standard (100GB)</OPTION>
                        <OPTION VALUE="3">Professional (300GB)</OPTION>
                        <OPTION VALUE="4">Custom (300G이상)</OPTION>
                </SELECT>&nbsp;&nbsp;

			<LABEL>계약단위(정산주기)</LABEL>
			            <SELECT NAME="contract_unit" id="contract_unit" style="border:2px solid #000000;">
                        <OPTION VALUE="1">3개월</OPTION>
                        <OPTION VALUE="2">6개월</OPTION>
                        <OPTION VALUE="3">1년</OPTION>
                </SELECT>&nbsp;&nbsp;
                
			<LABEL>요금</LABEL> 
				<INPUT type="text" NAME="fee" id="fee" SIZE="10" style="border:2px solid #000000;"> 원&nbsp;
         <BUTTON type="submit" class="btn" style="border:2px solid #737373;">등록</button>
      </FORM>
      
      
            &nbsp;&nbsp;<textarea name=content cols="24" rows="2" id="bill_date_info" style="background-color:transparent;border:0 solid black;font-size: 9pt; color:#737373; overflow:hidden;">해당건의 첫 계산서 발행일숫자8자리 ex)20180405</textarea>
			<SCRIPT type="text/javascript">
  				spacing(6);
            </SCRIPT>
            <textarea name=content cols="40" rows="2" id="bill_date_info" style="background-color:transparent;border:0 solid black; font-size: 9pt; color:#737373; overflow:hidden;">정확한 고객사명을 입력해 주세요.
기존 고객사명과 다를 경우 새로 등록됩니다.</textarea>
			<SCRIPT type="text/javascript">
  				spacing(46);
            </SCRIPT>

            <textarea name=content cols="40" rows="2" id="bill_date_info" style="background-color:transparent;border:0 solid black; font-size: 9pt; color:#737373; overflow:hidden;">매월청구 요금제:3개월
6개월/1년 계약은 동일하게 선택</textarea>
		<hr>

        </div>
        
        <!--  TABLE 상단 : 검색 AREA  -->
        <div>
		&nbsp;&nbsp;<BUTTON type="button" class="btn" style="border:2px solid #737373;">수정</button>
		&nbsp;&nbsp;<BUTTON type="button" class="btn" style="border:2px solid #737373;">삭제</button>
			<SCRIPT type="text/javascript">
  				spacing(20);
            </SCRIPT>
		
			<LABEL>기간 </LABEL>
				<SCRIPT type="text/javascript">
	  				spacing(4);
	            </SCRIPT>
			<form  method=post style="display:inline">
	            <INPUT type="text" name="start_year" id="start_year" size="2" style="border:2px solid #737373;">년&nbsp;&nbsp;
	            <INPUT type="text" name="start_month" id="start_month" size="1" style="border:2px solid #737373;">월 - 
	            
				<INPUT type="text" name="end_year" id="end_year" size="2" style="border:2px solid #737373;">년&nbsp;&nbsp;
	            <INPUT type="text" name="end_month" id="end_month" size="1" style="border:2px solid #737373;">월
	            
	            <BUTTON type="submit" class="btn" style="border:2px solid #737373;">검색</button>
            </form>
            	<SCRIPT type="text/javascript">
	  				spacing(4);
	            </SCRIPT>
			<form method="post" style="display:inline">
			<LABEL>고객사코드</LABEL>

            	<INPUT type="text" name="campany_code" id="campany_code" size="12" style="border:2px solid #737373;">&nbsp;&nbsp;
         		<BUTTON type="submit" class="btn" style="border:2px solid #737373;">검색</button>
			</form>
            <textarea name=content cols="15" rows="1" id="page_info" style="background-color:transparent;border:0 solid black; font-size: 9pt; color:#737373; overflow:hidden;">1page 1/1</textarea>
        </div>
       <hr>
       
       <!--  CUSTOMER INFORMATION TABLE -->
       <div>

			<table class="table" style="width:1000px">
			  <thead class="thead-light">
			    <tr>
			      <th scope="col" width="10px" nowrap>#</th>
			      <th scope="col" width="10px" nowrap>계산서발행일</th>
			      <th scope="col" width="20px" nowrap>고객코드</th>
			      <th scope="col" width="20px" nowrap>고객사명</th>
			      <th scope="col" width="20px">요금제</th>
			      <th scope="col" width="10px">정산주기</th>
			      <th scope="col" width="10px">요금</th>
			      <th scope="col" width="10px">마진</th>
			      <th scope="col" width="10px">미수금</th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			      <th scope="row">1</th>
			      <td width="5%">2018/07/10</td>
			      <td width="20%">PKP001-CK003</td>
			      <td width="20%">(주)메가스터디</td>
			      <td width="15%">프로페셔널</td>
			      <td width="15%">3개월</td>
			      <td width="15%">1,110,000</td>
			      <td width="15%">333,000</td>
			      <td width="15%">333,000</td>
			    </tr>
			    <tr>
			      <th scope="row">2</th>
			      <td width="5%">2018/11/01</td>
			      <td width="20%">PKP001-CK009</td>
			      <td width="20%">(주)KBS</td>
			      <td width="15%">커스텀</td>
			      <td width="15%">1년</td>
			      <td width="15%">1,110,000</td>
			      <td width="15%">333,000</td>
			      <td width="15%">333,000</td>
			    </tr>
			    <tr>
			      <th scope="row">3</th>
			      <td width="5%">2018/03/15</td>
			      <td width="20%">PKP001-CK007</td>
			      <td width="20%">(주)메가스터디</td>
			      <td width="15%">스탠다스</td>
			      <td width="15%">3개월</td>
			      <td width="15%">114,000</td>
			      <td width="15%">34,200</td>
			      <td width="15%">0</td>
			    </tr>
			  </tbody>
			</table>
       
       
       
       </div>
       
               <h4>전달받은 데이터</h4>
        <ul>
            <li>계산서발행일 : <%= request.getParameter("bill_date") %></li>
            <li>고객사명 : <%= request.getParameter("company_name") %></li>
            <li>요금제 : <%= request.getParameter("rate_system") %></li>
            <li>계약단위 : <%= request.getParameter("contract_unit") %></li>
            <li>요금 : <%= request.getParameter("fee") %></li>
        </ul>
        
        
        
                <h4>전달받은 데이터2</h4>
        <ul>
            <li>시작날짜 : <%= request.getParameter("start_year") %>년 <%= request.getParameter("start_month") %> 월 </li>
            <li>종료날짜 : <%= request.getParameter("end_year") %>년 <%= request.getParameter("end_month") %> 월 </li>
        </ul>
        
	                <h4>전달받은 데이터3</h4>
        <ul>
            <li>고객사코드 : <%= request.getParameter("campany_code") %></li>
           
        </ul>



       
       
       
       
       
       
    </body>