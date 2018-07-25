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
   
	function register_check()
	{
		var bill_date = document.PTNregister.bill_date;
		var datetime_pattern = /^(19|20)\d{2}(0[1-9]|1[012])(0[1-9]|[12][0-9]|3[0-1])$/; 

		
		var contract_date = document.PTNregister.contract_date;
		var company_name = document.PTNregister.company_name;
		var partner_name = document.PTNregister.partner_name;
		var phone_number = document.PTNregister.phone_number;
		var email = document.PTNregister.email;
		

		
		
		if(contract_date.value == '' || !(contract_date.value.length == 8) )
			{
				alert("계약시작일을 정확히 입력해주세요.");
				return false;
			}
		else if (!datetime_pattern.test(contract_date.value))
		{
			alert("올바른 날짜 형식이 아닙니다.")
			return false;
		}
		else if(company_name.value == "")
			{
				alert("회사명을 입력해주세요.");	
				return false;
			}
		else if(partner_name.value == "")
			{
				alert("이름을 선택해주세요.");
				return false;
			}
		else if(phone_number.value == "")
		{
				alert("전화번호를 입력해주세요.");
				return false;
		}
		else if(email.value == "")
		{
				alert("이메일을 입력해주세요.");
				return false;
		}
	}
	
	function convert_fee(frm)
	{
		var fee = frm.rate_system.selectedIndex;
		
		 switch(fee){
		   case 0:
		     frm.fee.value = '요금제미선택';
		     $("input[name='fee']").attr("readonly",true);
			 break;
		   case 1:
		     frm.fee.value = '100,000';
		     $("input[name='fee']").attr("readonly",true);
			 break;
		   case 2:
		     frm.fee.value = '400,000';
		     $("input[name='fee']").attr("readonly",true);
			 break;
		   case 3:
		     frm.fee.value = '1,000,000';
		     $("input[name='fee']").attr("readonly",true);
			 break;
		   case 4:
			   frm.fee.value = '';
			 $("input[name='fee']").attr("readonly",false);
			 break;
			   
		 }
		 return true;
	}
	
	
	function APM_name_search_btn()
	{
		var got_name = document.getElementById("search_name").value;
    	alert(got_name);
		
	}
	
	function APM_company_search_btn()
	{
		var got_company = document.getElementById("search_campany").value;
    	alert(got_company);
		
	}
	
	
	function APM_modify_btn_clicked()
	{
		
		alert("수정버튼이 눌렸습니다.");
        var input = document.getElementById("APM_ok");
        input.style.display="inline";
        input.style.border="2px solid blue";
        
        
        var APMcompany_name = document.getElementById("APM_company_name");
        $('#APM_company_name').attr("readonly", false);
        APMcompany_name.style.border="1px solid #737373";
        
        var APMpartner_name = document.getElementById("APM_partner_name");
        $('#APM_partner_name').attr("readonly", false);
        APMpartner_name.style.border="1px solid #737373";
        
        var APMphone_number = document.getElementById("APM_phone_number");
        $('#APM_phone_number').attr("readonly", false);
        APMphone_number.style.border="1px solid #737373";
        
        var APMemail = document.getElementById("APM_email");
        $('#APM_email').attr("readonly", false);
        APMemail.style.border="1px solid #737373";
        
        var APMbill_date = document.getElementById("APM_bill_date");
        $('#APM_bill_date').attr("readonly", false);
        APMbill_date.style.border="1px solid #737373";

        var APMmargin = document.getElementById("APM_margin");
        $('#APM_margin').attr("readonly", false);
        APMmargin.style.border="1px solid #737373";        
        
        var APMcalculate_period = document.getElementById("APM_calculate_period");
        $('#APM_calculate_period').attr("readonly", false);
        APMcalculate_period.style.border="1px solid #737373";          
        
        
        var output = document.getElementById("APM_modify");
        output.style.display="none";
	}
	
	
	
	function APM_ok_btn_clicked() 
	{
	        var output = document.getElementById("APM_modify");
	        output.style.display="inline";
	        
			
	        var input = document.getElementById("APM_ok");
	        input.style.display="none";
	        
	        alert("수정이 완료되었습니다.");
	        


	        
	        
	        var APMcompany_name = document.getElementById("APM_company_name");
	        $('#APM_company_name').attr("readonly", true);
	        APMcompany_name.style.border="0 solid #737373";
	        
	        var APMpartner_name = document.getElementById("APM_partner_name");
	        $('#APM_partner_name').attr("readonly", true);
	        APMpartner_name.style.border="0 solid #737373";
	        
	        var APMphone_number = document.getElementById("APM_phone_number");
	        $('#APM_phone_number').attr("readonly", true);
	        APMphone_number.style.border="0 solid #737373";
	        
	        var APMemail = document.getElementById("APM_email");
	        $('#APM_email').attr("readonly", true);
	        APMemail.style.border="0 solid #737373";
	        
	        var APMbill_date = document.getElementById("APM_bill_date");
	        $('#APM_bill_date').attr("readonly", true);
	        APMbill_date.style.border="0 solid #737373";
	        
	        var APMmargin = document.getElementById("APM_margin");
	        $('#APM_margin').attr("readonly", true);
	        APMmargin.style.border="0 solid #737373";	        
	        
	        
	        var APMcalculate_period = document.getElementById("APM_calculate_period");
	        $('#APM_calculate_period').attr("readonly", true);
	        APMcalculate_period.style.border="0 solid #737373";	
	        
	        
        
	        
            // TABLE 내에서 수정된 값들을 저장해 두었음.
            
			var new_company_name= document.getElementById("APM_company_name");
			alert(new_company_name.value);
	        
			var new_partner_name= document.getElementById("APM_partner_name");
			alert(new_partner_name.value);
	        
			var new_phone_number= document.getElementById("APM_phone_number");
			alert(new_phone_number.value);
	        
			var new_email= document.getElementById("APM_email");
			alert(new_email.value);
			
			var new_bill_date= document.getElementById("APM_bill_date");
			alert(new_bill_date.value);
			
			var new_period = document.getElementById("APM_calculate_period");
			alert(new_period.value);			
			
			var new_margin = document.getElementById("APM_margin");
			alert(new_margin.value);
			
            
	    
	     
	} //end APM_ok_btn_clicked()
	
   
	
	function APM_license_register_btn()
	{
		
        var register_btn = document.getElementById("APM_license_register");
        register_btn.style.display="none";
        
		
        var ok_btn = document.getElementById("APM_license_ok");
        ok_btn.style.display="inline";
        
        
        var modify_btn = document.getElementById("APM_license_modify");
        modify_btn.style.display="inline";
        
        alert("등록이 완료되었습니다.");
        
		
		
	}
	
	
	function APM_delete_btn_clicked() 
	{
			alert("삭제버튼이 눌렸습니다.");
	} //end ARM_delete_btn_clicked()
	
	
	
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
    </script>
