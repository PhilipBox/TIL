<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="util.DatabaseUtil"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@page import="java.util.Enumeration"%>
<%@ page import="java.text.*"%>
<%
	DecimalFormat format = new DecimalFormat("###,###");
%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- compiled CSS -->
<link rel="stylesheet" type="text/css"
	href="./assets/ng-cloudike-2.3.1-1.css">
<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="http://code.highcharts.com/highcharts.js"></script>
<script>
	// 자바 스크립트 시작

	function locateBack() {
		location.replace('boardList.jsp');
	}
	function writeCheck() {
		alert("writeCheck");
		var title = $("#title").val();
		var memo = $("#memo").val();

		if (!title) {
			alert("제목을 적어주세요.");
			$("#title").focus();
			return;
		}
		if (!memo) {
			alert("내용을 적어주세요.");
			$("#memo").focus();
			return;
		}

		writeOk();

	}
	function writeOk() {

		$.ajax({
			type : "post",
			url : "./boardWriteOk.jsp",
			data : {
				title : $("#title").val(),
				memo : $("#memo").val(),
			},
			success : moveSuccess,
			error : moveError
		});
	}
	function moveSuccess(resdata) {
		$("#divList").html(resdata);
		console.log(resdata);
		//alert("moveSuccess");
	}
	function moveError() {
		alert("moveError");
	}
</script>
</head>
<body>
	<div id="divList" class="b-content">
		<table>
			<tr>
				<td>
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr
							style="background: url('../img/table_mid.gif') repeat-x; text-align: center;">
							<td width="5"><img src="img/table_left.gif" width="5"
								height="30" /></td>
							<td style="font-size: 15; padding: 7"><b>글쓰기</b></td>
							<td width="5"><img src="img/table_right.gif" width="5"
								height="30" /></td>
						</tr>
					</table>
					<table>


						<tr height="5">
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center" height="20" style="font-size: 13;"><b>제목</b>
								<div style="margin-left: 100;"></div></td>
							<td><input id="title" size="90" maxlength="100"
								style="font-size: 13;"></td>
							<td>&nbsp;</td>
						</tr>

						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>

						<tr>
							<td>&nbsp;</td>
							<td align="center" height="20" style="font-size: 13;"><b>내용</b></td>
							<td><textarea style="resize: none; font-size: 15px;"
									id="memo" cols="80" rows="20"></textarea></td>

							<td>&nbsp;</td>
						</tr>

						<tr height="5">
						</tr>
						<tr height="1" bgcolor="#FED558">
							<td colspan="4"></td>
						</tr>
						<tr height="8">
						</tr>
						<tr align="center">
							<td>&nbsp;</td>
							<td colspan="2"><input type=button class="btn btn-default"
								value="등록" onclick="writeCheck();"> <input type=button
								value="취소" class="btn btn-default" onclick="locateBack();" />
							<td>&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>

