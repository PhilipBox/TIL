<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>


<!DOCTYPE html>
<html>

<% request.setCharacterEncoding("UTF-8"); %>
<% response.setCharacterEncoding("UTF-8"); %>
<head>
<meta charset="utf-8">
<title>Coludike</title>
<style>
#homeLogo {
   margin: 10px;
   padding-right: 15px
}

table.type04 {
   border-collapse: separate;
   border-spacing: 1px;
   text-align: left;
   line-height: 1.5;
   border-top: 1px solid #ccc;
   margin: 10px 10px;
}

table.type04 th {
   width: 150px;
   padding: 5px;
   font-weight: bold;
   vertical-align: top;
   border-bottom: 1px solid #ccc;
}

table.type04 td {
   width: 350px;
   padding: 5px;
   vertical-align: top;
   border-bottom: 1px solid #ccc;
}
</style>

<!-- compiled CSS -->
<link rel="stylesheet" type="text/css"
   href="./css/ng-cloudike-2.3.1-1.css">
<!--Naver analytics script load-->
<script type="text/javascript"
   src="https://www.google-analytics.com/analytics.js"></script>
<script language="javascript"
   src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
   src="//www.googleadservices.com/pagead/conversion_async.js"></script>
<script src="https://www.googletagmanager.com/gtm.js?id=GTM-MTGXNT3"></script>
<script type="text/javascript" src="https://wcs.naver.net/wcslog.js"></script>
<script type="text/javascript">
   if (!wcs_add)
      var wcs_add = {};
   wcs_add["wa"] = "79c738b93c5b74";
   wcs.inflow();
   wcs_do();
   
   
	function spacing(num)
	{
        for(i=0; i<num; i++)
        {
        document.write("&nbsp");
        }
	}
   // ARM :  Admin Result Management
	function ARM_register_check()
	{
		var ARM_bill_date = document.ARM_register.ARM_bill_date;
		var ARM_datetime_pattern = /^(19|20)\d{2}(0[1-9]|1[012])(0[1-9]|[12][0-9]|3[0-1])$/; 

		

		var ARM_partner_code = document.ARM_register.ARM_partner_code;
		var ARM_partner_name = document.ARM_register.ARM_partner_name;
		var ARM_rate_system = document.ARM_register.ARM_rate_system;
		var ARM_fee = document.ARM_register.ARM_fee;	

		
		
		if(ARM_bill_date.value == '' || !(ARM_bill_date.value.length == 8) )
			{
				alert("계산서발행일을 정확히 입력해주세요.");
				return false;
			}
		else if (!ARM_datetime_pattern.test(ARM_bill_date.value))
		{
			alert("올바른 날짜 형식이 아닙니다.")
			return false;
		}
		else if(ARM_partner_code.value == "")
		{
			alert("파트너 코드를 입력해주세요..");	
			return false;
		}
		else if(ARM_partner_name.value =="")
		{
			alert("고객사 이름을 입력해주세요.");
			return false;
		}
		else if(ARM_rate_system.value == 0)
		{
			alert("요금제를 선택해주세요.");
	        return false;
		}		
		else if(ARM_rate_system.value == 4 && ARM_fee.value.length == 0)
		{
			alert("커스텀 요금을 입력해주세요.");
	        return false;
		}
	}
	
	function ARM_convert_fee(frm)
	{
		var ARM_fee = frm.ARM_rate_system.selectedIndex;
		
		 switch(ARM_fee){
		   case 0:
		     frm.ARM_fee.value = '요금제미선택';
		     $("input[name='fee']").attr("readonly",true);
			 break;
		   case 1:
		     frm.ARM_fee.value = '100,000';
		     $("input[name='fee']").attr("readonly",true);
			 break;
		   case 2:
		     frm.ARM_fee.value = '400,000';
		     $("input[name='fee']").attr("readonly",true);
			 break;
		   case 3:
		     frm.ARM_fee.value = '1,000,000';
		     $("input[name='fee']").attr("readonly",true);
			 break;
		   case 4:
			   frm.ARM_fee.value = '';
			 $("input[name='fee']").attr("readonly",false);
			 break;
			   
		 }
		 return true;
	}// end ARM_convert_fee(frm) function
	
	
	
	
	function ARM_modify_btn_clicked() 
	{
			alert("수정버튼이 눌렸습니다.");
            var input = document.getElementById("ARM_ok");
            input.style.display="inline";
            input.style.border="2px solid blue";
            
            
            var table_fee = document.getElementById("ARM_table_fee");
            $('#ARM_table_fee').attr("readonly", false);
            table_fee.style.border="1px solid #737373";
            
            var table_margin = document.getElementById("ARM_table_margin");
            $('#ARM_table_margin').attr("readonly", false);
            table_margin.style.border="1px solid #737373";
            
            var table_unpaid = document.getElementById("ARM_table_unpaid");
            $('#ARM_table_unpaid').attr("readonly", false);
            table_unpaid.style.border="1px solid #737373";

            
            
            var output = document.getElementById("ARM_modify");
            output.style.display="none";
            
            
            
           
			
	} //end ARM_modify_btn_clicked()
		
	
	function ARM_delete_btn_clicked() 
	{
			alert("삭제버튼이 눌렸습니다.");
	} //end ARM_delete_btn_clicked()
	
	
	function ARM_ok_btn_clicked() 
	{
	        var output = document.getElementById("ARM_modify");
	        output.style.display="inline";
	        
			
	        var input = document.getElementById("ARM_ok");
	        input.style.display="none";
	        
	        alert("수정이 완료되었습니다.");
	        


	        
            var table_fee2 = document.getElementById("ARM_table_fee");
            $('#ARM_table_fee').attr("readonly", true);
            table_fee2.style.border="0 solid blue";
            
            var table_margin2 = document.getElementById("ARM_table_margin");
            $('#ARM_table_margin').attr("readonly", true);
            table_margin2.style.border="0 solid blue";
            
            var table_unpaid2 = document.getElementById("ARM_table_unpaid");
            $('#ARM_table_unpaid').attr("readonly", true);
            table_unpaid2.style.border="0 solid blue";
	        
	        
            
	        
            // TABLE 내에서 수정된 값들을 new_table_fee/margin/unpaid에 저장해 두었음.
            
			var new_table_fee = document.getElementById("ARM_table_fee");
			alert(new_table_fee.value);
	        
	        
			var new_table_margin = document.getElementById("ARM_table_margin");
			alert(new_table_margin.value);
	        
	        
			var new_table_unpaid = document.getElementById("ARM_table_unpaid");
			alert(new_table_unpaid.value);
	        
            
            
            
	     // table의 요금/마진/미납금의 값을 업데이트 하고,  테두리가 없는 값으로 활성화 시켜야함
	     
	} //end ARM_ok_btn_clicked()
	
	

