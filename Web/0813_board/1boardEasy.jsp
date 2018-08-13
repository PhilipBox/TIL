<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%

   /* suh session test  */
   request.setCharacterEncoding("UTF-8");

   String userCode = "PKC502";//PKC222 PKC201
   session.setAttribute("userCodeDB", userCode);
   
   response.sendRedirect("boardList.jsp");   
%>