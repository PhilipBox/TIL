<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.File"%>
<%@ page import="java.util.*"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.io.FileInputStream"%>
<% request.setCharacterEncoding("utf-8"); %>

<% response.setContentType("text/html; charset=utf-8"); %>

<html>

<head>

<title>JSP Example</title>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
</head>

<body>
<h3>파일 다운로드</h3>
<%
String fileName = request.getParameter("file_name");

String savePath = "upload";
ServletContext context = getServletContext();

String sDownPath = context.getRealPath(savePath);

System.out.print("다운위치 : "+sDownPath);

String sFilePath=sDownPath+"\\"+fileName;
File oFile = new File(sFilePath);

byte [] by= new byte[5*1024*1024];
FileInputStream in = new FileInputStream(oFile);

String sMimeType = getServletContext().getMimeType(sFilePath);
System.out.print("type : "+ sMimeType);

if(sMimeType==null){
	sMimeType="application.octec-stream";
}

response.setContentType(sMimeType);

String a = new String(fileName.getBytes("euc-kr"), "8859_1");
String b = "utf-8";
String sEncoding = URLEncoder.encode(a,b);

String aa = "Content-Disposition";
String bb = "attachment; filename = "+sEncoding;
response.setHeader(aa,bb);

out.clear();
out=pageContext.pushBody();

ServletOutputStream out2 = response.getOutputStream();
int numRead = 0;

while ( (numRead = in.read(by,0,by.length))!=-1){
	out2.write(by,0,numRead);
}
out2.flush();
out2.close();
in.close();
%>
</body>

</html>