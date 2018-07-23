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


<!-- 지환 아작스 함수 -->
<script type="text/javascript">


	  $(document).ready(function(){
	   	      $("#ARM_period_btn").click(function(){
	   	          alert("선택한 기간으로 검색합니다.");
	   	       	  callAjax_ARM_period_btn();
	   	          
	      	       clear_input("start_year");
	       	       clear_input("start_month");
	       	       clear_input("end_year");
	       	       clear_input("end_month");
	   	      });
	   	      

	   	      $("#ARM_search_btn").click(function(){
	   	          alert("코드번호로 검색을 실시합니다.");
	   	          callAjax_ARM_codeSearch();
	   	          
	      	       clear_input("ARM_customer_code_for_search");
	       	       clear_input("ARM_partner_code_for_search");
	   	      });
	   	      
	   	      // APM
	   	      
	   	      $("#APM_search_name_btn").click(function(){
	   	          alert("이름으로 검색을 실시합니다.");
	   	          callAjax_APM_search_name();
	   	          
	      	       clear_input("APM_search_name");
	   	      });
	   	      
	   	      
	   	      $("#APM_search_company_btn").click(function(){
	   	          alert("회사명으로 검색을 실시합니다.");
	   	      	 callAjax_APM_search_company();
	   	          
	      	       clear_input("APM_search_company");
	   	      });
   	      
   	      
   	      
	   	      
	   	      
	   	      
	   	      
	   	   
	   	      
	   	      
   	    }); // END READY FUNCTION


   	    
   	    //[ARM] 각 버튼에 데이터 전송 함수들
   	    function callAjax_ARM_period_btn(){
   	        $.ajax({
   		        type: "post",
   		        url : "./test.jsp",
   		        data: {
   		        	start_year : $('#start_year').val(),
   	       			start_month : $('#start_month').val(),
   		        	end_year : $('#end_year').val(),
   		        	end_month : $('#end_month').val()
   		        },
   		        success: whenSuccess,
   		        error: whenError
   	     	});
   	    }// END 기간 검색 데이터 전송 함수

   	    
   	    function callAjax_ARM_register_btn(){
   	        $.ajax({
   		        type: "post",
   		        url : "./test.jsp",
   		        data: {
   		        	ajax_bill_date : $('#ARM_bill_date').val(),
   	       			ajax_ARM_partner_code : $('#ARM_partner_code').val(),
   		        	ajax_ARM_partner_name : $('#ARM_partner_name').val(),
   		        	ajax_ARM_rate_system : $('#ARM_rate_system').val(),
   		        	ajax_ARM_contract_unit : $('#ARM_contract_unit').val(),
   		        	ajax_ARM_fee : $('#ARM_fee').val()
   		        },
   		        success: whenSuccess,
   		        error: whenError
   	     	});
   	    }// END 등록 버튼 데이터 전송 함수
   	    
   	    function callAjax_ARM_codeSearch(){
   	        $.ajax({
   		        type: "post",
   		        url : "./test.jsp",
   		        data: {
   		        	ajax_ARM_customer_code_for_search : $('#ARM_customer_code_for_search').val(),
   	       			ajax_ARM_partner_code_for_search : $('#ARM_partner_code_for_search').val(),
   		        },
   		        success: whenSuccess,
   		        error: whenError
   	     	});
   	    }// END 등록 버튼 데이터 전송 함수
   	    
 	    function callAjax_ARM_table_ok(fee, margin, unpaid){
   	        $.ajax({
   		        type: "post",
   		        url : "./test.jsp",
   		        data: {
   		        	ajax_ARM_table_fee : $(fee).val(),
   		        	ajax_ARM_table_margin : $(margin).val(),
   		        	ajax_ARM_table_unpaid : $(unpaid).val(),
   		        },
   		        success: whenSuccess,
   		        error: whenError
   	     	});
   	    }// END 테이블 수정 후 확인 데이터 전송 함수
   	    
   	    
   	    
   	    ///////////////////////////////////////////////////////////////////////////////////////////////
   		////[APM] 각 버튼에 데이터 전송 함수들																	APM ajax function
   	    
   	    function callAjax_APM_register_btn(){
   	        $.ajax({
   		        type: "post",
   		        url : "./test.jsp",
   		        data: {
   		        	ajax_APM_rgs_contract_date : $('#APM_register_contract_date').val(),
   	       			ajax_APM_rgs_company_name : $('#APM_register_company_name').val(),
   		        	ajax_APM_rgs_partner_name : $('#APM_register_partner_name').val(),
   		        	ajax_APM_rgs_phone_number : $('#APM_register_phone_number').val(),
   		        	ajax_APM_rgs_email : $('#APM_register_email').val(),
   		        },
   		        success: whenSuccess,
   		        error: whenError
   	     	});
   	    }// END 등록 버튼 데이터 전송 함수   	    
   	    
   	    
   	    
   	    
   	    function callAjax_APM_search_name(){
   	        $.ajax({
   		        type: "post",
   		        url : "./test.jsp",
   		        data: {
   		        	ajax_APM_search_name : $('#APM_search_name').val(),
   		        },
   		        success: whenSuccess,
   		        error: whenError
   	     	});
   	    }// END 이름 검색 데이터 전송 함수
   

   	    function callAjax_APM_search_company(){
   	        $.ajax({
   		        type: "post",
   		        url : "./test.jsp",
   		        data: {
   		        	ajax_APM_search_company : $('#APM_search_company').val(),
   		        },
   		        success: whenSuccess,
   		        error: whenError
   	     	});
   	    }// END 회사명  검색 데이터 전송 함수
   	    
   	    
   	    
 	    function callAjax_APM_table_ok(){
   	        $.ajax({
   		        type: "post",
   		        url : "./test.jsp",
   		        data: {
   		        	ajax_APM_company_name : $('#APM_company_name').val(),
   		        	ajax_APM_partner_name : $('#APM_partner_name').val(),
   		        	ajax_APM_phone_number : $('#APM_phone_number').val(),
   		        	ajax_APM_email : $('#APM_email').val(),
   		        	ajax_APM_bill_date : $('#APM_bill_date').val(),
   		        	ajax_APM_calculate_period : $('#APM_calculate_period').val(),
   		        	ajax_APM_margin : $('#APM_margin').val(),
   		        },
   		        success: whenSuccess,
   		        error: whenError
   	     	});
   	    }// END 테이블 수정 후 확인 데이터 전송 함수
   	    
   	    
   	    
   	    ///////////////////////////////////////////////////////////////////////////////////////////////

   	    
   	    // ajax에서 공통적으로 사용할 함수 모듈화 
   	    function whenSuccess(resdata){
   	        $("#ajaxReturn").html(resdata);
   	        alert("Ajax 데이터 전송 성공");
   	    }
   	    function whenError(){
   	        alert("Error");
   	    }

   	    // 데이터 전송 후 input에 남아있는 입력값을 지우기 위한 함수
   	    function clear_input(input_id)
   	    {
   	    	var got_input_id = input_id;
    	       var clear = document.getElementById(got_input_id);
      	    	clear.value = "";
   	    }
   	    
