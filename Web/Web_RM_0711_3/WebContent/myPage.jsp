<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ page import="util.DatabaseUtil"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setCharacterEncoding("UTF-8"); %>

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
   function RMfunction() {
      alert("RM눌렀음!!!!!!!!");
      $("#divProfile").css("display", "none");
      $("#divRM").css("display", "block");
   }
   function profileFunction() {
      alert("내정보 눌렀음!!!!!!!!");
      $("#divRM").css("display", "none");
      $("#divProfile").css("display", "block");

   }
   function profile_edit_click() {
      $("input[name='profile']").attr("readonly", false);
   }

   // 계산서 발행일, 이름, 전화번호의 확인/등록 버튼
   /*
   function name_ok_click(){
      alert("이름; 수정되었습니다!");
      $("input[name='profile']").attr("readonly",true);
      //$('#profile_name').prop('readonly', false);
      //location.replace('profileSetting.jsp');
      updateName();

   }
    */
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
   function test_click() {
      alert("버튼1을 누르셨습니다.");
      location.replace('profileSetting.jsp');
   }
   $(document).ready(function() {
      $("#btn_name_ok").click(function() {
         alert("이름 확인 버튼은 눌렸음");
         updateName();
      });
   });
   function updateName() {

      $.ajax({
         type : "post",
         url : "./test.jsp",
         data : {
            userPhone : $('#userPhone').val(),
            userName : $('#userName').val()
         },
         success : ajaxSuccess,
         error : ajaxError
      });
   }
   function ajaxSuccess(resdata) {
      $("#ajaxReturn").html(resdata);

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

</script>

<script
   src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/835808530/?random=1531139707988&amp;cv=9&amp;fst=1531139707988&amp;num=1&amp;label=Cloudike%20KR%20Remarketing&amp;guid=ON&amp;resp=GooglemKTybQhCsO&amp;u_h=864&amp;u_w=1536&amp;u_ah=824&amp;u_aw=1536&amp;u_cd=24&amp;u_his=2&amp;u_tz=540&amp;u_java=false&amp;u_nplug=3&amp;u_nmime=4&amp;gtm=G6c&amp;sendb=1&amp;frm=0&amp;url=https%3A%2F%2Fasd.cloudike.kr%2Foauth%3Fuse_ajax%3D1&amp;async=1&amp;rfmt=3&amp;fmt=4"></script>
</head>

<body class="full-height body-gray body-scroll">
   <%
      Connection conn = DatabaseUtil.getConnection();
      out.print("db 연결 정보 " + conn);

      Statement stmt = conn.createStatement();
      //TODO : where user가 이거일때 !!
      String sql = "select * from TESTPROFILE";
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
                  <li class="active collapse-in">
                                        <a class="b-menu__item-link">
      <span ng-click="clickItemMenu($event, folder)">
        <span class="b-menu__item-link-toolbar">
          <span class="b-menu__item-icon b-menu__item-icon-chevron-right"><i class="fa fa-caret-right"></i></span>
          <span class="b-menu__item-icon b-menu__item-icon-chevron-down"><i class="fa fa-caret-down"></i></span>
        </span>
        <span class="slide-item ng-binding" >myPage 관리</span>
      </span>
    </a>
                                        <!-- ngIf: folder.content.length -->
                                        <div class="collapse ng-scope">
                                            <!-- ngRepeat: folder in folder.content | naturalOrderBy:'path' -->
                                            <!-- ngInclude: 'clFolderAsTree/clFolderAsTree.tpl.html' -->
                                            <div class="ng-scope">
                                                <!-- ngIf: folder.folder -->
                                            </div>
                                            <!-- end ngRepeat: folder in folder.content | naturalOrderBy:'path' -->
                                        </div>
                                        <!-- end ngIf: folder.content.length -->
                                    </li>
<!-- 여기까지 -->

            <li class="single-item ng-scope"><a class="b-menu__item-link"
               onclick="profileFunction();"><span><span
                     translate="" class="ng-scope">내 정보 관리</span></span></a></li>
            <li class="single-item ng-scope"><a class="b-menu__item-link"
               onclick="RMfunction();"><span><span
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

                  <!-- susu ! 테이블 자리!!!!!! 여기 잘림 !!!!!!! -->

                  <div class="ng-scope" id="divProfile" >
                     <table class="type04" id="myPageTable1">
                        <tr>
                           <%
                              while (rs.next()) {
                                 String code = rs.getString("userCode");
                                 String company = rs.getString("userCompany");
                                 String name = rs.getString("userName");
                                 String phone = rs.getString("userPhone");
                           %>

                           <th scope="row">파트너 코드</th>
                           <td colspan="2"><p id="userCode"><%=code%></p></td>
                        </tr>
                        <tr>
                           <th scope="row">회사명</th>
                           <td colspan="2"><%=company%></td>
                        </tr>

                        <tr>
                           <th scope="row">이름</th>
                           <td><input id="userName" name="profile" value="<%=name%>"
                              readonly></td>
                           <td><button class="btn btn-default"
                                 onclick="profile_edit_click();">수정</button> <input
                              type="button" class="btn btn-default" id="btn_name_ok"
                              value="확인"></td>
                        </tr>

                        <tr>
                           <th scope="row">전화번호</th>
                           <td><input id="userPhone" name="profile"
                              value="<%=phone%>" readonly></td>
                           <td><button class="btn btn-default"
                                 onclick="profile_edit_click();">수정</button>
                              <button class="btn btn-default" onclick="phone_ok_click();">확인</button></td>
                        </tr>
                        <tr>
                           <th scope="row">이메일</th>
                           <td colspan="2">usuhwa2@gmail.com</td>
                        </tr>
                     </table>

                     <table class="type04" id="myPageTable2">
                        <tr>
                           <th scope="row">통장사본</th>
                           <td>미등록</td>
                           <td><button class="btn btn-default"
                                 onclick="account_ok_click();">등록</button></td>
                        </tr>
                        <tr>
                           <th scope="row">ASD계약일</th>
                           <td colspan="2">(개인)</td>
                        </tr>
                        <tr>
                           <th scope="row">정산주기</th>
                           <td colspan="2">미등록</td>
                        </tr>
                        <tr>
                           <th scope="row">계산서 발행일</th>
                           <td><input style="text-align: center; width: 25px;"
                              type="text" name="partnerCode" value=" ">일/3개월</td>
                           <td><button class="btn btn-default"
                                 onclick="calcul_ok_click();">등록</button></td>
                        </tr>
                        <tr>
                           <th scope="row">입금일</th>
                           <td colspan="2">미등록</td>
                        </tr>
                        <tr>
                           <th scope="row">비고</th>
                           <td colspan="2">미등록
                        </tr>
                        <%
                           }
                        %>
                     </table>
                  </div>

                  <!-- susu! 여기여기!!!!!!!! -->
                  <div id="divRM" class="ng-scope" style="display: none">
                     <div>
                        <FORM method="post" name="register" id="register"
                           onsubmit="return register_check();">

                           &nbsp;<LABEL>계산서발행일</LABEL> <INPUT type="text" name="bill_date"
                              id="bill_date" size="5" style="border: 2px solid #000000;">&nbsp;&nbsp;
                           <LABEL>고객사명</LABEL> <INPUT type="text" name="company_name"
                              id="company_name" size="12" style="border: 2px solid #000000;">&nbsp;&nbsp;


                           <LABEL>요금제</LABEL> <SELECT NAME="rate_system" id="rate_system"
                              onchange="convert_fee(this.form)"
                              style="border: 2px solid #000000;">
                              <OPTION VALUE="0">선택</OPTION>
                              <OPTION VALUE="1">Basic (50GB)</OPTION>
                              <OPTION VALUE="2">Standard (100GB)</OPTION>
                              <OPTION VALUE="3">Professional (300GB)</OPTION>
                              <OPTION VALUE="4">Custom (300G이상)</OPTION>
                           </SELECT>&nbsp;&nbsp; <LABEL>계약단위(정산주기)</LABEL> <SELECT
                              NAME="contract_unit" id="contract_unit"
                              style="border: 2px solid #000000;">
                              <OPTION VALUE="1">3개월</OPTION>
                              <OPTION VALUE="2">6개월</OPTION>
                              <OPTION VALUE="3">1년</OPTION>
                           </SELECT>&nbsp;&nbsp; <LABEL>요금</LABEL> <INPUT type="text" NAME="fee"
                              id="fee" SIZE="10" style="border: 2px solid #000000;">
                           원&nbsp;
                           <BUTTON type="submit" class="btn"
                              style="border: 2px solid #737373;">등록</button>
                        </FORM>
                        &nbsp;&nbsp;
                        <textarea name=content cols="30" rows="3" id="bill_date_info"
                           style="background-color: transparent; border: 0 solid black; font-size: 9pt; color: #737373; overflow: hidden;">해당건의 첫 계산서 발행일숫자8자리 ex)20180405</textarea>
                        <SCRIPT type="text/javascript">
                           spacing(6);
                        </SCRIPT>
                        <textarea name=content cols="45" rows="3" id="bill_date_info"
                           style="background-color: transparent; border: 0 solid black; font-size: 9pt; color: #737373; overflow: hidden;">정확한 고객사명을 입력해 주세요.
