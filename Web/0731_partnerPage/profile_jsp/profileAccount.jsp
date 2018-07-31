<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="util.DatabaseUtil"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter"%>

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
<script>
   function nameCheck() {
      var userName = $("input[name='name']").val();
      if (userName.length > 0) {
         $("input[name='name']").css("border-color", "rgb(205,205,205)");
         return true;
      } else {
         $("input[name='name']").css("border-color", "red");
         return false;
      }
   }
   function passwordCheck(){
      var userPassword = $("input[name='password']").val();
      if (userPassword.length >= 6 && userPassword.length < 32) {
         $("input[name='password']").css("border-color", "rgb(205,205,205)");
         return true;
      }

      else {
         $("input[name='password']").css("border-color", "red");
         return false;
      }

   }
   function validation(){
      if (nameCheck() == true && passwordCheck() == true)
         $('#storeBtn').attr("disabled", false);
      else
         $('#storeBtn').attr("disabled", true);   
   }
</script>

<script
	src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/835808530/?random=1531139707988&amp;cv=9&amp;fst=1531139707988&amp;num=1&amp;label=Cloudike%20KR%20Remarketing&amp;guid=ON&amp;resp=GooglemKTybQhCsO&amp;u_h=864&amp;u_w=1536&amp;u_ah=824&amp;u_aw=1536&amp;u_cd=24&amp;u_his=2&amp;u_tz=540&amp;u_java=false&amp;u_nplug=3&amp;u_nmime=4&amp;gtm=G6c&amp;sendb=1&amp;frm=0&amp;url=https%3A%2F%2Fasd.cloudike.kr%2Foauth%3Fuse_ajax%3D1&amp;async=1&amp;rfmt=3&amp;fmt=4"></script>

<style type="text/css">
#PRM_table {
	text-align: center;
	font-size: 12px;
}
</style>

</head>

<body class="full-height body-gray body-scroll">
	<%
	Connection conn = DatabaseUtil.getConnection();
	out.print("db 연결 정보 " + conn);
	Statement stmt = conn.createStatement();
	String userCodeInit = (String) session.getAttribute("userCodeDB");

	out.print("userCode " + userCodeInit);

	//내정보 db로딩
	//TODO : where user가 이거일때 !!
	//String sql = "select * from PARTNER ";

	String company="";
	String name="";
	String type="";

	String sql = "select * from PARTNER where userCode=?";

	//stmt.executeQuery(sql);

	PreparedStatement pstmt = conn.prepareStatement(sql);

	pstmt.setString(1, userCodeInit);
	// pstmt.executeUpdate();
	ResultSet rs = null;
	rs = pstmt.executeQuery();
	
	rs.next();
	
	 company = rs.getString("userCompany");
	 name = rs.getString("userName");
	 type = rs.getString("userType");
		
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
										<%
											if (!type.equals("개인")) {
										%>
										<span class="cuser-name ng-binding"> <%=company%></span>
										<%
											} else {
										%>

										<span class="cuser-name ng-binding"> <%=name%></span>
										<%
											} 
										%>
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
								<!-- <li>
									<div id="notice_menu" class="btn-group" dropdown="">
										<a class="visible-xs mar-r-0-xs" disabled="disabled"> 
										 <span
											class="cuser-btn ng-scope" translate="">알림 없음</span> 
										</a> <a class="hidden-xs" href="" dropdown-toggle=""
											disabled="disabled"> <span class="cuser-btn ng-scope"
											translate="">알림 없음</span> 
											<span class="caret"></span>
										</a>

										<div
											class="dropdown-menu b-nav__navbar__eventlist ng-isolate-scope">
											<ul class="b-list__events">
												
											</ul>
										</div>
									</div>
								</li>-->

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
									</span> <span class="slide-item ng-binding">계정 관리</span>
								</span>
							</a> <!-- ngIf: folder.content.length -->
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

								<div class="ng-scope" id="divProfile">
									<div class="b-content b-content-plain form-horizontal">
										<div class="b-content__wrapper" style="width:700px; height:300px">
											<div class="b-content__header">
												<div class="b-content__header-title">
													<h2 class="text-muted p-uc ng-scope" translate="">계정</h2>
												</div>
											</div>

											<div class="form-group">
                                    <label class="col-md-2 control-label text-left" style="width:118px"><strong
                                       translate="" class="ng-scope" >비밀번호 변경</strong></label>
                                    <div class="col-md-4">
                                       <input type="password" name="password"
                                          onkeyup="validation();passwordCheck();"
                                          class="form-control ng-scope ng-pristine ng-valid ng-valid-maxlength ng-valid-minlength"
                                          placeholder="신규 비밀번호" popover="" style="width:500px"
                                          popover-trigger="value.invalid" popover-placement="bottom">
                                    </div>
                                 </div>
                                 <div class="form-group">
                                    <label class="col-md-2 control-label text-left" style="width:118px"><strong
                                       translate="" class="ng-scope">이름</strong></label>
                                    <div class="col-md-4">
                                       <input type="text" name="name"
                                          onkeyup="validation();nameCheck();" style="width:500px"
                                          class="form-control ng-scope ng-pristine ng-valid-maxlength ng-valid ng-valid-required"
                                          popover="" popover-trigger="value.invalid"
                                          popover-placement="bottom" required="required">
                                    </div>
                                 </div>
                                 
											<hr>
											<div class="form-group">
												<div class="col-md-offset-2 col-md-4">
													<button type="submit"  id="storeBtn"
														class="btn btn-primary btn-full ng-scope" translate=""
														disabled="disabled">저장</button>
												</div>
												<div class="col-md-offset-4 col-md-2 pad-r-30">
													<button type="button"
														class="btn btn-link pull-right ng-scope" translate="">계정
														삭제</button>
												</div>
											</div>

										</div>
										<!-- end ngIf: CONST.be.promocode.profile -->
									</div>

								</div>
								<!-- divRM end -->
								<!-- end ngIf: viewType == 'list' -->
								<!-- ngIf: viewType == 'grid' -->
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>


		<!-- compiled JavaScript -->
</body>
</html>