</script>


<script type="text/javascript">
   function RMfunction() {
      alert("실적관리 페이지");

      $("#side_item2").css("font-weight", "bold");
      $("#side_item1").css("font-weight", "normal");
      $("#divProfile").css("display", "none");
      $("#divRM").css("display", "block");
   }
   function profileFunction() {
      alert("파트너 페이지");

      $("#side_item2").css("font-weight", "normal");
      $("#side_item1").css("font-weight", "bold");
      $("#divRM").css("display", "none");
      $("#divProfile").css("display", "block");

   }
   function profile_edit_click() {
      $("input[name='profile']").attr("readonly", false);
   }
</script>


<!--  지환 자바스크립트 -->
<script type="text/javascript">
   function spacing(num) {
      for (i = 0; i < num; i++) {
         document.write("&nbsp");
      }
   }
   
   
   // ARM :  Admin Result Management
   function ARM_register_check() {
      var ARM_bill_date = document.ARM_register.ARM_bill_date;
      var ARM_datetime_pattern = /^(19|20)\d{2}(0[1-9]|1[012])(0[1-9]|[12][0-9]|3[0-1])$/;

      var ARM_partner_code = document.ARM_register.ARM_partner_code;
      var ARM_partner_name = document.ARM_register.ARM_partner_name;
      var ARM_rate_system = document.ARM_register.ARM_rate_system;
      var ARM_fee = document.ARM_register.ARM_fee;

      if (ARM_bill_date.value == '' || !(ARM_bill_date.value.length == 8)) {
         alert("계산서발행일을 정확히 입력해주세요.");
         return false;
      } else if (!ARM_datetime_pattern.test(ARM_bill_date.value)) {
         alert("올바른 날짜 형식이 아닙니다.")
         return false;
      } else if (ARM_partner_code.value == "") {
         alert("파트너 코드를 입력해주세요..");
         return false;
      } else if (ARM_partner_name.value == "") {
         alert("고객사 이름을 입력해주세요.");
         return false;
      } else if (ARM_rate_system.value == 0) {
         alert("요금제를 선택해주세요.");
         return false;
      } else if (ARM_rate_system.value == 4 && ARM_fee.value.length == 0) {
         alert("커스텀 요금을 입력해주세요.");
         return false;
      }
      
	// 위에서 유효성 검사를 모두 통과했을 경우 
	// 데이터 전송을 위한 아작스 함수 호출됨
   	   	       	  callAjax_ARM_register_btn();
   	   	          
   	      	       clear_input("ARM_bill_date");
   	       	       clear_input("ARM_partner_code");
   	       	       clear_input("ARM_partner_name");
   	       	       clear_input("ARM_rate_system");
   		       	   clear_input("ARM_contract_unit");
   		       	   clear_input("ARM_fee");

   }

   function ARM_convert_fee(frm) {
      var ARM_fee = frm.ARM_rate_system.selectedIndex;

      switch (ARM_fee) {
      case 0:
         frm.ARM_fee.value = '요금제미선택';
         $("input[name='fee']").attr("readonly", true);
         break;
      case 1:
         frm.ARM_fee.value = '100,000';
         $("input[name='fee']").attr("readonly", true);
         break;
      case 2:
         frm.ARM_fee.value = '400,000';
         $("input[name='fee']").attr("readonly", true);
         break;
      case 3:
         frm.ARM_fee.value = '1,000,000';
         $("input[name='fee']").attr("readonly", true);
         break;
      case 4:
         frm.ARM_fee.value = '';
         $("input[name='fee']").attr("readonly", false);
         break;

      }
      return true;
   }// end ARM_convert_fee(frm) function

   
   
   function ARM_modify_btn_clicked() {
      alert("수정버튼이 눌렸습니다.");
      var input = document.getElementById("ARM_ok");
      input.style.display = "inline";
      input.style.border = "2px solid blue";

      
  	var send_array = Array();
	var send_cnt = 0;
	var chkbox = $(".ARM_checkSelect");
	
	for(var i=0; i<chkbox.length; i++) {
		
			if(chkbox[i].checked == true){
				var chkbox_state = document.getElementById(chkbox[i].id);
			    $(chkbox_state).attr("disabled", true);
				
				send_array[send_cnt] = chkbox[i].value;
				send_array[send_cnt] = send_array[send_cnt].replace("/", "");
				//alert(send_array[send_cnt]);
				
				ChangeInputState_for_modification(send_array[send_cnt]);
				
				send_cnt++;
			}
		}
	// 하나의 배열로 담을 때 아래처럼 처리함. 아직 쓸일은 없더라.
	// $("#array").val(send_array);
     
      var output = document.getElementById("ARM_modify");
      output.style.display = "none";
   }

   function ARM_delete_btn_clicked() {
      alert("삭제버튼이 눌렸습니다.");
   } //end ARM_delete_btn_clicked()

   
   function ARM_ok_btn_clicked() {
      var output = document.getElementById("ARM_modify");
      output.style.display = "inline";

      var input = document.getElementById("ARM_ok");
      input.style.display = "none";

      alert("수정이 완료되었습니다.");

  	var send_array = Array();
	var send_cnt = 0;
	var chkbox = $(".ARM_checkSelect");
	
	for(var i=0; i<chkbox.length; i++) {
			if(chkbox[i].checked == true){
				var chkbox_state = document.getElementById(chkbox[i].id);
				$(chkbox_state).attr("disabled", false);
			    
				send_array[send_cnt] = chkbox[i].value;
				send_array[send_cnt] = send_array[send_cnt].replace("/", "");
				//alert(send_array[send_cnt]);
				
				ChangeInputState_for_register(send_array[send_cnt]);
				
				send_cnt++;
			}
		}
	// 하나의 배열로 담을 때 아래처럼 처리함. 아직 쓸일은 없더라.
	// $("#array").val(send_array);
     
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
       
       //Id값을 담은 객체를 보내줘야해!
       callAjax_ARM_table_ok(table_fee,table_margin,table_unpaid);
   	
   }
   