</script>
<script type="text/javascript">
    
  
    function profile_edit_click(){
   $("input[name='profile']").attr("readonly",false);
    }
    
    // 계산서 발행일, 이름, 전화번호의 확인/등록 버튼
    function name_ok_click(){
       alert("이름; 수정되었습니다!");
       $("input[name='profile']").attr("readonly",true);
       //$('#profile_name').prop('readonly', false);

    }
    function phone_ok_click(){
       alert("전화번호; 수정되었습니다!");
       $("input[name='profile']").attr("readonly",true);
       //$('#profile_name').prop('readonly', false);

    }
    function calcul_ok_click(){
       alert("계산서 발행일; 등록되었습니다!");
    }
    function account_ok_click(){
       alert("통장사본; 등록되었습니다!");
    }
    
    
    function ARM_period_btn_clicked()
    {
    	
    	// 날짜 받는거에 대한 예외처리는 조금 다듬으면 된다. 
    	
    	var got_start_year = document.getElementById("start_year").value;
    	var got_start_month = document.getElementById("start_month").value;
    	
    	var got_end_year = document.getElementById("end_year").value;
    	var got_end_month = document.getElementById("end_month").value;
		
    	
    	
    	if(got_start_month.length==1 && got_start_month<10)
		{
			 got_start_month = "0".concat(got_start_month);
		}
    	
    	if(got_end_month.length==1 && got_end_month<10)
		{
			 got_end_month = "0".concat(got_end_month);
		}
    	

		var start_period = got_start_year.concat(got_start_month);
		var end_period = got_end_year.concat(got_end_month);
		alert(start_period + " 부터 " + end_period + " 까지 검색합니다.");
		
    	
    	
    }
    
    
    function ARM_search_btn_clicked()
    {
    	var got_customer_code = document.getElementById("ARM_customer_code_for_search").value;
    	var got_partner_code = document.getElementById("ARM_partner_code_for_search").value;
    	
		alert("파트너 코드 : "+got_partner_code + "  고객 코드 : " + got_customer_code);
 		
    }
    
    
    </script>
