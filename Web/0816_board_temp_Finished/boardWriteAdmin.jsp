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

		var notice = 0;
		if ($("input:checkbox[id='noticeCheck']").is(":checked") == true) {
			writeNotice();
		} else {
			writeOk();
		}
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
	function writeNotice() {
		$.ajax({
			type : "post",
			url : "./boardWriteNoticeOk.jsp",
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

	<div id="divList">
		<table>

			<tr>
				<td>
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr
							style="background: url('img/table_mid.gif') repeat-x; text-align: center;">
							<td width="5"><img src="img/table_left.gif" width="5"
								height="30" /></td>
							<td>글쓰기</td>
							<td width="5"><img src="img/table_right.gif" width="5"
								height="30" /></td>
						</tr>
					</table>
					<table>
						<tr>
							<td>&nbsp;</td>
							<td align="center">제목</td>
							<td><input id="title" size="50" maxlength="100"></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>

						<tr>
							<td>&nbsp;</td>
							<td align="center">내용</td>
							<td><textarea id="memo" cols="50" rows="13"></textarea></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr height="1" bgcolor="#82B5DF">
							<td colspan="4"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center">공지사항</td>
							<td><input id="noticeCheck" type="checkbox"></td>
							<td>&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4"></td>
						</tr>
						<tr height="1" bgcolor="#82B5DF">
							<td colspan="4"></td>
						</tr>
						<tr>
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