</script>



<!-- 위에는 ARM 자바스크립트, 아래는 APM 자바스크립트 

	시간되면 공통부분은 따로 자바스크립트 구분해주자 spacing같은거
	
	ARM 함수명 구분이 잘 되어있는데, APM파트는 앞에 APM이 안붙어있는 경우가 조금 있는 것 같아서 확인이 필요할 듯
-->



<script type="text/javascript">
   function spacing(num) {
      for (i = 0; i < num; i++) {
         document.write("&nbsp");
      }
   }

   function APM_register_check() {
      var datetime_pattern = /^(19|20)\d{2}(0[1-9]|1[012])(0[1-9]|[12][0-9]|3[0-1])$/;

      var contract_date = document.PTNregister.APM_register_contract_date;
      var company_name = document.PTNregister.APM_register_company_name;
      var partner_name = document.PTNregister.APM_register_partner_name;
      var phone_number = document.PTNregister.APM_register_phone_number;
      var email = document.PTNregister.APM_register_email;

      if (contract_date.value == '' || !(contract_date.value.length == 8)) {
         alert("계약시작일을 정확히 입력해주세요.");
         return false;
      } else if (!datetime_pattern.test(contract_date.value)) {
         alert("올바른 날짜 형식이 아닙니다.")
         return false;
      } else if (company_name.value == "") {
         alert("회사명을 입력해주세요.");
         return false;
      } else if (partner_name.value == "") {
         alert("이름을 선택해주세요.");
         return false;
      } else if (phone_number.value == "") {
         alert("전화번호를 입력해주세요.");
         return false;
      } else if (email.value == "") {
         alert("이메일을 입력해주세요.");
         return false;
      }
   
	       	  callAjax_APM_register_btn();
	   	          
	      	       clear_input("APM_register_contract_date");
	       	       clear_input("APM_register_company_name");
	       	       clear_input("APM_register_partner_name");
	       	       clear_input("APM_register_phone_number");
		       	   clear_input("APM_register_email");
   
   }

   function convert_fee(frm) {
      var fee = frm.rate_system.selectedIndex;

      switch (fee) {
      case 0:
         frm.fee.value = '요금제미선택';
         $("input[name='fee']").attr("readonly", true);
         break;
      case 1:
         frm.fee.value = '100,000';
         $("input[name='fee']").attr("readonly", true);
         break;
      case 2:
         frm.fee.value = '400,000';
         $("input[name='fee']").attr("readonly", true);
         break;
      case 3:
         frm.fee.value = '1,000,000';
         $("input[name='fee']").attr("readonly", true);
         break;
      case 4:
         frm.fee.value = '';
         $("input[name='fee']").attr("readonly", false);
         break;

      }
      return true;
   }

   function APM_name_search_btn() {
      var got_name = document.getElementById("search_name").value;
      alert(got_name);

   }

   function APM_company_search_btn() {
      var got_company = document.getElementById("search_campany").value;
      alert(got_company);

   }

   function APM_modify_btn_clicked() {

      alert("수정버튼이 눌렸습니다.");
      var input = document.getElementById("APM_ok");
      input.style.display = "inline";
      input.style.border = "2px solid blue";

      var APMcompany_name = document.getElementById("APM_company_name");
      $('#APM_company_name').attr("readonly", false);
      APMcompany_name.style.border = "1px solid #737373";

      var APMpartner_name = document.getElementById("APM_partner_name");
      $('#APM_partner_name').attr("readonly", false);
      APMpartner_name.style.border = "1px solid #737373";

      var APMphone_number = document.getElementById("APM_phone_number");
      $('#APM_phone_number').attr("readonly", false);
      APMphone_number.style.border = "1px solid #737373";

      var APMemail = document.getElementById("APM_email");
      $('#APM_email').attr("readonly", false);
      APMemail.style.border = "1px solid #737373";

      var APMbill_date = document.getElementById("APM_bill_date");
      $('#APM_bill_date').attr("readonly", false);
      APMbill_date.style.border = "1px solid #737373";

      var APMmargin = document.getElementById("APM_margin");
      $('#APM_margin').attr("readonly", false);
      APMmargin.style.border = "1px solid #737373";

      var APMcalculate_period = document
            .getElementById("APM_calculate_period");
      $('#APM_calculate_period').attr("readonly", false);
      APMcalculate_period.style.border = "1px solid #737373";

      var output = document.getElementById("APM_modify");
      output.style.display = "none";
   }

   function APM_ok_btn_clicked() {
      var output = document.getElementById("APM_modify");
      output.style.display = "inline";

      var input = document.getElementById("APM_ok");
      input.style.display = "none";

      alert("수정이 완료되었습니다.");

      var APMcompany_name = document.getElementById("APM_company_name");
      $('#APM_company_name').attr("readonly", true);
      APMcompany_name.style.border = "0 solid #737373";

      var APMpartner_name = document.getElementById("APM_partner_name");
      $('#APM_partner_name').attr("readonly", true);
      APMpartner_name.style.border = "0 solid #737373";

      var APMphone_number = document.getElementById("APM_phone_number");
      $('#APM_phone_number').attr("readonly", true);
      APMphone_number.style.border = "0 solid #737373";

      var APMemail = document.getElementById("APM_email");
      $('#APM_email').attr("readonly", true);
      APMemail.style.border = "0 solid #737373";

      var APMbill_date = document.getElementById("APM_bill_date");
      $('#APM_bill_date').attr("readonly", true);
      APMbill_date.style.border = "0 solid #737373";

      var APMmargin = document.getElementById("APM_margin");
      $('#APM_margin').attr("readonly", true);
      APMmargin.style.border = "0 solid #737373";

      var APMcalculate_period = document
            .getElementById("APM_calculate_period");
      $('#APM_calculate_period').attr("readonly", true);
      APMcalculate_period.style.border = "0 solid #737373";

      // TABLE 내에서 수정된 값들을 저장해 두었음.
      
      callAjax_APM_table_ok();
      
     

   } //end APM_ok_btn_clicked()

   function APM_license_register_btn() {

      var register_btn = document.getElementById("APM_license_register");
      register_btn.style.display = "none";

      var ok_btn = document.getElementById("APM_license_ok");
      ok_btn.style.display = "inline";

      var modify_btn = document.getElementById("APM_license_modify");
      modify_btn.style.display = "inline";

      alert("등록이 완료되었습니다.");

   }

   function APM_delete_btn_clicked() {
      alert("삭제버튼이 눌렸습니다.");
   } //end ARM_delete_btn_clicked()