<script
   src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/835808530/?random=1531139707988&amp;cv=9&amp;fst=1531139707988&amp;num=1&amp;label=Cloudike%20KR%20Remarketing&amp;guid=ON&amp;resp=GooglemKTybQhCsO&amp;u_h=864&amp;u_w=1536&amp;u_ah=824&amp;u_aw=1536&amp;u_cd=24&amp;u_his=2&amp;u_tz=540&amp;u_java=false&amp;u_nplug=3&amp;u_nmime=4&amp;gtm=G6c&amp;sendb=1&amp;frm=0&amp;url=https%3A%2F%2Fasd.cloudike.kr%2Foauth%3Fuse_ajax%3D1&amp;async=1&amp;rfmt=3&amp;fmt=4"></script>

<style type="text/css">

	#ARM_table{
		
		
		 text-align:center;
		 font-size : 12px;

	}


	


</style>
</head>

<body class="full-height body-gray body-scroll">

   <div class="ng-file-over-container">
      <div class="ng-file-over-wrapper">
         <div></div>
         <i class="icon icon-upload text-muted"></i>
         <div class="ng-file-over-screen"></div>
      </div>
   </div>

   <!-- uiView: navbar -->
   <div class="ng-scope">
      <div class="header b-nav ng-scope">
         <div class="navbar navbar-static-top b-nav__navbar">
            <div class="navbar-header">
               <img id="homeLogo" alt="Cloudikes" src="./assets/Coludike_logo.png">
               Cloudike Partners Support System
            </div>
            <div class="collapse navbar-collapse b-nav__menubar">
               <!--div ui-view="navbar-menu"></div-->
               <!-- ngIf: $root.screenSize.xs -->
               <div class="ng-scope"></div>
               <!--오른쪽에 이름-->
               <ul class="nav navbar-nav navbar-right cuser-menu-wrap">
                  <!-- ngIf: CurrentUser.userid -->
                  <li class="ng-scope">
                     <ul class="cuser-menu cuser-active-menu">
                        <li>
                           <div id="profile_menu" class="btn-group b-group-usermenu"
                              dropdown="">
                              <a href="" dropdown-toggle=""> <span
                                 class="cuser-name ng-binding">유수화</span> <span class="caret"></span>
                              </a>
                              <ul class="dropdown-menu">
                                 <li><a ui-sref="profile" href="/profile"><span
                                       translate="" class="ng-scope">프로필 / 설정</span></a></li>
                                 <li><a ui-sref="signout" href="/signout"><span
                                       translate="" class="ng-scope">로그아웃</span></a></li>
                              </ul>
                           </div>
                        </li>

                        <li>
                           <div id="notice_menu" class="btn-group" dropdown="">
                              <a class="visible-xs mar-r-0-xs" disabled="disabled">
                                 <!-- ngIf: $root.MyNotices.length --> <!-- ngIf: !$root.MyNotices.length -->
                                 <span class="cuser-btn ng-scope" translate="">알림 없음</span>
                              <!-- end ngIf: !$root.MyNotices.length -->
                              </a> <a class="hidden-xs" href="" dropdown-toggle=""
                                 disabled="disabled"> <span class="cuser-btn ng-scope"
                                 translate="">알림 없음</span>
                              <!-- end ngIf: !$root.MyNotices.length --> <span class="caret"></span>
                              </a>

                              <div
                                 class="dropdown-menu b-nav__navbar__eventlist ng-isolate-scope">
                                 <ul class="b-list__events">
                                    <!-- ngRepeat: item in notices | orderBy:sort -->
                                 </ul>
                              </div>
                           </div>
                        </li>
                     </ul>
                  </li>
                  <!-- end ngIf: CurrentUser.userid -->
                  <!-- ngIf: !CurrentUser.userid -->
               </ul>

            </div>
         </div>
      </div>
   </div>

   <div class="container-fluid g-layout g-layout__toolbar">
      <div class="position-relative">
         <!-- uiView: toolbar -->
         <div class="ng-scope">
            <div class="row ng-scope">
               <!-- ngIf: opts.oneColumn !== true -->
               <div class="g-sidebarview ng-scope"></div>
               <!-- end ngIf: opts.oneColumn !== true -->
               <div class="g-toolbar g-mainview"></div>
            </div>
         </div>
      </div>
   </div>
   <!-- uiView: preview -->
   <div class="ng-scope"></div>

   <!-- uiView: layout -->
   <div
      class="container-fluid g-layout g-layout__layout full-height ng-scope">
      <div class="row full-height ng-scope">
         <!-- uiView: sidebar -->
         <div class="g-sidebarview full-height ng-scope">
            <!-- uiView: sidebar-top -->
            <div class="g-sidebar-info-container full-height ng-scope">
               <div class="metadata-tree b-menu ng-scope ng-isolate-scope">
                  <!-- ngIf: folder.folder -->
                  <ul class="nav nav-pills nav-stacked ng-scope">
                     

                     <li class="single-item active ng-scope"><a
                        class="b-menu__item-link"
                        href="http://localhost:8080/CloudikePartner/myPage.jsp"><span><span
                              translate="" class="ng-scope">내 정보 관리</span></span></a></li>
                     <li class="single-item ng-scope"><a
                        class="b-menu__item-link"
                        href="http://localhost:8080/CloudikePartner/join.jsp"><span><span
                              translate="" class="ng-scope">실적 관리</span></span></a></li>
                     <!-- end ngIf: folder.isRoot -->
                  </ul>
                  <!-- end ngIf: folder.folder -->
               </div>
            </div>

         </div>
         <!-- uiView: main -->
         <div class="g-mainview layout-col-pad full-height ng-scope">
            <div class="row full-height ng-scope">
               <div class="col-md-12 b-content-wrap full-height">
                  <div class="full-height ng-isolate-scope" style="display: none;">
                     <div class="b-content b-content-empty">
                        <span></span>
                        <div class="empty-wrap">
                           <i class="empty-icon"></i>
                           <div class="empty-drop">
                              <span></span>
                           </div>
                        </div>
                     </div>
                  </div>


                  <div class="b-fullheight ng-isolate-scope b-content">
                     <!-- ngIf: viewType == 'list' -->
                     <div class="ng-scope">
                        <!-- ngInclude: 'clFolderContents/folderContentsAsList.tpl.html' -->
                        <div class="ng-scope">

	<!--  전체 div 시작점  -->
	<div style="margin-top:20px; margin-left:20px;"> 
                          
			<div>
			 <FORM method="post" name="ARM_register" id="ARM_register" onsubmit="return ARM_register_check();">
            &nbsp;<LABEL>계산서발행일</LABEL>
            	<INPUT type="text" name="ARM_bill_date" id="ARM_bill_date" size="5" style="border:2px solid #000000;">&nbsp;&nbsp;
         
            <LABEL>파트너코드</LABEL>
            	<INPUT type="text" name="ARM_partner_code" id="ARM_partner_code" size="12" style="border:2px solid #000000;">&nbsp;&nbsp;  
         
         
            <LABEL>고객사명</LABEL>
            	<INPUT type="text" name="ARM_partner_name" id="ARM_partner_name" size="12" style="border:2px solid #000000;">&nbsp;&nbsp;
         
         
            <LABEL>요금제</LABEL>
            			<SELECT NAME="ARM_rate_system" id="ARM_rate_system" onchange="ARM_convert_fee(this.form)" style="border:2px solid #000000;" >
            			<OPTION VALUE="0">선택</OPTION>
                        <OPTION VALUE="1">Basic (50GB)</OPTION>
                        <OPTION VALUE="2">Standard (100GB)</OPTION>
                        <OPTION VALUE="3">Professional (300GB)</OPTION>
                        <OPTION VALUE="4">Custom (300G이상)</OPTION>
                </SELECT>&nbsp;&nbsp;

			<LABEL>정산주기</LABEL>
			            <SELECT NAME="ARM_contract_unit" id="ARM_contract_unit" style="border:2px solid #000000;">
                        <OPTION VALUE="1" >3개월</OPTION>
                        <OPTION VALUE="2">6개월</OPTION>
                        <OPTION VALUE="3">1년</OPTION>
                </SELECT>&nbsp;&nbsp;
                
			<LABEL>요금</LABEL> 
				<INPUT type="text" NAME="ARM_fee" id="ARM_fee" SIZE="10" style="border:2px solid #000000;"> 원&nbsp;
         <BUTTON type="submit" class="btn" style="border:2px solid #737373;">등록</button>
      </FORM>
            &nbsp;&nbsp;<textarea name=content cols="30" rows="3" id="ARM_bill_date_info" style="background-color:transparent;border:0 solid black;font-size: 9pt; color:#737373; overflow:hidden;">해당건의 첫 계산서 발행일   숫자8자리 ex)20180405</textarea>
			<SCRIPT type="text/javascript">
  				spacing(50);
            </SCRIPT>
            <textarea name=content cols="45" rows="3" id="ARM_company_name_info" style="background-color:transparent;border:0 solid black; font-size: 9pt; color:#737373; overflow:hidden;">정확한 고객사명을 입력해 주세요.
