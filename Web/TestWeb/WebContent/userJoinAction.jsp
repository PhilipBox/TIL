<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userID=null;
	String userPassword=null;
	String userName=null;
	String userType=null;
	
	if(request.getParameter("userID")!=null){
		userID=(String)request.getParameter("userID");
	}
	if(request.getParameter("userPassword")!=null){
		userPassword=(String)request.getParameter("userPassword");
	}
	if(request.getParameter("userName")!=null){
		userName=(String)request.getParameter("userName");
	}
	if(request.getParameter("userType")!=null){
		userType=(String)request.getParameter("userType");
	}
	
	if(userID==null||userPassword==null||userName==null||userType==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	UserDAO userDAO = new UserDAO();
	int result = userDAO.join(new UserDTO(userID, userPassword,userName, userType));
	if(result==1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('회원가입에 성공했습니다.');");
		script.println("location.href='index.jsp';");
		script.println("</script>");
		script.close();
		return;
	}else{
		session.setAttribute("userID",userID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 존재하는 아이디입니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
%>