</script>

<script type="text/javascript">
   function profile_edit_click() {
      $("input[name='profile']").attr("readonly", false);
   }

   // 계산서 발행일, 이름, 전화번호의 확인/등록 버튼
   function name_ok_click() {
      alert("이름; 수정되었습니다!");
      $("input[name='profile']").attr("readonly", true);
      //$('#profile_name').prop('readonly', false);

   }
   function phone_ok_click() {
      alert("전화번호; 수정되었습니다!");
      $("input[name='profile']").attr("readonly", true);
      //$('#profile_name').prop('readonly', false);

   }
   function calcul_ok_click() {
      alert("계산서 발행일; 등록되었습니다!");
   }
   function account_ok_click() {
      alert("통장사본; 등록되었습니다!");
   }
</script>
<script
   src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/835808530/?random=1531139707988&amp;cv=9&amp;fst=1531139707988&amp;num=1&amp;label=Cloudike%20KR%20Remarketing&amp;guid=ON&amp;resp=GooglemKTybQhCsO&amp;u_h=864&amp;u_w=1536&amp;u_ah=824&amp;u_aw=1536&amp;u_cd=24&amp;u_his=2&amp;u_tz=540&amp;u_java=false&amp;u_nplug=3&amp;u_nmime=4&amp;gtm=G6c&amp;sendb=1&amp;frm=0&amp;url=https%3A%2F%2Fasd.cloudike.kr%2Foauth%3Fuse_ajax%3D1&amp;async=1&amp;rfmt=3&amp;fmt=4"></script>

