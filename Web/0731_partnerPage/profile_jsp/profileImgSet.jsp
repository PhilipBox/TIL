<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.io.File"%> 
<%@page import="java.io.PrintWriter"%> 
<%@page import="java.util.Enumeration"%> 
<%@page import="com.oreilly.servlet.*"%> 
<%@page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %> 
<script>
alert("imgSet");
</script>
<%
     int maxPostSize =5* 1024 * 1024; // 5MB
     String saveDirectory = config.getServletContext().getRealPath("/upload"); //"D:\\WORK\Workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\CloudikePartner\\upload";
     MultipartRequest multi;
     try{

    	 multi= new MultipartRequest(request, saveDirectory, maxPostSize, "utf-8", new DefaultFileRenamePolicy()); 
     
     out.println("경로:"+saveDirectory +"<br>");
     Enumeration formNames=multi.getFileNames();  // 폼의 이름 반환

     String fileInput = "";
     String fileName = "";
     String type = "";
     File fileObj = null;
     String originFileName = "";    
     String fileExtend = "";
     String fileSize = "";
     int intSize=0;

     while(formNames.hasMoreElements()) {
          fileInput = (String)formNames.nextElement();                // 파일인풋 이름
          fileName = multi.getFilesystemName(fileInput);            // 파일명
          if (fileName != null) {
               type = multi.getContentType(fileInput);                   //콘텐트타입    
               fileObj = multi.getFile(fileInput);                             //파일객체
               originFileName = multi.getOriginalFileName(fileInput);           //초기 파일명
               fileExtend = fileName.substring(fileName.lastIndexOf(".")+1); //파일 확장자
               fileSize = String.valueOf(fileObj.length());                    // 파일크기
          
               out.println("파일 이름:"+fileName +"<br>");
               out.println("경로:"+type +"<br>");
               out.println("경로:"+fileExtend +"<br>");
               out.println("경로:"+fileSize +"<br>");
               
               if(!(fileExtend.equalsIgnoreCase("jpg") || fileExtend.equalsIgnoreCase("gif") || fileExtend.equalsIgnoreCase("png"))){
             	  new File(saveDirectory + "/" + fileName).delete();
            
             	  out.println("<SCRIPT>alert(\"이미지만 저장 가능합니다.\");</SCRIPT>");
             	  out.println("<SCRIPT>history.back();</SCRIPT>");
         			return;
               }
          
          }
     }
     }catch(Exception e){ 
     	
 }finally{
	 response.sendRedirect("partnerPage.jsp");
	 
 }
     
%>