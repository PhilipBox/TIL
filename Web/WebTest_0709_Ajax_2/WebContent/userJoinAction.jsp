<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.*"%>

<%
	request.setCharacterEncoding("UTF-8");



	String userID = request.getParameter("userID");
	String userPassword = request.getParameter("userPassword");
	String userName = request.getParameter("userName");
	String userType = request.getParameter("userType");
	
	HashMap<String,String> map = new HashMap<String,String>();
		map.put("userID",userID);
		map.put("userPassword",userPassword);
		map.put("userName",userPassword);
		map.put("userType", userType);

		



		

		/* 
	String userID=null;
	if (session.getAttribute("userID")!= null)
		userID = (String) session.getAttribute("userID");
	
	if (userID != null){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그인이 된 상태입니다.');");
	script.println("location.href = 'index.jsp';");
	script.println("</script>");
	script.close();
	return;
	}
	
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
	*/
%>

<body>
	유저계정:<%=map.get("userID")%><br>
	비밀번호:<%=map.get("userPassword")%><br>
	유저이름:<%=map.get("userName")%><br>
	유저타입:<%=map.get("userType")%><br>
		

</body>