<style>
th, td {
   margin: auto;
   text-align: center;
   font-size: 12px;
}
</style>


</head>

<body class="full-height body-gray body-scroll">
   <%
      Connection conn = DatabaseUtil.getConnection();
      out.print("db 연결 정보 " + conn);


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
										
										<span class="cuser-name ng-binding"> 관리자</span>
										
										<span class="caret"></span>
										<div class="dropdown-content" style="right: 0;">
											<a ui-sref="profile"
												href="http://localhost:8080/CloudikePartner/profileAccount.jsp">프로필
												/ 설정</a> <a ui-sref="profile"
												href="http://localhost:8080/CloudikePartner/userLogout.jsp">로그아웃</a>
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
									<div id="notice_menu" class="dropdown" style="margin-top: 10px;">

										<span class="cuser-name ng-binding"> 알림 센터</span> <span
											class="caret"></span>
										<div class="dropdown-content" style="right: 0;">
											<a class="hidden-xs" href="#" dropdown-toggle=""
												disabled="disabled" aria-expanded="true"> 알림이 없습니다. </a>
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
                           </span> <span class="slide-item ng-binding">Admin Page Menu</span>
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
                              translate="" class="ng-scope"  id="side_item1"
                              style="font-weight: bold">파트너 페이지</span></span></a></li>
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

                        <div class="ng-scope" id="divProfile" style="margin-top: 20px; margin-left: 20px;">

                              <div>
                                 <FORM method="post" name="PTNregister" id="PTNregister">

                                    &nbsp;<LABEL>계약시작일</LABEL> <INPUT type="text"
                                       name="APM_register_contract_date" id="APM_register_contract_date" size="10"
                                       style="border: 2px solid #000000;">
                                    <SCRIPT type="text/javascript">
                                       spacing(6);
                                    </SCRIPT>


                                    <LABEL>회사명 </LABEL> <INPUT type="text" name="APM_register_company_name"
                                       id="APM_register_company_name" size="15"
                                       style="border: 2px solid #000000;">
                                    <SCRIPT type="text/javascript">
                                       spacing(6);
                                    </SCRIPT>

                                    <LABEL>이름</LABEL> <INPUT type="text" name="APM_register_partner_name"
                                       id="APM_register_partner_name" size="8"
                                       style="border: 2px solid #000000;">
                                    <SCRIPT type="text/javascript">
                                       spacing(6);
                                    </SCRIPT>


                                    <LABEL>전화번호</LABEL> <INPUT type="text" name="APM_register_phone_number"
                                       id="APM_register_phone_number" size="14"
                                       style="border: 2px solid #000000;">
                                    <SCRIPT type="text/javascript">
                                       spacing(6);
                                    </SCRIPT>

                                    <LABEL>이메일</LABEL> <INPUT type="text" NAME="APM_register_email"
                                       id="APM_register_email" SIZE="23" style="border: 2px solid #000000;">
                                    <SCRIPT type="text/javascript">
                                       spacing(4);
                                    </SCRIPT>
                                    <BUTTON type="button" class="btn" onclick="APM_register_check()" 
                                       style="border: 2px solid #737373;">등록</button>
                                 </FORM>
                                 &nbsp;&nbsp;
                                 <textarea name=content cols="25" rows="3" id="APM_register_contract_date_info"
                                    style="background-color: transparent; border: 0 solid black; font-size: 9pt; color: #737373; overflow: hidden;">최초 계산서 발행일      숫자8자리 ex)20180405</textarea>
                                 <SCRIPT type="text/javascript">
                                    spacing(4);
                                 </SCRIPT>
                                 <textarea name=content cols="45" rows="3" id="APM_register_company_name_info"
                                    style="background-color: transparent; border: 0 solid black; font-size: 9pt; color: #737373; overflow: hidden;">정확한 회사명을 입력해 주세요.
