
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ page import="util.DatabaseUtil"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%
   request.setCharacterEncoding("UTF-8");
%>
<%
   response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>Coludike</title>
<style>
#homeLogo {
   margin: 10px;
   padding-right: 15px
}

.btn-primary {
   color: #555;
   background-color: #ffd659;
   border-color: #fab545
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

.dropbtn {
   background-color: #4CAF50;
   color: white;
   padding: 16px;
   font-size: 16px;
   border: none;
   cursor: pointer;
}

.dropdown {
   position: relative;
   display: inline-block;
}

.dropdown-content {
   display: none;
   position: absolute;
   right: 0;
   background-color: #f9f9f9;
   min-width: 160px;
   box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
   z-index: 1;
}

.dropdown-content a {
   color: black;
   padding: 12px 16px;
   text-decoration: none;
   display: block;
}

.dropdown-content a:hover {
   background-color: #ffd659
}

.dropdown:hover .dropdown-content {
   display: block;
}

.dropdown:hover .dropbtn {
   background-color: #3e8e41;
}
</style>

<!-- compiled CSS -->
<link rel="stylesheet" type="text/css"
   href="./assets/ng-cloudike-2.3.1-1.css">
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
</script>
<script type="text/javascript">

	function test_alert(id)
	{
		alert(id);
	}


   function RMfunction() {
      alert("RM눌렀음!!!!!!!!");
      $("#side_item2").css("font-weight", "bold");
      $("#side_item1").css("font-weight", "normal");
      $("#divProfile").css("display", "none");
      $("#divRM").css("display", "block");
   }
   function profileFunction() {
      alert("내정보 눌렀음!!!!!!!!");
      $("#side_item1").css("font-weight", "bold");
      $("#side_item2").css("font-weight", "normal");
      $("#divRM").css("display", "none");
      $("#divProfile").css("display", "block");

   }
   function name_edit_click() {
      $("input[name='userName']").attr("readonly", false);
   }
   function tel_edit_click() {
      $("input[name='usertel']").attr("readonly", false);
   }
   function calcul_ok_click() {
      alert("계산서 발행일; 등록되었습니다!");
   }
   function account_ok_click() {
      alert("통장사본; 등록되었습니다!");
   }
   function test_click() {
      alert("버튼1을 누르셨습니다.");
      location.replace('profileSetting.jsp');
   }
   $(document).ready(function() {
      $("#btn_name_ok").click(function() {
         alert("이름 확인 버튼은 눌렸음");
         updateName();
      });
      $("#btn_tel_ok").click(function() {
         alert("전화번호 확인 버튼은 눌렸음");
         updateTel();
      });
      $("#btn_business_ok").click(function() {
         alert("사업자 등록증");
         $("#business").text("등록");
      });
      $("#btn_account_ok").click(function() {
         alert("통장 사본");
         $("#account").text("등록");
      });
      $("#btn_bill_ok").click(function() {
         alert("계산서 발행일");
         var temp = $("#bill_date").val();
         $("#bill_date").val(temp);
      });
   });
   function updateName() {

      $.ajax({
         type : "post",
         url : "./profileNameSet.jsp",
         data : {
            userCode : $('#userCode').val(),
            userName : $('#userName').val()
         },
         success : ajaxSuccess,
         error : ajaxError
      });
   }
   function updateTel() {

      $.ajax({
         type : "post",
         url : "./profileTelSet.jsp",
         data : {
            userTel : $('#userTel').val(),
            userCode : $('#userCode').val(),
         },
         success : ajaxSuccess,
         error : ajaxError
      });
   }
   function ajaxSuccess(resdata) {
      //$("#ajaxReturn").html(resdata);
      alert("Success");
   }
   function ajaxError() {
      alert("Error");
   }
</script>


<!--  지환 자바스크립트 -->
<script type="text/javascript">
   
	function spacing(num)
	{
        for(i=0; i<num; i++)
        {
        document.write("&nbsp");
        }
	}
   
	function register_check()
	{
		var bill_date = document.register.bill_date;
		var datetime_pattern = /^(19|20)\d{2}(0[1-9]|1[012])(0[1-9]|[12][0-9]|3[0-1])$/; 

		
		var company_name = document.register.company_name;
		var rate_system = document.register.rate_system;
		var contract_unit = document.register.contract_unit;
		var fee = document.register.fee;
		

		
		
		if(bill_date.value == '' || !(bill_date.value.length == 8) )
			{
				alert("계산서 발행일을 정확히 입력해주세요.");
				return false;
			}
		else if (!datetime_pattern.test(bill_date.value))
			{
				alert("올바른 날짜 형식이 아닙니다.")
				return false;
			}
		else if(company_name.value == "")
			{
				alert("고객사명을 입력해주세요.");	
				return false;
			}
		else if(rate_system.value == 0)
			{
				alert("요금제를 선택해주세요.");
				return false;
			}
		else if(rate_system.value == 4 && fee.value.length == 0)
		{
				alert("요금제를 입력해주세요.");
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

    function PRM_period_btn_clicked()
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
	
	
    function PRM_search_btn_clicked()
    {
    	var got_customer_code = document.getElementById("PRM_customer_code_for_search").value;

    	
		alert("고객 코드 : " + got_customer_code);
 		
    }
    
    
    
    function PRM_modify_btn_clicked()
    {
    	
    	//  001
    	
    	alert("수정버튼이 눌렸습니다.");
    	
        var input = document.getElementById("PRM_ok");
        input.style.display="inline";
        input.style.border="2px solid blue";

        
    	var send_array = Array();
    	var send_cnt = 0;
    	var chkbox = $(".checkSelect");
    	
    	for(var i=0; i<chkbox.length; i++) {
    			if(chkbox[i].checked == true){
    				send_array[send_cnt] = chkbox[i].value;
    				send_array[send_cnt] = send_array[send_cnt].replace("/", "");
    				//alert(send_array[send_cnt]);
    				
    				ChangeInputState_for_modification(send_array[send_cnt]);
    				
    				send_cnt++;
    			}
    		}
    	// 하나의 배열로 담을 때 아래처럼 처리함. 아직 쓸일은 없더라.
    	// $("#array").val(send_array);
    	
        var output = document.getElementById("PRM_modify");
        output.style.display="none";
    }
    
    	
    function ChangeInputState_for_modification(RM_table_id)
    {
    	//해당 index(piramry key)에서 활성화가 되어야 할 INPUT 전체 변경
    	
        var table_fee = document.getElementById(RM_table_id+1);
        $(table_fee).attr("readonly", false);
        table_fee.style.border="1px solid #737373";
    	
        
        var table_margin = document.getElementById(RM_table_id+2);
        $(table_margin).attr("readonly", false);
        table_margin.style.border="1px solid #737373";   	
    	
        var table_unpaid = document.getElementById(RM_table_id+3);
        $(table_unpaid).attr("readonly", false);
        table_unpaid.style.border="1px solid #737373";  
    	
    }
    
    function ChangeInputState_for_register(RM_table_id)
    {
    	//해당 index(piramry key)에서 활성화가 되어야 할 INPUT 전체 변경
    	
        var table_fee = document.getElementById(RM_table_id+1);
        $(table_fee).attr("readonly", true);
        table_fee.style.border="0 solid blue";
    	
        var table_margin = document.getElementById(RM_table_id+2);
        $(table_margin).attr("readonly", true);
        table_margin.style.border="0 solid blue";   	
    	
        var table_unpaid = document.getElementById(RM_table_id+3);
        $(table_unpaid).attr("readonly", true);
        table_unpaid.style.border="0 solid blue";  
    	
    }
    
    
    
    
	function PRM_delete_btn_clicked() 
	{
			alert("삭제버튼이 눌렸습니다.");
	} //end PRM_delete_btn_clicked()
    
    
	
	function PRM_ok_btn_clicked() 
	{
	        var output = document.getElementById("PRM_modify");
	        output.style.display="inline";
	        
	        var input = document.getElementById("PRM_ok");
	        input.style.display="none";
	    
			alert("수정이 완료되었습니다.");
			
	    	var send_array = Array();
	    	var send_cnt = 0;
	    	var chkbox = $(".checkSelect");
	    	
	    	for(var i=0; i<chkbox.length; i++) {
	    			if(chkbox[i].checked == true){
	    				send_array[send_cnt] = chkbox[i].value;
	    				send_array[send_cnt] = send_array[send_cnt].replace("/", "");
	    				//alert(send_array[send_cnt]);
	    				
	    				ChangeInputState_for_register(send_array[send_cnt]);
	    				
	    				send_cnt++;
	    			}
	    		}
	    	// 하나의 배열로 담을 때 아래처럼 처리함. 아직 쓸일은 없더라.
	    	// $("#array").val(send_array);
	     
	} //end PRM_ok_btn_clicked()
	
	
</script>


<script	
   src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/835808530/?random=1531139707988&amp;cv=9&amp;fst=1531139707988&amp;num=1&amp;label=Cloudike%20KR%20Remarketing&amp;guid=ON&amp;resp=GooglemKTybQhCsO&amp;u_h=864&amp;u_w=1536&amp;u_ah=824&amp;u_aw=1536&amp;u_cd=24&amp;u_his=2&amp;u_tz=540&amp;u_java=false&amp;u_nplug=3&amp;u_nmime=4&amp;gtm=G6c&amp;sendb=1&amp;frm=0&amp;url=https%3A%2F%2Fasd.cloudike.kr%2Foauth%3Fuse_ajax%3D1&amp;async=1&amp;rfmt=3&amp;fmt=4"></script>

<style type="text/css">

	#PRM_table{
		
		
		 text-align:center;
		 font-size : 12px;

	}


</style>

</head>

<body class="full-height body-gray body-scroll">
   <%
      Connection conn = DatabaseUtil.getConnection();
      out.print("db 연결 정보 " + conn);

      Statement stmt = conn.createStatement();

      //내정보 db로딩
      //TODO : where user가 이거일때 !!
      String sql = "select * from PROFILE";
      stmt.executeQuery(sql);
      ResultSet rs = null;
      rs = stmt.executeQuery(sql);
   %>
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
               <img id="homeLogo" alt="Cloudike" src="./assets/Coludike_logo.png">
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

                           <div id="profile_menu" class="dropdown" style="float: right;">
                              <span class="cuser-name ng-binding">유수화</span> <span
                                 class="caret"></span>
                              <div class="dropdown-content" style="right: 0;">
                                 <a ui-sref="profile" href="#">프로필 / 설정</a> <a
                                    ui-sref="profile" href="#">로그아웃</a>
                              </div>
                           </div> <!--  원래코드
                           <div id="profile_menu" class="btn-group b-group-usermenu"
                              dropdown="">
                              <a href="" dropdown-toggle="" aria-haspopup="" aria-expanded="true"> 
                              <span
                                 class="cuser-name ng-binding">유수화</span> <span class="caret"></span>
                              </a>
                              <ul class="dropdown-menu">
                                 <li><a ui-sref="profile" href="/profile"><span
                                       translate="" class="ng-scope">프로필 / 설정</span></a></li>
                                 <li><a ui-sref="signout" href="/signout"><span
                                       translate="" class="ng-scope">로그아웃</span></a></li>
                              </ul>
                           </div>
                           -->
                        </li>

                        <li>
                           <div id="notice_menu" class="btn-group" dropdown="">
                              <a class="visible-xs mar-r-0-xs" disabled="disabled"> <!-- ngIf: $root.MyNotices.length -->
                                 <!-- ngIf: !$root.MyNotices.length --> <span
                                 class="cuser-btn ng-scope" translate="">알림 없음</span> <!-- end ngIf: !$root.MyNotices.length -->
                              </a> <a class="hidden-xs" href="" dropdown-toggle=""
                                 disabled="disabled"> <span class="cuser-btn ng-scope"
                                 translate="">알림 없음</span> <!-- end ngIf: !$root.MyNotices.length -->
                                 <span class="caret"></span>
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
            <!--  여기고침 -->
            <div class="g-sidebar-info-container full-height ng-scope">
               <div class="metadata-tree b-menu ng-scope ng-isolate-scope">
                  <!-- ngIf: folder.folder -->
                  <ul class="nav nav-pills nav-stacked ng-scope">
                     <!-- susu 여기고침 -->
                     <li class="active collapse-in"><a class="b-menu__item-link">
                           <span ng-click="clickItemMenu($event, folder)"> <span
                              class="b-menu__item-link-toolbar"> <span
                                 class="b-menu__item-icon b-menu__item-icon-chevron-right"><i
                                    class="fa fa-caret-right"></i></span> <span
                                 class="b-menu__item-icon b-menu__item-icon-chevron-down"><i
                                    class="fa fa-caret-down"></i></span>
                           </span> <span class="slide-item ng-binding">myPage 관리</span>
                        </span>
                     </a> <!-- ngIf: folder.content.length -->
                        <div class="collapse ng-scope">
                           <!-- ngRepeat: folder in folder.content | naturalOrderBy:'path' -->
                           <!-- ngInclude: 'clFolderAsTree/clFolderAsTree.tpl.html' -->
                           <div class="ng-scope">
                              <!-- ngIf: folder.folder -->
                           </div>
                           <!-- end ngRepeat: folder in folder.content | naturalOrderBy:'path' -->
                        </div> <!-- end ngIf: folder.content.length --></li>
                     <!-- 여기까지 -->

                     <li class="single-item ng-scope"><a
                        class="b-menu__item-link" onclick="profileFunction();"><span><span
                              translate="" class="ng-scope" id="side_item1"
                              style="font-weight: bold"> 내 정보 관리</span></span></a></li>
                     <li class="single-item ng-scope"><a
                        class="b-menu__item-link" onclick="RMfunction();"><span><span
                              translate="" class="ng-scope" id="side_item2"
                              style="font-weight: normal">실적 관리</span></span></a></li>
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

                        <!-- susu ! 테이블 자리!!!!!! 여기 잘림 !!!!!!! -->

                        <div class="ng-scope" id="divProfile" style="display: block">
                           <table class="type04" id="myPageTable1">
                              <tr>
                                 <%//| userCode | userCompany | userName | userTel| userEmail|
                                 //business | account | contDate | calcul | billDate | depositDate | note
                                 
                                 
                                 //  userCode | userCompany | userName| userTel| userEmail| business| account|contDate|calcul|billDate|depositeDate|note
                                    while (rs.next()) {
                                       String code = rs.getString("userCode");
                                       String company = rs.getString("userCompany");
                                       String name = rs.getString("userName");
                                       String tel = rs.getString("userTel");
                                       String email = rs.getString("userEmail");
                                       String business = rs.getString("business");
                                       String account = rs.getString("account");
                                       String contDate = rs.getString("contDate");
                                       String calcul = rs.getString("calcul");
                                       String billDate = rs.getString("billDate");
                                       String depositDate = rs.getString("depositDate");
                                       String note = rs.getString("note");
                                 %>

                                 <th scope="row">파트너 코드</th>
                                 <td colspan="2"><input id="userCode" name="userCode"
                                    value="<%=code%>" disabled></td>
                              </tr>
                              <tr>
                                 <th scope="row">회사명</th>
                                 <td colspan="2"><%=company%></td>
                              </tr>

                              <tr>
                                 <th scope="row">이름</th>
                                 <td><input id="userName" name="userName"
                                    value="<%=name%>" readonly></td>
                                 <td><button class="btn btn-default"
                                       onclick="name_edit_click();">수정</button> <input
                                    type="button" class="btn btn-default" id="btn_name_ok"
                                    value="확인"></td>
                              </tr>

                              <tr>
                                 <th scope="row">전화번호</th>
                                 <td><input id="userTel" name="userTel"
                                    value="<%=tel%>" readonly></td>
                                 <td><button class="btn btn-default"
                                       onclick="tel_edit_click();">수정</button>
                                    <button class="btn btn-default" id="btn_tel_ok">확인</button></td>
                              </tr>
                              <tr>
                                 <th scope="row">이메일</th>
                                 <td colspan="2"><%=email%></td>
                              </tr>
                           </table>

                           <table class="type04" id="myPageTable2">
                              <tr>
                                 <!-- TODO: 개인에선 지우기 ! 지우던가 등록 못하게 하던가 display:none-->
                                 <th scope="row">사업자 등록증</th>
                                 <td><p id="business"><%=business%></p></td>
                                 <td><button class="btn btn-default" id="btn_business_ok">등록</button></td>
                              </tr>
                              <tr>
                                 <th scope="row">통장사본</th>
                                 <td><p id="account"><%=account%></p></td>
                                 <td><button class="btn btn-default" id="btn_account_ok">등록</button></td>
                              </tr>
                              <tr>
                                 <th scope="row">ASD계약일</th>
                                 <td colspan="2" style="color: gray"><%=contDate%></td>
                              </tr>
                              <tr>
                                 <th scope="row">정산주기</th>
                                 <td colspan="2" style="color: gray"><%=calcul %></td>
                              </tr>
                              <tr>
                                 <th scope="row">계산서 발행일</th>
                                 <td><input style="text-align: center; width: 25px;"
                                    id="bill_date" type="text" value="<%=billDate%>">일/3개월</td>
                                 <td><button class="btn btn-default" id="btn_bill_ok">등록</button></td>
                              </tr>
                              <tr>
                                 <th scope="row">입금일</th>
                                 <td colspan="2" style="color: gray"><%=depositDate%></td>
                              </tr>
                              <tr>
                                 <th scope="row">비고</th>
                                 <td colspan="2" style="color: gray"><%=note%>
                              </tr>
                              <%
                                 }
                              %>
                           </table>
                        </div>

                        <!-- susu! 여기여기!!!!!!!! -->
                        <div id="divRM" class="ng-scope" style="display: none; margin-left: 20px; margin-top: 20px;">


<div>
          <div>
 			<FORM method="post" name="register" id="register" onsubmit="return register_check();">
         
            &nbsp;<LABEL>계산서발행일</LABEL>
            	<INPUT type="text" name="bill_date" id="bill_date" size="5" style="border:2px solid #000000;">&nbsp;&nbsp;
         
         
            <LABEL>고객사명</LABEL>
            	<INPUT type="text" name="company_name" id="company_name" size="12" style="border:2px solid #000000;">&nbsp;&nbsp;
         
         
            <LABEL>요금제</LABEL>
            			<SELECT NAME="rate_system" id="rate_system" onchange="convert_fee(this.form)" style="border:2px solid #000000;" >
            			<OPTION VALUE="0">선택</OPTION>
                        <OPTION VALUE="1">Basic (50GB)</OPTION>
                        <OPTION VALUE="2">Standard (100GB)</OPTION>
                        <OPTION VALUE="3">Professional (300GB)</OPTION>
                        <OPTION VALUE="4">Custom (300G이상)</OPTION>
                </SELECT>&nbsp;&nbsp;

			<LABEL>계약단위(정산주기)</LABEL>
			            <SELECT NAME="contract_unit" id="contract_unit" style="border:2px solid #000000;">
                        <OPTION VALUE="1" >3개월</OPTION>
                        <OPTION VALUE="2">6개월</OPTION>
                        <OPTION VALUE="3">1년</OPTION>
                </SELECT>&nbsp;&nbsp;
                
			<LABEL>요금</LABEL> 
				<INPUT type="text" NAME="fee" id="fee" SIZE="10" style="border:2px solid #000000;"> 원&nbsp;
         <BUTTON type="submit" class="btn" style="border:2px solid #737373;">등록</button>
      </FORM>
            &nbsp;&nbsp;<textarea name=content cols="30" rows="3" id="bill_date_info" style="background-color:transparent;border:0 solid black;font-size: 9pt; color:#737373; overflow:hidden;">해당건의 첫 계산서 발행일숫자8자리 ex)20180405</textarea>
			<SCRIPT type="text/javascript">
  				spacing(6);
            </SCRIPT>
            <textarea name=content cols="45" rows="3" id="bill_date_info" style="background-color:transparent;border:0 solid black; font-size: 9pt; color:#737373; overflow:hidden;">정확한 고객사명을 입력해 주세요.
기존 고객사명과 다를 경우 새로 등록됩니다.</textarea>
			<SCRIPT type="text/javascript">
  				spacing(46);
            </SCRIPT>

            <textarea name=content cols="40" rows="3" id="bill_date_info" style="background-color:transparent;border:0 solid black; font-size: 9pt; color:#737373; overflow:hidden;">매월청구 요금제:3개월
6개월/1년 계약은 동일하게 선택</textarea>

        </div>
        
        <!--  TABLE 상단 : 검색 AREA  -->
        <div>
        	 <FORM method="post" name="PRM_btn_event" id="PRM_btn_event" style="display:inline">
				<BUTTON type="button" class="btn" id="PRM_modify" name="PRM_modify" onclick="PRM_modify_btn_clicked()" style="border:2px solid #737373;">수정</button>
				<BUTTON type="button" class="btn" id="PRM_ok" name="PRM_ok" onclick="PRM_ok_btn_clicked() " style="border:2px solid #737373; display:none;">확인</button>
			
				<BUTTON type="button" class="btn" id="PRM_delete" name="PRM_delete" onclick="PRM_delete_btn_clicked() " style="border:2px solid #737373;">삭제</button>
			</FORM>
		
			
			<SCRIPT type="text/javascript">
  				spacing(20);
            </SCRIPT>
		
			<LABEL>기간 </LABEL>
				<SCRIPT type="text/javascript">
	  				spacing(4);
	            </SCRIPT>
			<form  method=post id="PRM_search_period" name="PRM_search_period" style="display:inline">
	            <INPUT type="text" name="start_year" id="start_year" size="2" style="border:2px solid #737373;">년&nbsp;&nbsp;
	            <INPUT type="text" name="start_month" id="start_month" size="1" style="border:2px solid #737373;">월 - 
	            
				<INPUT type="text" name="end_year" id="end_year" size="2" style="border:2px solid #737373;">년&nbsp;&nbsp;
	            <INPUT type="text" name="end_month" id="end_month" size="1" style="border:2px solid #737373;">월
	            
	            <BUTTON type="submit" id="PRM_period_btn" name="PRM_period_btn" onclick="PRM_period_btn_clicked()" class="btn" style="border:2px solid #737373;">검색</button>
            </form>
            	<SCRIPT type="text/javascript">
	  				spacing(4);
	            </SCRIPT>
			<form method="post" style="display:inline">
				<LABEL>고객사코드</LABEL>

            	<INPUT type="text" name="PRM_customer_code_for_search" id="PRM_customer_code_for_search" size="12" style="border:2px solid #737373;">&nbsp;&nbsp;
         		<BUTTON type="submit" class="btn" onclick="PRM_search_btn_clicked()"style="border:2px solid #737373;">검색</button>
			</form>
            <textarea name=content cols="15" rows="1" id="page_info" style="background-color:transparent;border:0 solid black; font-size: 9pt; color:#737373; overflow:hidden;">1page 1/1</textarea>
        </div>
       <hr>
       
       <!--  CUSTOMER INFORMATION TABLE -->
       <div>
			
			<table class="table" id="PRM_table" style="width:1000px">
			  <thead class="thead-light">
			    <tr>
			      <th scope="col" width="10px" nowrap style="text-align:center;">#</th>
			      <th scope="col" width="10px" nowrap style="text-align:center;">계산서발행일</th>
			      <th scope="col" width="20px" nowrap style="text-align:center;">고객코드</th>
			      <th scope="col" width="20px" nowrap style="text-align:center;">고객사명</th>
			      <th scope="col" width="20px" style="text-align:center;">요금제</th>
			      <th scope="col" width="10px" style="text-align:center;">정산주기</th>
			      <th scope="col" width="10px" style="text-align:center;">요금</th>
			      <th scope="col" width="10px" style="text-align:center;">마진</th>
			      <th scope="col" width="10px" style="text-align:center;">미수금</th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
                                       <%	
                                          Statement stmtRM = conn.createStatement();

                                          //실적관리 db로딩
                                          String sqlRM = "select * from test";
                                          stmtRM.executeQuery(sqlRM);
                                          ResultSet rsRM = null;
                                          rsRM = stmtRM.executeQuery(sqlRM);
                                       %>
                                       <%
                                          while (rsRM.next()) {
                                        	 String id=rsRM.getString("id");
                                             String billDate = rsRM.getString("billDate");
                                             String companyCode = rsRM.getString("companyCode");
                                             String companyName = rsRM.getString("companyName");	
                                             String plan = rsRM.getString("plan");
                                             String contract = rsRM.getString("contractUnit");	
                                             String fee = rsRM.getString("fee");
                                             String margin = rsRM.getString("margin");
                                             String unpaid = rsRM.getString("unpaid");

                                             
                                            System.out.println("ID값 : "+ id);
                                             
                                       %>
                                       
                                       
                              
										
                                       <th scope="row"><input type="checkbox" class="checkSelect" id="PRM_table_index" name="PRM_table_index" value=<%=id%>/></th>
                                       <td width="5%"><%=billDate%></td>
                                       <td width="20%"><%=companyCode%></td>
                                       <td width="20%"><%=companyName%></td>
                                       <td width="15%"><%=plan%></td>
                                       <td width="15%"><%=contract%></td>
                                       <td width="15%"><INPUT type="text" name="<%=id%>1" id="<%=id%>1" size="7"  value=<%=fee%> readonly="readonly" style="border:0 solid black; text-align:center;"></td>
                                      
                                       <td width="15%"><INPUT type="text" name="<%=id%>2" id="<%=id%>2" size="7" value=<%=margin%> readonly="readonly" style="border:0 solid black; text-align:center;"></td>
                                       <td width="15%"><INPUT type="text" name="<%=id%>3" id="<%=id%>3" size="7" value=<%=unpaid%> readonly="readonly" style="border:0 solid black; text-align:center;"></td>
                                       
                                    </tr>
                                    <%
                            
                                          }
                                       %>
			</table>
       
      	
       
       </div>
</div>






                     	
                     	</div> <!-- divRM end -->
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
      src="/assets/app-config.js?1530520134094"></script>
   <script type="text/javascript"
      src="/assets/ng-cloudike-2.3.1-1.js?1530520134094"></script>


</body>
</html>