기존 고객사명과 다를 경우 새로 등록됩니다.</textarea>
                        <SCRIPT type="text/javascript">
                           spacing(46);
                        </SCRIPT>

                        <textarea name=content cols="40" rows="3" id="bill_date_info"
                           style="background-color: transparent; border: 0 solid black; font-size: 9pt; color: #737373; overflow: hidden;">매월청구 요금제:3개월
6개월/1년 계약은 동일하게 선택</textarea>
                        <hr>

                     </div>

                     <!--  TABLE 상단 : 검색 AREA  -->
                     <div>
                        &nbsp;&nbsp;
                        <BUTTON type="button" class="btn"
                           style="border: 2px solid #737373;">수정</button>
                        &nbsp;&nbsp;
                        <BUTTON type="button" class="btn"
                           style="border: 2px solid #737373;">삭제</button>
                        <SCRIPT type="text/javascript">
                           spacing(20);
                        </SCRIPT>

                        <LABEL>기간 </LABEL>
                        <SCRIPT type="text/javascript">
                           spacing(4);
                        </SCRIPT>
                        <form method=post style="display: inline">
                           <INPUT type="text" name="start_year" id="start_year" size="2"
                              style="border: 2px solid #737373;">년&nbsp;&nbsp; <INPUT
                              type="text" name="start_month" id="start_month" size="1"
                              style="border: 2px solid #737373;">월 - <INPUT
                              type="text" name="end_year" id="end_year" size="2"
                              style="border: 2px solid #737373;">년&nbsp;&nbsp; <INPUT
                              type="text" name="end_month" id="end_month" size="1"
                              style="border: 2px solid #737373;">월

                           <BUTTON type="submit" class="btn"
                              style="border: 2px solid #737373;">검색</button>
                        </form>
                        <SCRIPT type="text/javascript">
                           spacing(4);
                        </SCRIPT>
                        <form method="post" style="display: inline">
                           <LABEL>고객사코드</LABEL> <INPUT type="text" name="campany_code"
                              id="campany_code" size="12" style="border: 2px solid #737373;">&nbsp;&nbsp;
                           <BUTTON type="submit" class="btn"
                              style="border: 2px solid #737373;">검색</button>
                        </form>
                        <textarea name=content cols="15" rows="1" id="page_info"
                           style="background-color: transparent; border: 0 solid black; font-size: 9pt; color: #737373; overflow: hidden;">1page 1/1</textarea>
                     </div>
                     <hr>

                     <!--  CUSTOMER INFORMATION TABLE -->
                     <div>

                        <table class="table" style="width: 1000px">
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
                        <li>계산서발행일 : <%=request.getParameter("bill_date")%></li>
                        <li>고객사명 : <%=request.getParameter("company_name")%></li>
                        <li>요금제 : <%=request.getParameter("rate_system")%></li>
                        <li>계약단위 : <%=request.getParameter("contract_unit")%></li>
                        <li>요금 : <%=request.getParameter("fee")%></li>
                     </ul>
                     <h4>전달받은 데이터2</h4>
                     <ul>
                        <li>시작날짜 : <%=request.getParameter("start_year")%>년 <%=request.getParameter("start_month")%>
                           월
                        </li>
                        <li>종료날짜 : <%=request.getParameter("end_year")%>년 <%=request.getParameter("end_month")%>
                           월
                        </li>
                     </ul>
                     <h4>전달받은 데이터3</h4>
                     <ul>
                        <li>고객사코드 : <%=request.getParameter("campany_code")%></li>
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
      src="/assets/app-config.js?1530520134094"></script>
   <script type="text/javascript"
      src="/assets/ng-cloudike-2.3.1-1.js?1530520134094"></script>


</body>
</html>