기존 회사명과 다를 경우 새로 등록됩니다.</textarea>
                                 <hr>

                              </div>

                              <!--  TABLE 상단 : 검색 AREA  -->
                              <div>
                                 <BUTTON type="button" class="btn" id="APM_modify"
                                    name="APM_modify" onclick="APM_modify_btn_clicked()"
                                    style="border: 2px solid #737373;">수정</button>
                                 <BUTTON type="button" class="btn" id="APM_ok" name="APM_ok"
                                    onclick="APM_ok_btn_clicked() "
                                    style="border: 2px solid #737373; display: none;">확인</button>
                                 <SCRIPT type="text/javascript">
                                    spacing(2);
                                 </SCRIPT>
                                 &nbsp;&nbsp;
                                 <BUTTON type="button" class="btn" id="APM_delete"
                                    name="APM_delete" onclick="APM_delete_btn_clicked()"
                                    style="border: 2px solid #737373;">삭제</button>
                                 <SCRIPT type="text/javascript">
                                    spacing(84);
                                 </SCRIPT>

                                 <form method=post id="APM_name_search" name="APM_name_search"
                                    style="display: inline">
                                    <LABEL>이름 </LABEL>
                                    <SCRIPT type="text/javascript">
                                       spacing(2);
                                    </SCRIPT>

                                    <INPUT type="text" name="APM_search_name" id="APM_search_name"
                                       size="10" style="border: 2px solid #737373;">
                                    <SCRIPT type="text/javascript">
                                       spacing(2);
                                    </SCRIPT>

                                    <BUTTON type="button" class="btn" id="APM_search_name_btn"
                                       style="border: 2px solid #737373;">검색</button>
                                 </form>

                                 <SCRIPT type="text/javascript">
                                    spacing(16);
                                 </SCRIPT>

                                 <form method="post" id="APM_company_search"
                                    name="APM_company_search" style="display: inline">
                                    <LABEL>회사명</LABEL>
                                    <SCRIPT type="text/javascript">
                                       spacing(2);
                                    </SCRIPT>
                                    <INPUT type="text" name="APM_" id="APM_search_company"
                                       size="17" style="border: 2px solid #737373;">
                                    <SCRIPT type="text/javascript">
                                       spacing(2);
                                    </SCRIPT>
                                    <BUTTON type="button" class="btn" id="APM_search_company_btn"
                                       style="border: 2px solid #737373;">검색</button>
                                 </form>
                                 <SCRIPT type="text/javascript">
                                    spacing(2);
                                 </SCRIPT>
                                 <textarea name=content cols="15" rows="1" id="page_info"
                                    style="background-color: transparent; border: 0 solid black; font-size: 9pt; color: #737373; overflow: hidden;">1page 1/1</textarea>
                              </div>
                              <hr>

                              <!--  CUSTOMER INFORMATION TABLE -->
                              <div>

                                 <table class="table" style="width: 1200px;">
                                    <thead class="thead-light">
                                       <tr>
                                          <th scope="col" width="5px" nowrap>#</th>
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

                                    <tbody>
                                       <tr>
                                          <th scope="row" width="2%">1</th>
                                          <td width="5%">2018/07/10</td>
                                          <td width="8%">PKP001-CK003</td>
                                          <td width="6%"><INPUT type="text"
                                             NAME="APM_company_name" id="APM_company_name" SIZE="14"
                                             value="(주)메가스터디" readonly="readonly"
                                             style="border: 0 solid black; text-align: center"></td>
                                          <td width="7%"><INPUT type="text"
                                             NAME="APM_partner_name" id="APM_partner_name" SIZE="5"
                                             value="문지환" readonly="readonly"
                                             style="border: 0 solid black; text-align: center"></td>
                                          <td width="7%"><INPUT type="text"
                                             NAME="APM_phone_number" id="APM_phone_number" SIZE="11"
                                             value="01092111220" readonly="readonly"
                                             style="border: 0 solid black; text-align: center"></td>
                                          <td width="10%"><INPUT type="text" NAME="APM_email"
                                             id="APM_email" SIZE="25" value="asdkorea123@naver.com"
                                             readonly="readonly"
                                             style="border: 0 solid black; text-align: center"></td>
                                          <td width="4%"><INPUT type="text"
                                             NAME="APM_bill_date" id="APM_bill_date" SIZE="3"
                                             value="미등록" readonly="readonly"
                                             style="border: 0 solid black; text-align: center;"></td>
                                          <td width="7%"><SELECT NAME="APM_calculate_period"
                                             id="APM_calculate_period"
                                             style="border: 1px bold #000000;">
                                                <OPTION VALUE="3개월">3 개월</OPTION>
                                                <OPTION VALUE="1개월">1 개월</OPTION>
                                          </SELECT></td>
                                          <td width="5%"><INPUT type="text" NAME="APM_margin"
                                             id="APM_margin" SIZE="3" value="30 %" readonly="readonly"
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
                                             <BUTTON type="button" id="APM_license_register"
                                                name="APM_license_register"
                                                onclick="APM_license_register_btn()"
                                                style="border: 2px solid #737373; width: 40px; height: 20px; font-size: 9px;">등록</button>
                                             <BUTTON type="button" id="APM_license_ok"
                                                name="APM_license_ok"
                                                style="border: 2px solid #737373; width: 40px; height: 20px; font-size: 9px; display: none;">확인</button>
                                             <BUTTON type="button" id="APM_license_modify"
                                                name="APM_license_modify"
                                                style="border: 2px solid #737373; width: 40px; height: 20px; font-size: 9px; display: none;">수정</button>
                                          </td>
                                          <td width="7%">
                                             <BUTTON type="button"
                                                style="border: 2px solid #737373; width: 40px; height: 20px; font-size: 9px;">확인</button>
                                             <BUTTON type="button"
                                                style="border: 2px solid #737373; width: 40px; height: 20px; font-size: 9px;">수정</button>
                                          </td>
                                       </tr>

                                    </tbody>
                                 </table>



                              </div>
   </div>





                              <!-- susu! 여기여기!!!!!!!! -->
