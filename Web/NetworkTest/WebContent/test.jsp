<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   <!DOCTYPE html>
   <html>
   <head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>테스트파일</title>
   </head>
   
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
   <script type="text/javascript">
   	
   		function testFunction(){
   			alert("함수가 실행되었습니다");
   		}
   		
   		
   	  $(document).ready(function(){
   	      $("#button").click(function(){
   	          alert("버튼은 눌렸음");
   	          callAjax();
   	      });
   	    });

   	    function callAjax(){

   	        $.ajax({
   		        type: "post",
   		        url : "./test2.jsp",
   		        data: {
   		        	number : $('#number').val(),
   	       			id : $('#id').val(),
   		        	comment : $('#comment').val()
   		        },
   		        success: whenSuccess,
   		        error: whenError
   	     	});
   	    }

   	    function whenSuccess(resdata){
   	        $("#ajaxReturn").html(resdata);
   	        console.log(resdata);
   	        alert("성공찡");
   	    }
   	    function whenError(){
   	        alert("Error");
   	    }
   </script>
   
   <body>
   		<h1>ASD KOREA</h1>
 <div style="width:500px;margin:auto;margin-top:200px;">
	 <form id="frm">
	 	 <div>
	     	<label>글번호</label><input name="number" id="number" >
	     </div>
	     <div style="margin-top:20px;">
	     	<label>아이디</label><input name="id" id="id">
	     </div>
	     <div style="margin-top:20px;">
	     	<label>코멘트</label><input name="comment" id="comment">
	     </div>
	     <div style="margin-top:20px;">
	     	<input id="button" type="button" value="버튼">
	     </div>
	 </form>
	 <div id="ajaxReturn">ajaxReturnOutput</div>
 </div>


   		<button onClick="testFunction()"> 버튼클릭하면 자바스크립트 실행됨.</button>
   </body>
   
   
   </html>
   