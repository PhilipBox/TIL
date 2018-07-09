<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import='java.io.PrintWriter'%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport"
   content="width=device-width,initial-scale=1,shrink-to-fit=no">
<title>ASD TEST WEB</title>
<!-- 부트스트랩 CSS 추가하기 -->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<!-- 커스텀 CSS 추가하기 -->
<link rel="stylesheet" href="./css/custom.css">
</head>

<!-- Jquery ; Ajax -->

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
   		        url : "./userJoinAction.jsp",
   		        data: {
   		        	userID : $('#userID').val(),
   	       			userPassword : $('#userPassword').val(),
   		        	userName : $('#userName').val(),
   		        	userType : $('#userType').val()
   		        },
   		        success: whenSuccess,
   		        error: whenError
   	     	});
   	    }

   	    function whenSuccess(resdata){
   	        $("#ajaxReturn").html(resdata);
   	        console.log(resdata);
   	        alert("데이터가 성공적으로 전달되었습니다.");
   	    }
   	    function whenError(){
   	        alert("Error !");
   	    }
   </script>

<!-- Jquery ; Ajax  End-->

<body>
   <%
      String userID = null;
      if (session.getAttribute("userID") != null) {
         userID = (String) session.getAttribute("userID");
      }
      if (userID != null) {
         PrintWriter script = response.getWriter();
         script.println("<script>");
         script.println("alert('로그인이 된 상태입니다.');");
         script.println("location.href = 'index.jsp';");
         script.println("</script>");
         script.close();
         return;

      }
   %>
   <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <a class="navbar-brand" href="index.jsp">ASD testWeb</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse"
         data-target="#navbar">
         <span class="navbar-toggler-icon"></span>
      </button>
      <div id="navbar" class="collapse navbar-collapse">
         <ul class="navbar-nav mr-auto">
            <li class="nav-item active"><a class="nav-link"
               href="index.jsp">메인</a></li>
            <li class="nav-item dropdown"><a
               class="nav-link dropdown-toggle" id="dropdown"
               data-toggle="dropdown">회원관리</a>
               <div class="dropdown-menu" aria-labelledby="dropdown">
                  <%
                     if (userID == null) {
                  %>
                  <a class="dropdown-item" href="userLogin.jsp">로그인</a> <a
                     class="dropdown-item" href="userJoin.jsp">회원가입</a>
                  <%
                     } else {
                  %>
                  <a class="dropdown-item" href="userLogout.jsp">로그아웃</a>
                  <%
                     }
                  %>
               </div></li>
         </ul>
      </div>
   </nav>
   <section class="container mt-3" style="max-width: 560px;">
      <form method="post" action="./userJoinAction.jsp">
         <div class="form-group">
            <label>아이디</label> <input type="text" name="userID" class="form-control" id = "userID">
         </div>
         <div class="form-group">
            <label>비밀번호</label> <input type="password" name="userPassword" class="form-control" id="userPassword">
         </div>
         <div class="form-group">
            <label>이름</label> <input type="text" name="userName" class="form-control" id="userName">
         </div>
         <div class="form-group">
            <label>사업자 유형</label> 
            <!-- <input type="text" name="userType"
               class="form-control"> -->
               <div class="form-group" style="text-align: left;">
                        <div class="btn-group" data-toggle="buttons" id="userType">
                           <label class="btn btn-primary active">
                           		<input type="radio" name="userType" autocomplete="off" value="개인" checked> 개인
                           </label> 
                           <label class="btn btn-primary active">
                           		<input type="radio" name="userType" autocomplete="off" value="기업">기업
                           </label>
                        </div>
                     </div>
         </div>

         <button type="submit" class="btn btn-primary form-control">회원가입</button>
      </form>
   </section>
   <!-- 제이쿼리 자바스크립트 추가하기 -->
   <script src="./js/jquery.min.js"></script>
   <!-- 파퍼 자바스크립트 추가하기 -->
   <script src="./js/popper.js"></script>
   <!-- 부트스트립 자바스크립트 추가하기 -->
   <script src="./js/bootstrap.min.js"></script>
</body>
</html>