기존 고객사명과 다를 경우 새로 등록됩니다.</textarea>
			<SCRIPT type="text/javascript">
  				spacing(46);
            </SCRIPT>

            <textarea name=content cols="40" rows="3" id="ARM_contract_unit_info" style="background-color:transparent;border:0 solid black; font-size: 9pt; color:#737373; overflow:hidden;">매월청구 요금제:3개월
6개월/1년 계약은 동일하게 선택</textarea>
		<hr>

        </div>
        
        <!--  TABLE 상단 : 검색 AREA  -->
        <div>
         <FORM method="post" name="ARM_btn_event" id="ARM_btn_event" style="display:inline">
		<BUTTON type="button" class="btn" id="ARM_modify" name="ARM_modify" onclick="ARM_modify_btn_clicked() " style="border:2px solid #737373;">수정</button>
		<BUTTON type="button" class="btn" id="ARM_ok" name="ARM_ok" onclick="ARM_ok_btn_clicked() " style="border:2px solid #737373; display:none;">확인</button>
		&nbsp;&nbsp;<BUTTON type="button" class="btn" id="ARM_delete" name="ARM_delete" onclick="ARM_delete_btn_clicked() " style="border:2px solid #737373;">삭제</button>
		</FORM>
			<SCRIPT type="text/javascript">
  				spacing(20);
            </SCRIPT>
		
			<LABEL>기간 </LABEL>
				<SCRIPT type="text/javascript">
	  				spacing(1);
	            </SCRIPT>
			<form  method=post name="ARM_search_period" id="ARM_search_period" style="display:inline">
	            <INPUT type="text" name="start_year" id="start_year" size="2" style="border:2px solid #737373;">년&nbsp;&nbsp;
	            <INPUT type="text" name="start_month" id="start_month" size="1" style="border:2px solid #737373;">월 - 
	            
				<INPUT type="text" name="end_year" id="end_year" size="2" style="border:2px solid #737373;">년&nbsp;&nbsp;
	            <INPUT type="text" name="end_month" id="end_month" size="1" style="border:2px solid #737373;">월
	            
	            <BUTTON type="submit" class="btn" id="ARM_period_btn" name="ARM_period_btn" onclick="ARM_period_btn_clicked()" style="border:2px solid #737373;">검색</button>
            </form>
            	<SCRIPT type="text/javascript">
	  				spacing(4);
	            </SCRIPT>
			<form method="post" style="display:inline">
				<LABEL>파트너코드</LABEL>
            	<INPUT type="text" name="ARM_partner_code_for_search" id="ARM_partner_code_for_search" size="12" style="border:2px solid #737373;">&nbsp;&nbsp;

				<LABEL>고객코드</LABEL>
            	<INPUT type="text" name="ARM_customer_code_for_search" id="ARM_customer_code_for_search" size="12" style="border:2px solid #737373;">&nbsp;&nbsp;            	
            	
         		<BUTTON type="submit" class="btn" onclick="ARM_search_btn_clicked()" style="border:2px solid #737373;">검색</button>
			</form>
            <textarea name=content cols="15" rows="1" id="page_info" style="background-color:transparent;border:0 solid black; font-size: 9pt; color:#737373; overflow:hidden;">1page 1/1</textarea>
        </div>
     <hr>
       
       <!--  CUSTOMER INFORMATION TABLE -->
       <div>
			<form method="post" id="ARM_table_form" name="ARM_table_form">
			<table class="table" id="ARM_table" style="width:1100px;">
			  <thead class="thead-light" >
			    <tr style="text-align:center;">
			      <th scope="col" width="5px"  nowrap style="text-align:center;"><input type="checkbox" name="ARM_index" value="0"/></th>
			      <th scope="col" width="10px" nowrap style="text-align:center;">계산서발행일</th>
			      <th scope="col" width="10px" nowrap style="text-align:center;">파트너사</th>
			      <th scope="col" width="10px" nowrap style="text-align:center;">파트너명</th>
			      <th scope="col" width="10px" style="text-align:center;">고객코드</th>
			      <th scope="col" width="10px" style="text-align:center;">고객사명</th>
			      <th scope="col" width="10px" style="text-align:center;">요금제</th>
			      <th scope="col" width="10px" style="text-align:center;">정산주기</th>
			      <th scope="col" width="10px" style="text-align:center;">요금</th>
			      <th scope="col" width="10px" style="text-align:center;">마진</th>
			      <th scope="col" width="10px" style="text-align:center;">미납금</th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			      <th scope="row" width="2%">1</th>
			      <td width="5%">2018/07/10</td>
			      <td width="8%">(주)영우디지탈</td>
			      <td width="8%">문지환환</td>
			      <td width="7%">PKP001-CK003</td>
			      <td width="7%">(주)다스베이더</td>
			      <td width="7%">프로페셔날</td>
			      <td width="8%">6개월</td>				
			      <td width="7%"><INPUT type="text" name="ARM_table_fee" id="ARM_table_fee" size="7" value="1,000,000" readonly="readonly" style="border:0 solid black; text-align:center;"></td>
			      <td width="5%"><INPUT type="text" name="ARM_table_margin" id="ARM_table_margin" size="7" value="900,000" readonly="readonly" style="border:0 solid black; text-align:center;"></td>
			      <td width="7%"><INPUT type="text" name="ARM_table_unpaid" id="ARM_table_unpaid" size="7" value="450,000" readonly="readonly" style="border:0 solid black; text-align:center;"></td>
			    </tr>
			    <tr>
			      <th scope="row" width="2%">1</th>
			      <td width="5%">2018/07/10</td>
			      <td width="8%">(주)영우디지탈</td>
			      <td width="8%">문지환환</td>
			      <td width="7%">PKP001-CK003</td>
			      <td width="7%">(주)다스베이더</td>
			      <td width="7%">프로페셔날</td>
			      <td width="8%">6개월</td>
			      <td width="7%">1,100,000</td>
			      <td width="5%">900,000</td>
			      <td width="7%">450,000</td>
			    </tr>
			    
			  </tbody>
			</table>
       
       </form>
       
       </div>