<script
   src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/835808530/?random=1531139707988&amp;cv=9&amp;fst=1531139707988&amp;num=1&amp;label=Cloudike%20KR%20Remarketing&amp;guid=ON&amp;resp=GooglemKTybQhCsO&amp;u_h=864&amp;u_w=1536&amp;u_ah=824&amp;u_aw=1536&amp;u_cd=24&amp;u_his=2&amp;u_tz=540&amp;u_java=false&amp;u_nplug=3&amp;u_nmime=4&amp;gtm=G6c&amp;sendb=1&amp;frm=0&amp;url=https%3A%2F%2Fasd.cloudike.kr%2Foauth%3Fuse_ajax%3D1&amp;async=1&amp;rfmt=3&amp;fmt=4"></script>

<style>

	th, td{
			margin: auto;
			text-align: center;
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
 			<FORM method="post" name="PTNregister" id="PTNregister" onsubmit="return register_check();">
         
            &nbsp;<LABEL>계약시작일</LABEL>
            	<INPUT type="text" name="contract_date" id="contract_date" size="10" style="border:2px solid #000000;">
         	<SCRIPT type="text/javascript">
  				spacing(6);
            </SCRIPT>
         
         
            <LABEL>회사명	</LABEL>
            	<INPUT type="text" name="company_name" id="company_name" size="15" style="border:2px solid #000000;">
         	<SCRIPT type="text/javascript">
  				spacing(6);
            </SCRIPT>         
        
            <LABEL>이름</LABEL>
            	<INPUT type="text" name="partner_name" id="partner_name" size="8" style="border:2px solid #000000;">
         	<SCRIPT type="text/javascript">
  				spacing(6);
            </SCRIPT>


			<LABEL>전화번호</LABEL>
			            <INPUT type="text" name="phone_number" id="phone_number" size="14" style="border:2px solid #000000;">
         	<SCRIPT type="text/javascript">
  				spacing(6);
            </SCRIPT>
                
			<LABEL>이메일</LABEL> 
				<INPUT type="text" NAME="email" id="email" SIZE="23" style="border:2px solid #000000;">
         	<SCRIPT type="text/javascript">
  				spacing(4);
            </SCRIPT>
         <BUTTON type="submit" class="btn" style="border:2px solid #737373;">등록</button>
      </FORM>
            &nbsp;&nbsp;<textarea name=content cols="25" rows="3" id="bill_date_info" style="background-color:transparent;border:0 solid black;font-size: 9pt; color:#737373; overflow:hidden;">최초 계산서 발행일      숫자8자리 ex)20180405</textarea>
			<SCRIPT type="text/javascript">
  				spacing(4);
            </SCRIPT>
            <textarea name=content cols="45" rows="3" id="bill_date_info" style="background-color:transparent;border:0 solid black; font-size: 9pt; color:#737373; overflow:hidden;">정확한 회사명을 입력해 주세요.
