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

	// 파트너테이블
	Statement stmtPM = conn.createStatement();

	//실적관리 db로딩
	String sqlPM = "select * from partner";
	stmtPM.executeQuery(sqlPM);
	ResultSet rsPM = null;
	rsPM = stmtPM.executeQuery(sqlPM);
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
													style="border: 0 solid black; text-align: center;"></td>
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

</body>
</html>