</div>
       
       
			<h4>전달받은 데이터</h4>
		        <ul>
		            <li>계산서발행일 : <%= request.getParameter("ARM_bill_date") %></li>
		            <li>파트너코드 : <%= request.getParameter("ARM_partner_code") %></li>
		            <li>고객사명: <%= request.getParameter("ARM_partner_name") %></li>
		            <li>요금제 : <%= request.getParameter("ARM_rate_system") %></li>
		            <li>정산주기 : <%= request.getParameter("ARM_contract_unit") %></li>
		            <li>요금 : <%= request.getParameter("ARM_fee") %></li>		            
		        </ul>
			<h4>전달받은 데이터2&3</h4>
		        <ul>
		            <li>이름 : <%= request.getParameter("start_year") %></li>
		            <li>회사명 : <%= request.getParameter("end_month") %></li>
		        </ul>
                      
                           
                        </div>
                     </div>
                     <!-- end ngIf: viewType == 'list' -->
                     <!-- ngIf: viewType == 'grid' -->
                  </div>

               </div>
            </div>
         </div>
      </div>
   </div>


   <!-- compiled JavaScript -->
   <script type="text/javascript"
      src="/js/app-config.js"></script>
   <script type="text/javascript"
      src="/js/ng-cloudike-2.3.1-1.js"></script>


</body>
</html>