기존 회사명과 다를 경우 새로 등록됩니다.</textarea>
		<hr>

        </div>
        
        <!--  TABLE 상단 : 검색 AREA  -->
        <div>
			<BUTTON type="button" class="btn" id="APM_modify" name="APM_modify" onclick="APM_modify_btn_clicked()" style="border:2px solid #737373;">수정</button>
         	<BUTTON type="button" class="btn" id="APM_ok" name="APM_ok" onclick="APM_ok_btn_clicked() " style="border:2px solid #737373; display:none;">확인</button>
         	<SCRIPT type="text/javascript">
  				spacing(2);
            </SCRIPT>
		&nbsp;&nbsp;<BUTTON type="button" class="btn" id="APM_delete" name="APM_delete" onclick="APM_delete_btn_clicked()" style="border:2px solid #737373;">삭제</button>
			<SCRIPT type="text/javascript">
  				spacing(84);
            </SCRIPT>
		
			<form  method=post id="APM_name_search" name="APM_name_search" style="display:inline">
					<LABEL>이름 </LABEL>
						<SCRIPT type="text/javascript">
			  				spacing(2);
			            </SCRIPT>
					
			            <INPUT type="text" name="search_name" id="search_name" size="10" style="border:2px solid #737373;">
		         	<SCRIPT type="text/javascript">
		  				spacing(2);
		            </SCRIPT>
			            
			            <BUTTON type="submit" class="btn" onclick="APM_name_search_btn()"style="border:2px solid #737373;">검색</button>
          	 </form>
          	 
            	<SCRIPT type="text/javascript">
	  				spacing(16);
	            </SCRIPT>
	           
			<form method="post" id="APM_company_search" name="APM_company_search" style="display:inline">
						<LABEL>회사명</LABEL>
		         	<SCRIPT type="text/javascript">
		  				spacing(2);
		            </SCRIPT>
		            	<INPUT type="text" name="search_campany" id="search_campany" size="17" style="border:2px solid #737373;">
		         	<SCRIPT type="text/javascript">
		  				spacing(2);
		            </SCRIPT>
		         		<BUTTON type="submit" class="btn" onclick="APM_company_search_btn()" style="border:2px solid #737373;">검색</button>
			</form>
         	<SCRIPT type="text/javascript">
  				spacing(2);
            </SCRIPT>
            <textarea name=content cols="15" rows="1" id="page_info" style="background-color:transparent;border:0 solid black; font-size: 9pt; color:#737373; overflow:hidden;">1page 1/1</textarea>
        </div>
       <hr>
       
       <!--  CUSTOMER INFORMATION TABLE -->
       <div>

			<table class="table" style="width:1200px;">
			  <thead class="thead-light">
			    <tr>
			      <th scope="col" width="5px"  nowrap>#</th>
			      <th scope="col" width="10px" nowrap>계약시작일</th>
			      <th scope="col" width="10px" nowrap>파트너코드</th>
			      <th scope="col" width="10px" nowrap>회사명</th>
			      <th scope="col" width="10px" >이름</th>
			      <th scope="col" width="10px" >전화번호</th>
			      <th scope="col" width="10px" >이메일</th>
			      <th scope="col" width="10px" >계산서발행일</th>
			      <th scope="col" width="10px" >정산주기</th>
			      <th scope="col" width="10px" >마진율</th>
			      <th scope="col" width="10px" >사업자등록증</th>
			      <th scope="col" width="10px" >통장사본</th>
			    </tr>
			  </thead>
			  
			  <tbody>
			    <tr>
			      <th scope="row" width="2%">1</th>
			      <td width="5%">2018/07/10</td>
			      <td width="8%">PKP001-CK003</td>
			      <td width="6%"><INPUT type="text" NAME="APM_company_name" id="APM_company_name" SIZE="14" value="(주)메가스터디" readonly="readonly" style="border:0 solid black; text-align:center"></td>
			      <td width="7%"><INPUT type="text" NAME="APM_partner_name" id="APM_partner_name" SIZE="5" value="문지환" readonly="readonly" style="border:0 solid black; text-align:center"></td>
			      <td width="7%"><INPUT type="text" NAME="APM_phone_number" id="APM_phone_number" SIZE="11" value="01092111220" readonly="readonly" style="border:0 solid black; text-align:center"></td>
			      <td width="10%"><INPUT type="text" NAME="APM_email" id="APM_email" SIZE="25" value="asdkorea123@naver.com" readonly="readonly" style="border:0 solid black; text-align:center"></td>
			      <td width="4%"><INPUT type="text" NAME="APM_bill_date" id="APM_bill_date" SIZE="3" value="미등록" readonly="readonly" style="border:0 solid black; text-align:center;"></td>
			      <td width="7%">
			      		<SELECT NAME="APM_calculate_period" id="APM_calculate_period" style="border:1px bold #000000;" >
	                        <OPTION VALUE="3개월">3 개월</OPTION>
	                        <OPTION VALUE="1개월">1 개월</OPTION>
               			</SELECT>
			      </td>
			      <td width="5%"><INPUT type="text" NAME="APM_margin" id="APM_margin" SIZE="3" value="30 %" readonly="readonly" style="border:0 solid black; text-align:center;"></td>
			      <td width="7%">
				      	<BUTTON type="button" style="border:2px solid #737373; width:40px; height:20px; font-size:9px;">확인</button>
				      	<BUTTON type="button" style="border:2px solid #737373; width:40px; height:20px; font-size:9px;">수정</button>
			      </td>
			      <td width="7%">
				      <BUTTON type="button" style="border:2px solid #737373; width:40px; height:20px; font-size:9px;">확인</button>
				      <BUTTON type="button" style="border:2px solid #737373; width:40px; height:20px; font-size:9px;">수정</button>
			      </td>
			    </tr>
			    <tr>
			      <th scope="row" width="2%">2</th>
			      <td width="5%">2017/09/10</td>
			      <td width="8%">PKP231-CK003</td>
			      <td width="6%">(주)가천대학교</td>
			      <td width="7%">가천대</td>
			      <td width="7%">01092111220</td>
			      <td width="10%">gachonuniv123@naver.com</td>
			      <td width="4%">미등록</td>
			      <td width="7%">3개월</td>
			      <td width="5%">30 %</td>
			      <td width="7%">
				      	<BUTTON type="button" id="APM_license_register" name="APM_license_register" onclick="APM_license_register_btn()"style="border:2px solid #737373; width:40px; height:20px; font-size:9px;">등록</button>
				      		<BUTTON type="button" id="APM_license_ok" name="APM_license_ok" style="border:2px solid #737373; width:40px; height:20px; font-size:9px; display:none;">확인</button>
				      		<BUTTON type="button" id="APM_license_modify" name="APM_license_modify" style="border:2px solid #737373; width:40px; height:20px; font-size:9px; display:none;">수정</button>
			      </td>
			      <td width="7%">
				      <BUTTON type="button" style="border:2px solid #737373; width:40px; height:20px; font-size:9px;">확인</button>
				      <BUTTON type="button" style="border:2px solid #737373; width:40px; height:20px; font-size:9px;">수정</button>
			      </td>
			    </tr>
			    
			  </tbody>
			</table>
       
       
       
       </div>
       
       
       </div>
			<h4>전달받은 데이터</h4>
		        <ul>
		            <li>계산서발행일 : <%= request.getParameter("contract_date") %></li>
		            <li>회사명 : <%= request.getParameter("company_name") %></li>
		            <li>이름 : <%= request.getParameter("partner_name") %></li>
		            <li>전화번호 : <%= request.getParameter("phone_number") %></li>
		            <li>이메일 : <%= request.getParameter("email") %></li>
		        </ul>
			<h4>전달받은 데이터2&3</h4>
		        <ul>
		            <li>이름 : <%= request.getParameter("search_name") %></li>
		            <li>회사명 : <%= request.getParameter("search_campany") %></li>
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