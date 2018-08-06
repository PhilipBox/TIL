<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="util.DatabaseUtil"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.text.*" %> 
<% 	DecimalFormat format = new DecimalFormat("###,###"); %>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>Coludike</title>
<%
	Connection conn = DatabaseUtil.getConnection();
	out.print("db 연결 정보 " + conn);
%>
<style>
.filebox label { display: inline-block; padding: .5em .75em; color: #999; font-size: inherit; line-height: normal; vertical-align: middle; background-color: #fdfdfd; cursor: pointer; border: 1px solid #ebebeb; border-bottom-color: #e2e2e2; border-radius: .25em; } .filebox input[type="file"] { /* 파일 필드 숨기기 */ position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip:rect(0,0,0,0); border: 0; }


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


<script>
//HashMap : 사진 등록을 위해서
HashMap = function(){   
    this.map = new Array(); 
};   
HashMap.prototype = {   
    put : function(key, value){   
        this.map[key] = value; 
    },   
    get : function(key){   
        return this.map[key]; 
    },   
    getAll : function(){   
        return this.map; 
    },   
    clear : function(){   
        this.map = new Array(); 
    },   
    isEmpty : function(){     
         return (this.map.size() == 0); 
    }, 
    remove : function(key){     
         delete this.map[key]; 
    }, 
    toString : function(){ 
        var temp = ''; 
        for(i in this.map){   
            temp = temp + ',' + i + ':' +  this.map[i]; 
        } 
        temp = temp.replace(',',''); 
          return temp; 
    }, 
    keySet : function(){   
        var keys = new Array();   
        for(i in this.map){   
            keys.push(i); 
        }   
        return keys; 
    } 
}; 

//global 

mapB = new HashMap(); 

function upload_BDB(file, id){

	var userID = String(id.value);
	var businessImgDB="businessImgDB_"+userID;
	//alert("  "+businessImgDB);
	
	var bif = document.getElementById(businessImgDB);
	bif.click();
	//alert("1");
	
	if (checkImgSize(file) == false){
		return false;
	}
	
	
	businessImgDB = "#"+businessImgDB;
	var imgPath = $(businessImgDB).val();
	var index = imgPath.lastIndexOf("\\");
	var imgName = imgPath.substring(index + 1);
		
	mapB.put(userID, imgName); 
	// .pop().toLowerCase();
	//alert(mapB.toString());   
	//.split(".").pop().toLowerCase();
	
	var ext = (mapB.get(userID)).split(".").pop().toLowerCase();
	//alertrt(ext);   
	if (ext.length > 0) {
		if ($.inArray(ext, [ "gif", "png", "jpg" ]) == -1) {
			alert("gif,png,jpg 파일만 업로드 할수 있습니다.");
			return false;
		}
	}
	
	updateBusiness(userID, mapB.get(userID));
	//$(businessImgDB).val().toLowerCase();
}

function upload_B(file, id){

	var userID = String(id.value);
	var businessImg="businessImg_"+userID;
	//alert("  "+businessImgDB);
	
	var bif = document.getElementById(businessImg);
	bif.click();
	//alert("1");
	
	if (checkImgSize(file) == false){
		return false;
	}
	
	
	businessImg = "#"+businessImg;
	var imgPath = $(businessImg).val();
	var index = imgPath.lastIndexOf("\\");
	var imgName = imgPath.substring(index + 1);
		
	mapB.put(userID, imgName); 
	// .pop().toLowerCase();
	 //alert(mapB.toString());   
	//.split(".").pop().toLowerCase();
	
	var ext = (mapB.get(userID)).split(".").pop().toLowerCase();
//	alert(ext);   
	if (ext.length > 0) {
		if ($.inArray(ext, [ "gif", "png", "jpg" ]) == -1) {
			alert("gif,png,jpg 파일만 업로드 할수 있습니다.");
			return false;
		}
	}
	
	updateBusiness(userID, mapB.get(userID));
	//$(businessImg).val().toLowerCase();
}


function upload_ADB(file, id){

	var userID = String(id.value);
	var accountImgDB="accountImgDB_"+userID;
	//alert("  "+businessImgDB);
	
	var bif = document.getElementById(accountImgDB);
	bif.click();
	//alert("1");
	
	if (checkImgSize(file) == false){
		return false;
	}
	
	
	accountImgDB = "#"+accountImgDB;
	var imgPath = $(accountImgDB).val();
	var index = imgPath.lastIndexOf("\\");
	var imgName = imgPath.substring(index + 1);
		
	mapB.put(userID, imgName); 
	// .pop().toLowerCase();
	 //alert(mapB.toString());   
	//.split(".").pop().toLowerCase();
	
	var ext = (mapB.get(userID)).split(".").pop().toLowerCase();
	//alert(ext);   
	if (ext.length > 0) {
		if ($.inArray(ext, [ "gif", "png", "jpg" ]) == -1) {
			alert("gif,png,jpg 파일만 업로드 할수 있습니다.");
			return false;
		}
	}
	
	updateAccount(userID, mapB.get(userID));
	//$(businessImgDB).val().toLowerCase();
}

function upload_A(file, id){
	var userID = String(id.value);
	var accountImg="accountImg_"+userID;
	//alert("  "+businessImgDB);
	
	var bif = document.getElementById(accountImg);
	bif.click();
	//alert("1");
	
	if (checkImgSize(file) == false){
		return false;
	}
	
	
	accountImg = "#"+accountImg;
	var imgPath = $(accountImg).val();
	var index = imgPath.lastIndexOf("\\");
	var imgName = imgPath.substring(index + 1);
		
	mapB.put(userID, imgName); 
	// .pop().toLowerCase();
	 //alert(mapB.toString());   
	//.split(".").pop().toLowerCase();
	
	var ext = (mapB.get(userID)).split(".").pop().toLowerCase();
	//alert(ext);   
	if (ext.length > 0) {
		if ($.inArray(ext, [ "gif", "png", "jpg" ]) == -1) {
			alert("gif,png,jpg 파일만 업로드 할수 있습니다.");
			return false;
		}
	}
	
	updateAccount(userID, mapB.get(userID));
	//$(businessImg).val().toLowerCase();
}


//

	function checkImgSize(file) {
		// 사이즈체크
		//alert("checkImgSize 들어왔음"+file);
		var maxSize = 5 * 1024 * 1024 //
		var fileSize = 0;
		// 브라우저 확인
		var browser = navigator.appName;
		// 익스플로러일 경우
		if (browser == "Microsoft Internet Explorer") {
			var oas = new ActiveXObject("Scripting.FileSystemObject");
			fileSize = oas.getFile(file.value).size;
		}
		// 익스플로러가 아닐경우
		else {
			fileSize = file.files[0].size;
		}

		//alert("파일사이즈 : " + fileSize + ", 최대파일사이즈 : 5MB");

		if (fileSize > maxSize) {
			alert("첨부파일 사이즈는 5MB 이내로 등록 가능합니다.");
			return false;
		}

		//document.fileForm.submit();
		return true;
	}


	
	function updateBusiness(userID, imgName) {
		//alert("real" + imgName);
		$.ajax({
			type : "post",
			url : "./profileBusinessSet.jsp", //profileBusinessSet
			data : {
				userCode :userID,
				business : imgName
			},
			success : ajaxSuccess,
			error : ajaxError
		});

		//$("#business").text("등록");
	}
	function updateAccount(userID, imgName) {
		//alert("real" + imgName);
		$.ajax({
			type : "post",
			url : "./profileAccountSet.jsp", //profileBusinessSet
			data : {
				userCode :userID,
				account : imgName
			},
			success : ajaxSuccess,
			error : ajaxError
		});

		//$("#business").text("등록");
	}
	function ajaxSuccess() {
		alert("Success");
	}
	function ajaxError() {
		alert("Error");
	}
</script>

<script>
	function editBusiness(id) {
		
		var userID = String(id.value);
		
		var divID_E="#divBusinessEdit_"+userID;
		var divID_R="#divBusinessRegister_"+userID;

		$(divID_E).css("display", "none");
		$(divID_R).css("display", "block");
		
		//$("#divBusinessEdit").css("display", "none");
		//$("#divBusinessRegister").css("display", "block");
	}
	
	function editAccount(id) {
		var userID = String(id.value);
		
		var divID_E="#divAccountEdit_"+userID;
		var divID_R="#divAccountRegister_"+userID;

		$(divID_E).css("display", "none");
		$(divID_R).css("display", "block");
	}
	
</script>

<!-- 파트너 검색 -->
<script>
function PMtotalTable() {
	PMtotalSearch();
}
function searchName() {
	PMsearchName();
	
}
function searchCompany() {
	PMsearchCompany();
	
}

function PMtotalSearch() {
	alert("들어옴");
	$.ajax({
		type : "post",
		url : "./adminTotalSearchPM.jsp",
		data : {

		},
		success : PMSuccess,
		error : PMError
	});
}
function PMsearchName() {
	alert("들어옴");
	$.ajax({
		type : "post",
		url : "./adminSearchNamePM.jsp",
		data : {
			name : $('#ARM_name').val()
		},
		success : PMSuccess,
		error : PMError
	});
}

function PMsearchCompany() {
	alert("들어옴");
	$.ajax({
		type : "post",
		url : "./adminSearchCompanyPM.jsp",
		data : { //APM_company
			company : $('#APM_company').val()
		},
		success : PMSuccess,
		error : PMError
	});
}// END 등록 버튼 데이터 전송 함수
 function PMSuccess(resdata){
     $("#divTableP").html(resdata);
     console.log(resdata);
 }
 function PMError(){
     alert("Error");
 }
</script>

<!-- 실적관리 검색 -->
<script>
function totalTable() {
	RMtotalSearch();
}
function currentMonthFunction() {
	alert("이번달");
	
	<%int currentYear = Calendar.getInstance().get(Calendar.YEAR);
			int currentMonth = Calendar.getInstance().get(Calendar.MONTH) + 1;%>

	var currentYear = <%=currentYear%>;
	var currentMonth = <%=currentMonth%>;

	var scurrentYear = String(currentYear);
	var scurrentMonth = String(currentMonth);
	
	if(currentMonth<10)
		scurrentMonth = "0"+scurrentMonth;

	var startDate = scurrentYear+"/"+scurrentMonth+"/01";
	var endDate = scurrentYear+"/"+scurrentMonth+"/31";
	var customer_code="";
	var partner_code="";
	//alert("ees달"+scurrentYear);
	RMsearch(startDate, endDate, customer_code, partner_code );
	//RMsearch(); //callAjax_ARM_codeSearch
	
}

function preMonthFunction() {
	alert("지난달");
	
	
	<%int preYear = Calendar.getInstance().get(Calendar.YEAR);
			int preMonth = Calendar.getInstance().get(Calendar.MONTH);%>

	var preYear = <%=preYear%>;
	var preMonth = <%=preMonth%>;

	var spreYear = String(preYear);
	var spreMonth = String(preMonth);
	
	
	
	if(spreMonth<10)
		spreMonth = "0"+spreMonth;

	var startDate = spreYear+"/"+spreMonth+"/01";
	var endDate = spreYear+"/"+spreMonth+"/31";
	var customer_code="";
	var partner_code="";
	alert("ees달"+endDate);
	RMsearch(startDate, endDate, customer_code, partner_code );
	//RMsearch(); //callAjax_ARM_codeSearch

}


//검색버튼

function searchBtn(){//ARM_search_btn
		
		 var start_year = $('#start_year').val();
		 var start_month = $('#start_month').val();
		 var end_year = $('#end_year').val();
		 var end_month = $('#end_month').val();
		 
		 var customer_code = $('#customer_code').val();
		 var partner_code = $( '#partner_code').val();
		 
		 var startDate="";
		 var endDate="";
		
		 //유효성 검사
		 if(customer_code==""&&partner_code==""){
		 if((start_year=="")||(start_month=="")||(end_year=="")||(end_month=="")){
			 alert("기간/파트너코드/고객코드 중 하나는 꼭 입력하세요.");
			 $("#start_year").val("");
			 $("#start_month").val("");
			 $("#end_year").val("");
			 $("#end_month").val("");
			$("#start_year").focus();
				
		 		return;}
		 }
		 if(!(customer_code=="")&&(!partner_code=="")){
			 alert("파트너코드/고객코드는 동시에 검색할 수 없습니다.");
			 $("#start_year").val("");
			 $("#start_month").val("");
			 $("#end_year").val("");
			 $("#end_month").val("");
			$("#start_year").focus();
			 return;
		 }
		 if(!((start_year=="")||(start_month=="")||(end_year=="")||(end_month==""))){
	           startDate = start_year+"/"+start_month+"/01";
	           endDate = end_year+"/"+end_month+"/31";
	      }
		
		RMsearch(startDate, endDate, customer_code, partner_code ); //callAjax_ARM_codeSearch

	}
function RMtotalSearch() {
	alert("들어옴");
	$.ajax({
		type : "post",
		url : "./adminTotalSearchRM.jsp",
		data : {
			userCode : $('#userCode').val()

		},
		success : ssSuccess,
		error : ssError
	});
}
	function RMsearch(startDate, endDate, customer_code, partner_code ) {
		alert("들어옴");
		$.ajax({
			type : "post",
			url : "./adminSearchRM.jsp",
			data : {
				startDate : startDate,
				endDate : endDate,
				customer_code : customer_code,
		partner_code : partner_code
			},
			success : ssSuccess,
			error : ssError
		});
	}// END 등록 버튼 데이터 전송 함수
	 function ssSuccess(resdata){
         $("#divTable").html(resdata);
         console.log(resdata);
     }
     function ssError(){
         alert("Error");
     }
</script>

<!-- CSS 토글 효과 -->
<script type="text/javascript">
$(document)
.ready(
		function() {
			$("#flipP").click(function() {
				  
				$("#flipContentP").slideToggle("slow");
			});
			$("#flipRM").click(function() {
				$("#flipContentRM").slideToggle("slow");
			});
		});


</script>



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


   	    
   	    //[ARM] 각 버튼에 데이터 전송 함수들
   	    function callAjax_ARM_period_btn(){
   	        $.ajax({
   		        type: "post",
   		        url : "./test2.jsp",
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
   		        url : "./adminRMRegister.jsp",
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
   		        url : "./test2.jsp",
   		        data: {
   		        	ajax_ARM_customer_code_for_search : $('#ARM_customer_code_for_search').val(),
   	       			ajax_ARM_partner_code_for_search : $('#ARM_partner_code_for_search').val(),
   		        },
   		        success: whenSuccess,
   		        error: whenError
   	     	});
   	    }// END 등록 버튼 데이터 전송 함수
   	    
 	    function callAjax_ARM_table_ok(c_code, fee, margin, unpaid){
   	    	$.ajax({
   		        type: "post",
   		        url : "./adminRMSet.jsp",
   		        data: {
   		        	ajax_ARM_table_c_code : $(c_code).val(),
   		        	ajax_ARM_table_fee : $(fee).val(),
   		        	ajax_ARM_table_margin : $(margin).val(),
   		        	ajax_ARM_table_unpaid : $(unpaid).val(),
   		        },
   		        success: whenSuccess,
   		        error: whenError
   	     	});
   	    }// END 테이블 수정 후 확인 데이터 전송 함수
   	    
 	    function callAjax_ARM_table_delete(c_code){
   	    	$.ajax({
   		        type: "post",
   		        url : "./adminRMDelete.jsp",
   		        data: {
   		        	ajax_ARM_table_c_code_for_delete : $(c_code).val(),
   		        },
   		        success: whenSuccess,
   		        error: whenError
   	     	});
   	    }
   	    
   	    
   	    
   	    ///////////////////////////////////////////////////////////////////////////////////////////////
   		////[APM] 각 버튼에 데이터 전송 함수들																	APM ajax function
   	    
   		//// 0726
   	    function callAjax_APM_register_btn(){
   	        $.ajax({
   		        type: "post",
   		        url : "./adminPMRegister.jsp",
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
   	    

   	    
   	    
 	    function callAjax_APM_table_ok(table_userCode, table_userCompany,table_userName, table_userTel, table_email, table_billDate, table_calcul, table_margin){
   	        $.ajax({
   		        type: "post",
   		        url : "./adminPMSet.jsp",
   		        data: {
   		        	ajax_APM_table_userCode : $(table_userCode).val(),
   		        	ajax_APM_table_userCompany : $(table_userCompany).val(),
   		        	ajax_APM_table_userName : $(table_userName).val(),
   		        	ajax_APM_table_userTel : $(table_userTel).val(),
   		        	ajax_APM_table_email : $(table_email).val(),
   		        	ajax_APM_table_billDate : $(table_billDate).val(),
   		        	ajax_APM_table_calcul : $(table_calcul).val(),
   		        	ajax_APM_table_margin : $(table_margin).val(),
   		        },
   		        success: whenSuccess,
   		        error: whenError
   	     	});
   	    }// END 테이블 수정 후 확인 데이터 전송 함수
   	    
   	    
   	    
 	    function callAjax_APM_table_delete(c_code){
   	    	$.ajax({
   		        type: "post",
   		        url : "./adminPMDelete.jsp",
   		        data: {
   		        	ajax_APM_table_c_code_for_delete : $(c_code).val(),
   		        },
   		        success: whenSuccess,
   		        error: whenError
   	     	});
   	    }
   	    
   	    
   	    ///////////////////////////////////////////////////////////////////////////////////////////////

   	    
   	    // ajax에서 공통적으로 사용할 함수 모듈화 
   	    function whenSuccess(resdata){
   	        $("#ajaxReturn").html(resdata);
   	        System.out.println("SUCESS : [Ajax] 데이터 전송 성공");
   	    }
   	    function whenError(){
   	    	System.out.println("ERROR : [Ajax] 에러 발생");
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
      } else if (ARM_partner_code.value != "") {
    	  var code = 0;
		<%Statement stmtCode = conn.createStatement();
			String sqlCodeSearch = "select * from partner;";
			stmtCode.executeQuery(sqlCodeSearch);
			ResultSet rsCodeSearch = null;
			rsCodeSearch = stmtCode.executeQuery(sqlCodeSearch);

			int cnt = 0;
			while (rsCodeSearch.next()) {
				String PartnerCode = rsCodeSearch.getString("userCode");%>
		var partner_code = Array();			
		partner_code[<%=cnt%>] = "<%=PartnerCode%>";

			if (ARM_partner_code.value.toLowerCase() == partner_code[<%=cnt%>].toLowerCase()) {
				code++; // 같은 파트너 코드가 있다는 것.
			}
<%cnt = cnt + 1;
			} //end while%>
	if (code == 0) {
				alert("존재하지 않는 파트너 코드입니다.");
				return false;
			}
			//end 파트너 코드 검사
		}

		// 파트너코드 유효성 검사 때문에, 위의 조건문과 아래 조건문을 else if로 이으면 안됨.
		// 한번 끊고 아래 고객사 이름부터 새로운 if문으로 진행되어야함.
		if (ARM_partner_name.value == "") {
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

		totalTable();
		
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

		var delete_btn = document.getElementById("ARM_delete");
		delete_btn.style.visibility = "hidden";
		
		
		var send_array = Array();
		var send_cnt = 0;
		var chkbox = $(".ARM_checkSelect");

		var ARM_all_chkbox = document.getElementById("ARM_index_main");
	    $(ARM_all_chkbox).attr("disabled", true);
		
		for (var i = 0; i < chkbox.length; i++) {

			if (chkbox[i].checked == true) {
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
		
		
		var send_array = Array();
		var send_cnt = 0;
		var chkbox = $(".ARM_checkSelect");
		
		for (var i = 0; i < chkbox.length; i++) {
			if (chkbox[i].checked == true) {

				send_array[send_cnt] = chkbox[i].value;
				send_array[send_cnt] = send_array[send_cnt].replace("/", "");

				Delete_table_col(send_array[send_cnt]);
				send_cnt++;
			}
		}
		
		totalTable();
		
	} //end ARM_delete_btn_clicked()

	function ARM_ok_btn_clicked() {
		var output = document.getElementById("ARM_modify");
		output.style.display = "inline";

		var input = document.getElementById("ARM_ok");
		input.style.display = "none";

		var delete_btn = document.getElementById("ARM_delete");
		delete_btn.style.visibility = "visible";
		
		alert("수정이 완료되었습니다.");

		var send_array = Array();
		var send_cnt = 0;
		var chkbox = $(".ARM_checkSelect");

		var ARM_all_chkbox = document.getElementById("ARM_index_main");
	    $(ARM_all_chkbox).attr("disabled", false);
		
		for (var i = 0; i < chkbox.length; i++) {
			if (chkbox[i].checked == true) {
				var chkbox_state = document.getElementById(chkbox[i].id);
				$(chkbox_state).attr("disabled", false);

				send_array[send_cnt] = chkbox[i].value;
				send_array[send_cnt] = send_array[send_cnt].replace("/", "");

				ChangeInputState_for_register(send_array[send_cnt]);
				send_cnt++;
			}
		}
		// 하나의 배열로 담을 때 아래처럼 처리함. 아직 쓸일은 없더라.
		// $("#array").val(send_array);

	}

	function Delete_table_col(RM_table_id) {
		var c_code = document.getElementById(RM_table_id + 0)

		callAjax_ARM_table_delete(c_code);
	}
	
	
	
	function ChangeInputState_for_modification(RM_table_id) {
		//해당 index(piramry key)에서 활성화가 되어야 할 INPUT 전체 변경

		var table_fee = document.getElementById(RM_table_id + 1);
		$(table_fee).attr("readonly", false);
		table_fee.style.border = "1px solid #737373";

		var table_margin = document.getElementById(RM_table_id + 2);
		$(table_margin).attr("readonly", false);
		table_margin.style.border = "1px solid #737373";

		var table_unpaid = document.getElementById(RM_table_id + 3);
		$(table_unpaid).attr("readonly", false);
		table_unpaid.style.border = "1px solid #737373";

	}

	function ChangeInputState_for_register(RM_table_id) {
		//해당 index(piramry key)에서 활성화가 되어야 할 INPUT 전체 변경

		var c_code = document.getElementById(RM_table_id + 0)

		var table_fee = document.getElementById(RM_table_id + 1);
		$(table_fee).attr("readonly", true);
		table_fee.style.border = "0 solid blue";

		var table_margin = document.getElementById(RM_table_id + 2);
		$(table_margin).attr("readonly", true);
		table_margin.style.border = "0 solid blue";

		var table_unpaid = document.getElementById(RM_table_id + 3);
		$(table_unpaid).attr("readonly", true);
		table_unpaid.style.border = "0 solid blue";

		//Id값을 담은 객체를 보내줘야해!

		callAjax_ARM_table_ok(c_code, table_fee, table_margin, table_unpaid);

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
		var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		var regPhone = /^[0-9]+$/;

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
		} else if (!(regPhone.test(phone_number.value))) {
			alert("숫자만 입력해 주세요.");
			return false;
		} else if (phone_number.value.length > 0
				&& phone_number.value.length < 10) {
			alert("전화번호를 정확히 입력해주세요.");
			// 1~9글자면 Error
			return false;
		} else if (phone_number.value.length > 11) {
			alert("전화번호를 정확히 입력해주세요.");
			// 12글자부터 글자수 초과 Error
			return false;
		} else if (email.value == "") {
			alert("이메일을 입력해주세요.");
			return false;
		} else if (!(regEmail.test(email.value))) {
			alert("이메일을 정확히 입력해주세요.");
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

		// 수정버튼을 눌렀으니, 수정을 하고 나서는 확인버튼을 눌러야겠지.
		// 숨겨져있던 확인버튼을 inline을 주어 활성화 시키는 코드
		var input = document.getElementById("APM_ok");
		input.style.display = "inline";
		input.style.border = "2px solid blue";

		
		var delete_btn = document.getElementById("APM_delete");
		delete_btn.style.visibility = "hidden";
		
		
		/*
		1#  체크박스에 체크되어있는 값들을 확인
		2#  체크된 박스는 '확인'버튼을 누르기 전까지 다시 클릭을 할 수 없게 비활성화 시킴(disabled= true)
		3#  체크된 줄 (row) 에 대해서 수정할 수 있는 부분들에 대해서 Input 활성화 ( ChangeInputState_for_modification )
		
		 */

		var send_array = Array();
		var send_cnt = 0;
		var chkbox = $(".APM_checkSelect");

		var APM_all_chkbox = document.getElementById("APM_index_main");
	    $(APM_all_chkbox).attr("disabled", true);
		
		
		for (var i = 0; i < chkbox.length; i++) {

			if (chkbox[i].checked == true) {
				var chkbox_state = document.getElementById(chkbox[i].id);
				$(chkbox_state).attr("disabled", true);

				send_array[send_cnt] = chkbox[i].value;
				send_array[send_cnt] = send_array[send_cnt].replace("/", "");

				APM_ChangeInputState_for_modification(send_array[send_cnt]);

				send_cnt++;

			}
		}
		// 하나의 배열로 담을 때 아래처럼 처리함. 아직 쓸일은 없더라.
		// $("#array").val(send_array);

		var output = document.getElementById("APM_modify");
		output.style.display = "none";
	}

	function APM_ok_btn_clicked() {
		var output = document.getElementById("APM_modify");
		output.style.display = "inline";

		var input = document.getElementById("APM_ok");
		input.style.display = "none";
		
		var delete_btn = document.getElementById("APM_delete");
		delete_btn.style.visibility = "visible";

		
		
		alert("수정이 완료되었습니다.");

		var send_array = Array();
		var send_cnt = 0;
		var chkbox = $(".APM_checkSelect");

		var APM_all_chkbox = document.getElementById("APM_index_main");
	    $(APM_all_chkbox).attr("disabled", false);
	    
		for (var i = 0; i < chkbox.length; i++) {
			if (chkbox[i].checked == true) {
				var chkbox_state = document.getElementById(chkbox[i].id);
				$(chkbox_state).attr("disabled", false);

				send_array[send_cnt] = chkbox[i].value;
				send_array[send_cnt] = send_array[send_cnt].replace("/", "");
 
				alert("susuID"+ send_array[send_cnt]);
				APM_ChangeInputState_for_register(send_array[send_cnt]);
				send_cnt++;
			}
		}
		// 하나의 배열로 담을 때 아래처럼 처리함. 아직 쓸일은 없더라.
		// $("#array").val(send_array);

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
		
		var send_array = Array();
		var send_cnt = 0;
		var chkbox = $(".APM_checkSelect");
		
		for (var i = 0; i < chkbox.length; i++) {
			if (chkbox[i].checked == true) {

				send_array[send_cnt] = chkbox[i].value;
				send_array[send_cnt] = send_array[send_cnt].replace("/", "");
				
				APM_Delete_table_col(send_array[send_cnt]);
				send_cnt++;
			}
		}
		
		PMtotalTable();
		
	} //end APM_delete_btn_clicked()

	function APM_ChangeInputState_for_modification(PM_table_id) {
		//해당 index(piramry key)에서 활성화가 되어야 할 INPUT 전체 변경

		var table_userCompany = document.getElementById(PM_table_id + 1);
		$(table_userCompany).attr("readonly", false);
		table_userCompany.style.border = "1px solid #737373";

		var table_userName = document.getElementById(PM_table_id + 2);
		$(table_userName).attr("readonly", false);
		table_userName.style.border = "1px solid #737373";

		var table_userTel = document.getElementById(PM_table_id + 3);
		$(table_userTel).attr("readonly", false);
		table_userTel.style.border = "1px solid #737373";

		var table_userEmail = document.getElementById(PM_table_id + 4);
		$(table_userEmail).attr("readonly", false);
		table_userEmail.style.border = "1px solid #737373";

		var table_billDate = document.getElementById(PM_table_id + 5);
		$(table_billDate).attr("readonly", false);
		table_billDate.style.border = "1px solid #737373";

		var table_calcul = document.getElementById(PM_table_id + 6);
		$(table_calcul).attr("readonly", false);
		$(table_calcul).attr("disabled", false);
		table_calcul.style.border = "1px solid #737373";

		var table_margin = document.getElementById(PM_table_id + 7);
		$(table_margin).attr("readonly", false);
		table_margin.style.border = "1px solid #737373";

	}

	// APM체인지
	function APM_ChangeInputState_for_register(PM_table_id) {
		//해당 index(piramry key)에서 활성화가 되어야 할 INPUT 전체 변경

		var table_userCode = document.getElementById(PM_table_id + 0);

		var table_userCompany = document.getElementById(PM_table_id + 1);
		$(table_userCompany).attr("readonly", true);
		table_userCompany.style.border = "0 solid blue";

		var table_userName = document.getElementById(PM_table_id + 2);
		$(table_userName).attr("readonly", true);
		table_userName.style.border = "0 solid blue";

		var table_userTel = document.getElementById(PM_table_id + 3);
		$(table_userTel).attr("readonly", true);
		table_userTel.style.border = "0 solid blue";

		var table_email = document.getElementById(PM_table_id + 4);
		$(table_email).attr("readonly", true);
		table_email.style.border = "0 solid blue";

		var table_billDate = document.getElementById(PM_table_id + 5);
		$(table_billDate).attr("readonly", true);
		table_billDate.style.border = "0 solid blue";

		var table_calcul = document.getElementById(PM_table_id + 6);
		$(table_calcul).attr("readonly", true);
		$(table_calcul).attr("disabled", true);
		table_calcul.style.border = "0 solid blue";

		var table_margin = document.getElementById(PM_table_id + 7);
		$(table_margin).attr("readonly", true);
		table_margin.style.border = "0 solid blue";

		//Id값을 담은 객체를 보내줘야해!
		callAjax_APM_table_ok(table_userCode, table_userCompany,
				table_userName, table_userTel, table_email, table_billDate,
				table_calcul, table_margin);

	}
	
	
	function APM_Delete_table_col(PM_table_id) {
		var c_code = document.getElementById(PM_table_id + 0)

		callAjax_APM_table_delete(c_code);
	}
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

textarea {
	resize: none;
}
</style>


</head>

<body class="full-height body-gray ">

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

										<span class="cuser-name ng-binding"> 관리자</span> <span
											class="caret"></span>
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
									<div id="notice_menu" class="dropdown"
										style="margin-top: 10px;">

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
										translate="" class="ng-scope" id="side_item1"
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

							<!-- ngInclude: 'clFolderContents/folderContentsAsList.tpl.html' -->

							<!-- susu ! 테이블 자리!!!!!! 여기 잘림 !!!!!!! -->

							<div class="ng-scope" id="divProfile"
								style="margin-top: 20px; margin-left: 20px;">
								<div id="flipP" style="display: inline">
									<h3 style="color:#428BCA; display: inline" >상세검색▼<SCRIPT type="text/javascript">spacing(150);</SCRIPT></h3>
										</div>
								<div id="flipContentP" style="display: none;">
									<div>
										<FORM method="post" name="PTNregister" id="PTNregister">

											&nbsp;<LABEL>계약시작일</LABEL> <INPUT type="text"
												name="APM_register_contract_date"
												id="APM_register_contract_date" size="10"
												style="border: 2px solid #000000;">
											<SCRIPT type="text/javascript">
												spacing(6);
											</SCRIPT>


											<LABEL>회사명 </LABEL> <INPUT type="text"
												name="APM_register_company_name"
												id="APM_register_company_name" size="15"
												style="border: 2px solid #000000;">
											<SCRIPT type="text/javascript">
												spacing(6);
											</SCRIPT>

											<LABEL>이름</LABEL> <INPUT type="text"
												name="APM_register_partner_name"
												id="APM_register_partner_name" size="8"
												style="border: 2px solid #000000;">
											<SCRIPT type="text/javascript">
												spacing(6);
											</SCRIPT>


											<LABEL>전화번호</LABEL> <INPUT type="text"
												name="APM_register_phone_number"
												id="APM_register_phone_number" size="14"
												style="border: 2px solid #000000;">
											<SCRIPT type="text/javascript">
												spacing(6);
											</SCRIPT>

											<LABEL>이메일</LABEL> <INPUT type="text"
												NAME="APM_register_email" id="APM_register_email" SIZE="23"
												style="border: 2px solid #000000;">
											<SCRIPT type="text/javascript">
												spacing(4);
											</SCRIPT>
											<BUTTON type="button" class="btn"
												onclick="APM_register_check()"
												style="border: 2px solid #737373;">등록</button>
										</FORM>
										<textarea name=content cols="18" rows="2"
											id="APM_register_contract_date_info"
											style="background-color: transparent; border: 0 solid black; font-size: 9pt; color: #737373; overflow: hidden;">최초 계산서 발행일      숫자8자리 ex)20180405</textarea>
										<SCRIPT type="text/javascript">
											spacing(20);
										</SCRIPT>
										<textarea name=content cols="45" rows="2"
											id="APM_register_company_name_info"
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
										<BUTTON type="button" class="btn" id="APM_delete"
											name="APM_delete" onclick="APM_delete_btn_clicked()"
											style="border: 2px solid #737373;">삭제</button>
										<SCRIPT type="text/javascript">
											spacing(84);
										</SCRIPT>

										<LABEL>이름 </LABEL>
										<SCRIPT type="text/javascript">
											spacing(2);
										</SCRIPT>

										<INPUT type="text" name="ARM_name" id="ARM_name" size="10"
											style="border: 2px solid #737373;">
										<SCRIPT type="text/javascript">
											spacing(2);
										</SCRIPT>

										<BUTTON type="button" class="btn" onclick="searchName();"
											style="border: 2px solid #737373;">검색</button>


										<SCRIPT type="text/javascript">
											spacing(16);
										</SCRIPT>

										<form method="post" id="APM_company_search"
											name="APM_company_search" style="display: inline">
											<LABEL>회사명</LABEL>
											<SCRIPT type="text/javascript">
												spacing(2);
											</SCRIPT>
											<INPUT type="text" name="APM_company" id="APM_company"
												size="17" style="border: 2px solid #737373;">
											<SCRIPT type="text/javascript">
												spacing(2);
											</SCRIPT>
											<BUTTON type="button" class="btn" onclick="searchCompany();"
												style="border: 2px solid #737373;">검색</button>
										</form>
										<SCRIPT type="text/javascript">
											spacing(2);
										</SCRIPT>
										<textarea name=content cols="15" rows="1" id="page_info"
											style="background-color: transparent; border: 0 solid black; font-size: 9pt; color: #737373; overflow: hidden;">1page 1/1</textarea>
									</div>
								</div>
								<hr>
								<div>
									<div>
										<h3 style="display: inline-block; margin-right: 10px;">내역</h3>
										<button
												style="display: inline-block; vertical-align: baseline;"
												class="btn" onclick="PMtotalTable();">전체</button>

									</div>
									<!--  CUSTOMER INFORMATION TABLE -->
									<div id="divTableP">
									<form action="adminImgSet.jsp" method="post"
										enctype="multipart/form-data">
										<table class="table" id="APM_table" style="width: 1200px;">
											<thead class="thead-light">
												<tr>
													<th scope="col" width="5px" nowrap><input
														type="checkbox" name="APM_index" id="APM_index_main"
														value="0" /></th>
													<th scope="col" width="10px" nowrap>계약시작일</th>
													<th scope="col" width="10px" nowrap>파트너코드</th>
													<th scope="col" width="10px" nowrap>회사명</th>
													<th scope="col" width="10px">이름</th>
													<th scope="col" width="10px">전화번호</th>
													<th scope="col" width="10px">이메일</th>
													<th scope="col" width="10px">계산서 발행일</th>
													<th scope="col" width="10px">정산주기</th>
													<th scope="col" width="10px">마진율</th>
													<th scope="col" width="10px">사업자등록증</th>
													<th scope="col" width="10px">통장사본</th>
												</tr>
											</thead>


											<tr>
												<%
													// 파트너테이블
													Statement stmtPM = conn.createStatement();

													//실적관리 db로딩
													String sqlPM = "select *  FROM partner;";
													stmtPM.executeQuery(sqlPM);
													ResultSet rsPM = null;
													rsPM = stmtPM.executeQuery(sqlPM);
												%>

												<%
													while (rsPM.next()) {
														String APM_id = rsPM.getString("userCode");
														
														if(APM_id.equals("admin"))
															continue;
														String APM_contDate = rsPM.getString("contDate");
														String APM_userCode = rsPM.getString("userCode");
														String APM_userCompany = rsPM.getString("userCompany");
														String APM_userName = rsPM.getString("userName");
														String APM_phoneNum = rsPM.getString("userTel");
														String APM_email = rsPM.getString("userEmail");
														String APM_billDate = rsPM.getString("billDate");
														String APM_calcul = rsPM.getString("calcul");
														String APM_margin = rsPM.getString("margin");
														String APM_business = rsPM.getString("business");
														String APM_account = rsPM.getString("account");
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

												<td width="7%"><SELECT NAME="<%=APM_id%>6"
													disabled="disabled" id="<%=APM_id%>6"
													style="border: 1px bold #000000;">
														<OPTION VALUE="3개월">3 개월</OPTION>
														<OPTION VALUE="1개월">1 개월</OPTION>
												</SELECT></td>
												<td width="5%"><INPUT type="text" NAME="<%=APM_id%>7"
													id="<%=APM_id%>7" SIZE="3" value="<%=APM_margin%>"
													readonly="readonly"
													style="border: 0 solid black; text-align: center;">%</td>
												<td width="7%">
					<%
						//regiBusiness
							if (!APM_business.equals("미등록")) {
					%>
					<div id="divBusinessEdit_<%=APM_id%>">
						<a id="account" class="btn btn-default" href="profileImgDown.jsp?file_name=<%=APM_business%>">확인 </a>
						<BUTTON type="button" onclick="editBusiness(<%=APM_id%>);"
							class="btn btn-default" >수정</button>
					</div> <%
 	} else if (APM_business.equals("미등록")) {
 %>
					<div id="divBusinessRegister_<%=APM_id%>">

						<input type='file' id="businessImgDB_<%=APM_id%>" name="businessImgDB_<%=APM_id%>"
							style="width:0px; height:0px"	/>
						<button class="btn btn-default"
							onfocus="this.blur();" onclick="upload_BDB(this.form.businessImgDB_<%=APM_id%>,<%=APM_id%>);">등록</button>
						
					</div> <%
 	}
 %>

					<div id="divBusinessEdit_<%=APM_id%>" style="display: none">
					<a id="account"  class="btn btn-default" href="profileImgDown.jsp?file_name=<%=APM_business%>">확인 </a>
						
						<BUTTON type="button" onclick="editBusiness(<%=APM_id%>);" class="btn btn-default"
							style="border: 2px solid #737373;">수정</button>
					</div>
					<div id="divBusinessRegister_<%=APM_id%>" style="display:none;">

						<input type='file' id="businessImg_<%=APM_id%>" name="businessImg_<%=APM_id%>"
							style="width:0px; height:0px"/>
						<button class="btn btn-default"
							onfocus="this.blur();" onclick="upload_B(this.form.businessImg_<%=APM_id%>,<%=APM_id%>);">등록</button>
						

					</div>
				</td>
												<td width="7%">
					<%
						if (!APM_account.equals("미등록")) {
					%>
					<div id="divAccountEdit_<%=APM_id%>">
						<a id="account"  class="btn btn-default" href="profileImgDown.jsp?file_name=<%=APM_account%>">확인 </a>
						<BUTTON type="button" onclick="editAccount(<%=APM_id%>);"
							class="btn btn-default" >수정</button>
					</div> <%
 	} else if (APM_account.equals("미등록")) { // divAccountRegister accountImgDB accountOk accountImg
 %>
					<div id="divAccountRegister_<%=APM_id%>" >

						<input type='file' id="accountImgDB_<%=APM_id%>" name="accountImgDB_<%=APM_id%>"
							style="width:0px; height:0px"	/>
						<button class="btn btn-default"
							onfocus="this.blur();" onclick="upload_ADB(this.form.accountImgDB_<%=APM_id%>,<%=APM_id%>);">등록</button>
						

					</div> <%
 	}
 %>
					<div id="divAccountEdit_<%=APM_id%>" style="display: none;">
						<a id="account" class="btn btn-default" href="profileImgDown.jsp?file_name=<%=APM_account%>">확인 </a>
						<BUTTON type="button" onclick="editAccount();"
							class="btn btn-default">수정</button>
					</div>

					<div id="divAccountRegister_<%=APM_id%>"  style="display:none;">

						<input type='file' id="accountImg_<%=APM_id%>" name="accountImg_<%=APM_id%>"
								style="width:0px; height:0px"/>
						<button class="btn btn-default"
							onfocus="this.blur();" onclick="upload_A(this.form.accountImg_<%=APM_id%>,<%=APM_id%>);">등록</button>
						

					</div>
				</td>
											</tr>
											<%
												}
											%>
										</table>
</form>


									</div>
								</div>
							</div>





							<!-- susu! 여기여기!!!!!!!! -->
							<div id="divRM" class="ng-scope" style="display: none";>

								<div style="margin-top: 20px; margin-left: 20px;">
									<div id="flipRM">
											<h3 style="color:#428BCA; display: inline" >상세검색▼</h3>
										
									</div>
									<div id="flipContentRM" style="display: none;">
										<div>
											<FORM method="post" name="ARM_register" id="ARM_register">
												&nbsp;<LABEL>계산서발행일</LABEL> <INPUT type="text"
													name="ARM_bill_date" id="ARM_bill_date" size="5"
													style="border: 2px solid #000000;">&nbsp;&nbsp; <LABEL>파트너코드</LABEL>
												<INPUT type="text" name="ARM_partner_code"
													id="ARM_partner_code" size="12"
													style="border: 2px solid #000000;">&nbsp;&nbsp; <LABEL>고객사명</LABEL>
												<INPUT type="text" name="ARM_partner_name"
													id="ARM_partner_name" size="12"
													style="border: 2px solid #000000;">&nbsp;&nbsp; <LABEL>요금제</LABEL>
												<SELECT NAME="ARM_rate_system" id="ARM_rate_system"
													onchange="ARM_convert_fee(this.form)"
													style="border: 2px solid #000000;">
													<OPTION VALUE="0">선택</OPTION>
													<OPTION VALUE="1">Basic (50GB)</OPTION>
													<OPTION VALUE="2">Standard (100GB)</OPTION>
													<OPTION VALUE="3">Professional (300GB)</OPTION>
													<OPTION VALUE="4">Custom (300G이상)</OPTION>
												</SELECT>&nbsp;&nbsp; <LABEL>정산주기</LABEL> <SELECT
													NAME="ARM_contract_unit" id="ARM_contract_unit"
													style="border: 2px solid #000000;">
													<OPTION VALUE="1">3개월</OPTION>
													<OPTION VALUE="2">6개월</OPTION>
													<OPTION VALUE="3">1년</OPTION>
												</SELECT>&nbsp;&nbsp; <LABEL>요금</LABEL> <INPUT type="text"
													NAME="ARM_fee" id="ARM_fee" SIZE="10"
													style="border: 2px solid #000000;"> 원&nbsp;
												<BUTTON type="button" class="btn" id="ARM_register_btn"
													name="ARM_register_btn" onclick="ARM_register_check()"
													style="border: 2px solid #737373;">등록</button>
											</FORM>
											<textarea name=content cols="20" rows="2"
												id="ARM_bill_date_info"
												style="background-color: transparent; border: 0 solid black; font-size: 9pt; color: #737373; overflow: hidden;">해당건의 계산서 발행일   숫자8자리 ex)20180405</textarea>
											<SCRIPT type="text/javascript">
												spacing(58);
											</SCRIPT>
											<textarea name=content cols="45" rows="2"
												id="ARM_company_name_info"
												style="background-color: transparent; border: 0 solid black; font-size: 9pt; color: #737373; overflow: hidden;">정확한 고객사명을 입력해 주세요.
기존 고객사명과 다를 경우 새로 등록됩니다.</textarea>
											<SCRIPT type="text/javascript">
												spacing(25);
											</SCRIPT>

											<textarea name=content cols="40" rows="2"
												id="ARM_contract_unit_info"
												style="background-color: transparent; border: 0 solid black; font-size: 9pt; color: #737373; overflow: hidden;">매월청구 요금제:3개월
6개월/1년 계약은 동일하게 선택</textarea>
											<hr>

										</div>

										<!--  TABLE 상단 : 검색 AREA  -->
										<div>

											<!-- TODO :  수정 확인버튼 -->

											<FORM method="post" name="ARM_btn_event" id="ARM_btn_event"
												style="display: inline">
												<BUTTON type="button" class="btn" id="ARM_modify"
													name="ARM_modify" onclick="ARM_modify_btn_clicked() "
													style="border: 2px solid #737373;">수정</button>
												<BUTTON type="button" class="btn" id="ARM_ok" name="ARM_ok"
													onclick="ARM_ok_btn_clicked() "
													style="border: 2px solid #737373; display: none;">확인</button>
												<BUTTON type="button" class="btn" id="ARM_delete"
													name="ARM_delete" onclick="ARM_delete_btn_clicked() "
													style="border: 2px solid #737373;">삭제</button>
											</FORM>

											<SCRIPT type="text/javascript">
												spacing(20);
											</SCRIPT>

											<LABEL>기간 </LABEL>
											<SCRIPT type="text/javascript">
												spacing(1);
											</SCRIPT>
											<form method=post name="ARM_search_per	iod"
												id="ARM_search_period" style="display: inline">
												<INPUT type="text" name="start_year" id="start_year"
													value="" size="2" style="border: 2px solid #737373;">년&nbsp;&nbsp;
												<INPUT type="text" name="start_month" id="start_month"
													size="1" style="border: 2px solid #737373;">월 - <INPUT
													type="text" name="end_year" id="end_year" size="2"
													style="border: 2px solid #737373;">년&nbsp;&nbsp; <INPUT
													type="text" name="end_month" id="end_month" size="1"
													style="border: 2px solid #737373;">월


												<SCRIPT type="text/javascript">
													spacing(4);
												</SCRIPT>
												<LABEL>파트너코드</LABEL> <INPUT type="text" name="partner_code"
													id="partner_code" size="12"
													style="border: 2px solid #737373;">&nbsp;&nbsp; <LABEL>고객코드</LABEL>
												<INPUT type="text" name="customer_code" id="customer_code"
													size="12" style="border: 2px solid #737373;">&nbsp;&nbsp;
												<BUTTON type="button" class="btn" id="ARM_search_btn"
													onclick="searchBtn();" name="ARM_search_btn"
													style="border: 2px solid #737373;">검색</button>
											</form>
											<textarea name=content cols="15" rows="1" id="page_info"
												style="background-color: transparent; border: 0 solid black; font-size: 9pt; color: #737373; overflow: hidden;">1page 1/1</textarea>
										</div>
									</div>
									<hr>

									<!--  CUSTOMER INFORMATION TABLE -->
									<div id="divTable">
										<div style="margin: 5px">
											<h3 style="display: inline-block; margin-right: 10px;">내역</h3>

											<button
												style="display: inline-block; vertical-align: baseline;"
												class="btn" onclick="totalTable();">전체</button>

											<button id="currentMonth" class="btn" name="currentMonth"
												style="display: inline-block; vertical-align: baseline;"
												onclick="currentMonthFunction();">이번달</button>
											<button id="preMonth" name="preMonth" class="btn"
												style="display: inline-block; vertical-align: baseline;"
												onclick="preMonthFunction();">지난달</button>
										</div>
										<table class="table" id="ARM_table" style="width: 1200px;">
											<thead class="thead-light">
												<tr style="text-align: center;">
													<th scope="col" width="5px" nowrap
														style="text-align: center;"><input type="checkbox"
														name="ARM_index" id="ARM_index_main" value="0" /></th>
													<th scope="col" width="10px" nowrap
														style="text-align: center;">계산서발행일</th>
													<th scope="col" width="10px" nowrap
														style="text-align: center;">파트너사</th>
													<th scope="col" width="10px" nowrap
														style="text-align: center;">파트너명</th>
													<th scope="col" width="10px" style="text-align: center;">고객코드</th>
													<th scope="col" width="10px" style="text-align: center;">고객사명</th>
													<th scope="col" width="10px" style="text-align: center;">요금제</th>
													<th scope="col" width="10px" style="text-align: center;">정산주기</th>
													<th scope="col" width="10px" style="text-align: center;">요금</th>
													<th scope="col" width="10px" style="text-align: center;">마진</th>
													<th scope="col" width="10px" style="text-align: center;">미납금</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<%
														// 파트너테이블
														Statement stmtARM = conn.createStatement();

														//ARM db로딩
														String sqlARM = "select t1.c_billDate, t2.userCompany, t2.userName, t1.c_code, t1.c_name, t1.c_name, t1.c_plan, t1.c_calcul, t1.c_fee, t1.c_margin, t1.c_unpaid FROM customer t1, partner t2 where t1.userCode = t2.userCode order by c_billDate;";
														stmtARM.executeQuery(sqlARM);
														ResultSet rsARM = null;
														rsARM = stmtARM.executeQuery(sqlARM);
													%>

													<%
														while (rsARM.next()) {
															String id = rsARM.getString("id");															String billDate = rsARM.getString("c_billDate");
															String userCompany = rsARM.getString("userCompany");
															String userName = rsARM.getString("userName");
															String c_code = rsARM.getString("c_code");
															String c_name = rsARM.getString("c_name");
															String c_plan = rsARM.getString("c_plan");
															String c_calcul = rsARM.getString("c_calcul");
															String c_fee = rsARM.getString("c_fee");
															String c_margin = rsARM.getString("c_margin");
															String c_unpaid = rsARM.getString("c_unpaid");

															
															id = "rm" + id + "_";
															
				                                             long c_fee_long = Long.parseLong(c_fee);
				                                             long c_margin_long = Long.parseLong(c_margin);
				                                             long c_unpaid_long = Long.parseLong(c_unpaid);

				                                             c_fee = format.format(c_fee_long);
				                                             c_margin = format.format(c_margin_long);
				                                             c_unpaid = format.format(c_unpaid_long);
															
															
															
															
															//out.print("code "+c_code+"<br>");
													%>
													<th scope="row" width="2%"><input type="checkbox"
														class="ARM_checkSelect" id="<%=id%>" name="ARM_index"
														value=<%=id%> /></th>
													<td width="5%"><%=billDate%></td>
													<td width="8%"><%=userCompany%></td>
													<td width="8%"><%=userName%></td>
													<td width="7%"><INPUT type="text" name="rm<%=id%>0"
														id="<%=id%>0" size="15" value=<%=c_code%>
														readonly="readonly"
														style="border: 0 solid black; text-align: center;"></td>
													<td width="7%"><%=c_name%></td>
													<td width="7%"><%=c_plan%></td>
													<td width="8%"><%=c_calcul%></td>
													<td width="7%"><INPUT type="text" name="<%=id%>1"
														id="<%=id%>1" size="7" value=<%=c_fee%>
														readonly="readonly"
														style="border: 0 solid black; text-align: center;"></td>
													<td width="5%"><INPUT type="text" name="<%=id%>2"
														id="<%=id%>2" size="7" value=<%=c_margin%>
														readonly="readonly"
														style="border: 0 solid black; text-align: center;"></td>
													<td width="7%"><INPUT type="text" name="<%=id%>3"
														id="<%=id%>3" size="7" value=<%=c_unpaid%>
														readonly="readonly"
														style="border: 0 solid black; text-align: center;"></td>
												</tr>
												<%
													}
												%>

											</tbody>
											
											<tfoot>
												
												<%
															//실적관리 !!!!!!  

															//out.print("db 연결 정보 " + conn);

												Statement stmtARM2 = conn.createStatement();

												//ARM db로딩
												String sqlARM2 = "select IFNULL(sum(c_fee),0), IFNULL(sum(c_margin),0), IFNULL(sum(c_unpaid),0) from CUSTOMER";
												stmtARM2.executeQuery(sqlARM2);
												ResultSet rsRM2 = null;
												rsRM2 = stmtARM2.executeQuery(sqlARM2);
														%>
														<%
															while (rsRM2.next()) {
																//c_margin c_unpaid
																//String str = String.format("%,d", i); //%,d",
																String fee = rsRM2.getString("IFNULL(sum(c_fee),0)"); 
																String margin = rsRM2.getString("IFNULL(sum(c_margin),0)");
																String unpaid = rsRM2.getString("IFNULL(sum(c_unpaid),0)");
																
																
																long value = Long.parseLong(fee);
																fee = format.format(value);
																value = Long.parseLong(margin);
																margin = format.format(value);
																value = Long.parseLong(unpaid);
																unpaid = format.format(value);
																
																
														%>
												<tr>
												<td colspan="2" style="font-weight:bold; ">
													합계
													</td>
													<td  colspan="6" ></td>
													<td>
													<%=fee %>
													</td>
													<td>
													<%=margin %>
													</td>
													<td>
													<%=unpaid %>
													</td>
													<%} %>
												</tfoot>
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