<div id="divRM"  class="ng-scope" style="display:none";>

		<div style="margin-top:20px; margin-left:20px;"> 
                          
			<div>
			 <FORM method="post" name="ARM_register" id="ARM_register" >
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
         <BUTTON type="button" class="btn" id="ARM_register_btn" name="ARM_register_btn" onclick="ARM_register_check()" style="border:2px solid #737373;">등록</button>
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
			<BUTTON type="button" class="btn" id="ARM_delete" name="ARM_delete" onclick="ARM_delete_btn_clicked() " style="border:2px solid #737373;">삭제</button>
		</FORM>
			<SCRIPT type="text/javascript">
  				spacing(20);
            </SCRIPT>
		
			<LABEL>기간 </LABEL>
				<SCRIPT type="text/javascript">
	  				spacing(1);
	            </SCRIPT>
			<form  method=post name="ARM_search_period" id="ARM_search_period" style="display:inline">
	            <INPUT type="text" name="start_year" id="start_year" value="" size="2" style="border:2px solid #737373;">년&nbsp;&nbsp;
	            <INPUT type="text" name="start_month" id="start_month" size="1" style="border:2px solid #737373;">월 - 
	            
				<INPUT type="text" name="end_year" id="end_year" size="2" style="border:2px solid #737373;">년&nbsp;&nbsp;
	            <INPUT type="text" name="end_month" id="end_month" size="1" style="border:2px solid #737373;">월
	            
	            <BUTTON type="button" class="btn" id="ARM_period_btn" name="ARM_period_btn" style="border:2px solid #737373;">검색</button>
            </form>
            	<SCRIPT type="text/javascript">
	  				spacing(4);
	            </SCRIPT>
			<form method="post" style="display:inline">
				<LABEL>파트너코드</LABEL>
            	<INPUT type="text" name="ARM_partner_code_for_search" id="ARM_partner_code_for_search" size="12" style="border:2px solid #737373;">&nbsp;&nbsp;

				<LABEL>고객코드</LABEL>
            	<INPUT type="text" name="ARM_customer_code_for_search" id="ARM_customer_code_for_search" size="12" style="border:2px solid #737373;">&nbsp;&nbsp;            	
            	
         		<BUTTON type="button" class="btn" id="ARM_search_btn" name="ARM_search_btn" style="border:2px solid #737373;">검색</button>
			</form>
            <textarea name=content cols="15" rows="1" id="page_info" style="background-color:transparent;border:0 solid black; font-size: 9pt; color:#737373; overflow:hidden;">1page 1/1</textarea>
        </div>
     <hr>
       
       <!--  CUSTOMER INFORMATION TABLE -->
       <div>
			
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
					<%	
						Statement stmtRM = conn.createStatement();

						//ARM db로딩
						String sqlARM = "select * from ARM_table";
						stmtRM.executeQuery(sqlARM);
						ResultSet rsARM = null;
						rsARM = stmtRM.executeQuery(sqlARM);

					%>			    
			    
                    <%
                   
						
                       	while (rsARM.next()) {
						String id=rsARM.getString("id");
						String billDate = rsARM.getString("billDate");
						String userCompany = rsARM.getString("userCompany");	
						String userName = rsARM.getString("userName");
						String c_code = rsARM.getString("c_code");	
						String c_name = rsARM.getString("c_name");
						String c_plan = rsARM.getString("c_plan");
						String c_calcul = rsARM.getString("c_calcul");
						String c_fee = rsARM.getString("c_fee");
						String c_margin = rsARM.getString("c_margin");
						String c_unpaid = rsARM.getString("c_unpaid");
							
					%> 
					
					
			    
			      <th scope="row" width="2%"><input type="checkbox" class="ARM_checkSelect" id="<%=id%>" name="<%=id%>" value=<%=id%>/></th>
			      <td width="5%"><%=billDate%></td>
			      <td width="8%"><%=userCompany%></td>
			      <td width="8%"><%=userName%></td>
			      <td width="7%"><%=c_code%></td>
			      <td width="7%"><%=c_name%></td>
			      <td width="7%"><%=c_plan%></td>
			      <td width="8%"><%=c_calcul%></td>				
			      <td width="7%"><INPUT type="text" name="<%=id%>1" id="<%=id%>1" size="7" value=<%=c_fee%> readonly="readonly" style="border:0 solid black; text-align:center;"></td>
			      <td width="5%"><INPUT type="text" name="<%=id%>2" id="<%=id%>2" size="7" value=<%=c_margin%> readonly="readonly" style="border:0 solid black; text-align:center;"></td>
			      <td width="7%"><INPUT type="text" name="<%=id%>3" id="<%=id%>3" size="7" value=<%=c_unpaid%> readonly="readonly" style="border:0 solid black; text-align:center;"></td>
			    </tr>
					<%
						}
					%>
			    
			  </tbody>
			</table>
       
      
       
       </div>
</div>
                              
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>