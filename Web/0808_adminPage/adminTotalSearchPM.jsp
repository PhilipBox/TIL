<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="util.DatabaseUtil"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<%
	response.setContentType("text/html; charset=utf-8");
%>


<html>

<head>

<title></title>

</head>

<script>

function readPagingPM(curPage, countList) {
	alert("adminPage !!"+curPage+" / "+countList);
	$.ajax({
		type : "post",
		url : "./adminReadPM.jsp",
		data : {
			curPageP : curPage,
			countList : countList

		},
		success : PMSuccess,
		error : PMError
	});
	
}
function PMSuccess(resdata){
	// alert("지금 성공");
     $("#divTableP").html(resdata);
     console.log(resdata);
 }
 function PMError(){
     alert("Error");
 }
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
   	    
</script>




<body>

	<%
		Connection conn = DatabaseUtil.getConnection();

	/*	
	PreparedStatement pstmt = null;

		String sql;

		

		
		sql = "select * from partner where userName=?";
		//"select t2.userCode, t1.c_billDate, t2.userCompany, t2.userName, t1.c_code, t1.c_name, t1.c_name, t1.c_plan, t1.c_calcul, t1.c_fee, t1.c_margin, t1.c_unpaid FROM customer as t1 join partner as t2 on t1.userCode = t2.userCode and (DATE(t1.c_billDate) between ? and ?) and t1.c_code=? order by c_billDate";

		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, name);

		ResultSet rsPM = null;
		rsPM = pstmt.executeQuery();
		*/
	%>
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
													String scurPage_partenr = request.getParameter("curPageP");
													
														int countList = 10;
														if (scurPage_partenr == null)
															scurPage_partenr = "1";
														int curPage = Integer.parseInt(scurPage_partenr);

														int curRow = (curPage - 1) * countList;
														// 파트너테이블
														// 파트너테이블
														PreparedStatement pstmt_susu = null;

														//실적관리 db로딩
														String sql_susu = "select IFNULL(count(*),0) FROM partner";
														pstmt_susu = conn.prepareStatement(sql_susu);
											
														ResultSet rsPM_susu = null;
														rsPM_susu = pstmt_susu.executeQuery();
														rsPM_susu.next();
														
													%>
													<%
													PreparedStatement pstmt = null;

													String sql = "select * from partner " + " LIMIT " + curRow + ", " + countList;//"select *  FROM partner;";
													pstmt = conn.prepareStatement(sql);

													

													ResultSet rsPM = null;
													rsPM = pstmt.executeQuery();
													
													%>

													<%
													
														int countPage = 5;
														int totalCount = rsPM_susu.getInt("IFNULL(count(*),0)");
														

														int totalPage = totalCount / countList;

														if (totalCount % countList > 0)
															totalPage++;
														if (totalPage < curPage) {

															curPage = totalPage;

														}

														int startPage = ((curPage - 1) / countPage) * countPage + 1;

														int endPage = startPage + countPage - 1;

														if (endPage > totalPage)
															endPage = totalPage;
														
													%>

													<%
														while (rsPM.next()) {
															String APM_id = rsPM.getString("userCode");

															if (APM_id.equals("admin"))
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


				
													<th scope="row" width="2%">
													<input type="checkbox"
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
															<a id="account" class="btn btn-default"
																href="profileImgDown.jsp?file_name=<%=APM_business%>">확인
															</a>
															<BUTTON type="button"
																onclick="editBusiness(<%=APM_id%>);"
																class="btn btn-default">수정</button>
														</div> <%
 	} else if (APM_business.equals("미등록")) {
 %>
														<div id="divBusinessRegister_<%=APM_id%>">

															<input type='file' id="businessImgDB_<%=APM_id%>"
																name="businessImgDB_<%=APM_id%>"
																style="width: 0px; height: 0px" />
															<button class="btn btn-default" onfocus="this.blur();" onclick="upload_BDB(this.form.businessImgDB_<%=APM_id%>,<%=APM_id%>);">등록</button>

														</div> <%
 	}
 %>

														<div id="divBusinessEdit_<%=APM_id%>"
															style="display: none">
															<a id="account" class="btn btn-default"
																href="profileImgDown.jsp?file_name=<%=APM_business%>">확인
															</a>

															<BUTTON type="button"
																onclick="editBusiness(<%=APM_id%>);"
																class="btn btn-default"
																style="border: 2px solid #737373;">수정</button>
														</div>
														<div id="divBusinessRegister_<%=APM_id%>"
															style="display: none;">

															<input type='file' id="businessImg_<%=APM_id%>"
																name="businessImg_<%=APM_id%>"
																style="width: 0px; height: 0px" />
															<button class="btn btn-default" onfocus="this.blur();"
																onclick="upload_B(this.form.businessImg_<%=APM_id%>,<%=APM_id%>);">등록</button>


														</div>
													</td>
													<td width="7%">
														<%
															if (!APM_account.equals("미등록")) {
														%>
														<div id="divAccountEdit_<%=APM_id%>">
															<a id="account" class="btn btn-default"
																href="profileImgDown.jsp?file_name=<%=APM_account%>">확인
															</a>
															<BUTTON type="button" onclick="editAccount(<%=APM_id%>);"
																class="btn btn-default">수정</button>
														</div> <%
 	} else if (APM_account.equals("미등록")) { // divAccountRegister accountImgDB accountOk accountImg
 %>
														<div id="divAccountRegister_<%=APM_id%>">

															<input type='file' id="accountImgDB_<%=APM_id%>"
																name="accountImgDB_<%=APM_id%>"
																style="width: 0px; height: 0px" />
															<button class="btn btn-default" onfocus="this.blur();"
																onclick="upload_ADB(this.form.accountImgDB_<%=APM_id%>,<%=APM_id%>);">등록</button>


														</div> <%
 	}
 %>
														<div id="divAccountEdit_<%=APM_id%>"
															style="display: none;">
															<a id="account" class="btn btn-default"
																href="profileImgDown.jsp?file_name=<%=APM_account%>">확인
															</a>
															<BUTTON type="button" onclick="editAccount();"
																class="btn btn-default">수정</button>
														</div>

														<div id="divAccountRegister_<%=APM_id%>"
															style="display: none;">

															<input type='file' id="accountImg_<%=APM_id%>"
																name="accountImg_<%=APM_id%>"
																style="width: 0px; height: 0px" />
															<button class="btn btn-default" onfocus="this.blur();"
																onclick="upload_A(this.form.accountImg_<%=APM_id%>,<%=APM_id%>);">등록</button>


														</div>
													</td>
												</tr>
												<%
													}
												%>
											</table>
											<div id="pagination" style=text-align:center>
												<%
												
													if (curPage > 1) {

														out.print("<button type='button' onclick='readPagingPM(" + 1 + ", " + countList
																+");' class='btn btn-default'> << 처음</button>");
														//		out.print("<a href=\"?scurPage_partenr=" + 1 + "\">처음</a>");
														//out.print("<a href=\"?curPage=" + (curPage - 1) + "\">< 이전</a>");
														out.print("<button type='button' onclick='readPagingPM(" + (curPage - 1) + ", " + countList
																+ ");' class='btn btn-default'>< 이전</button>");

													}
													for (int i = startPage; i < endPage + 1; i++) {
														//out.print("<a href=\"?scurPage_partenr=" + i + "\">"+i+"</a>");
														out.print("<button type='button' onclick='readPagingPM(" + i + ", " + countList
																+ ");' class='btn btn-default'>" + i + "</button>");
													}
													if (curPage < totalPage) {
														//out.print("<a href=\"?scurPage_partenr=" + (curPage + 1) + "\">다음 ></a>");
														out.print("<button type='button' onclick='readPagingPM(" + (curPage + 1) + ", " + countList
																+ ");' class='btn btn-default'> > 다음</button>");

													}
													if (endPage < totalPage)
														//out.print("<a href=\"?scurPage_partenr=" + totalPage + "\">끝</a>");
														out.print("<button type='button' onclick='readPagingPM(" + totalPage + ", " + countList
																+ ");' class='btn btn-default'> >> 끝</button>");
														
												%>
											</div>
										</form>

									</div>

</body>
</html>