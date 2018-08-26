<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="util.DatabaseUtil"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@page import="java.util.Enumeration"%>
<%@ page import="java.text.*"%>
<%
   request.setCharacterEncoding("UTF-8");
   response.setCharacterEncoding("UTF-8");

   //admin 로그인 용
   //String code ="admin";
   //String name="admin";
   //String fromAdmin="PKC222";

   //String name = request.getParameter("name");
   String code = (String) session.getAttribute("userCodeDB");
   String name = (String) session.getAttribute("userNameDB");

   String title = request.getParameter("title");
   String memo = request.getParameter("memo");
   String email = (String) session.getAttribute("userEmailDB");
   int idx = Integer.parseInt(request.getParameter("idx"));

   try {
      int ref = 0;
      int indent = 0;
      int step = 0;
      String userCode="";
      Connection conn = DatabaseUtil.getConnection();
      Statement stmt = conn.createStatement();

      String sql = "SELECT ref, indent, step, userCode FROM board WHERE NUM=" + idx;
      ResultSet rs = stmt.executeQuery(sql);

      if (rs.next()) {
         ref = rs.getInt(1);
         indent = rs.getInt(2);
         step = rs.getInt(3);
         userCode=rs.getString(4);
      }
      //"UPDATE board SET step=step+1 where ref="+idx+" and step>" +step;
      sql = "UPDATE board SET step=step+1 where userCode=\"" + code + "\" and ref=" + ref + " and step>"
            + step;
      stmt.executeUpdate(sql);
      if (!code.equals("admin")) {
         sql = "INSERT INTO board(userName, title, memo, ref, indent, step, userCode, userEmail) "
               + "values(?,?,?,?,?,?,?,?)";
         PreparedStatement pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, name);
         pstmt.setString(2, title);
         pstmt.setString(3, memo);
         pstmt.setInt(4, ref);
         pstmt.setInt(5, indent + 1);
         pstmt.setInt(6, step + 1);
         //pstmt.setString(7, fromAdmin);
         pstmt.setString(7, code);
         pstmt.setString(8, email);

         pstmt.execute();
         rs.close();
         stmt.close();
         pstmt.close();
      } else {
         sql = "INSERT INTO board(userName, title, memo, ref, indent, step, userCode, fromAdmin, userEmail) "
               + "values(?,?,?,?,?,?,?,?,?)";
         
         PreparedStatement pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, name);
         pstmt.setString(2, title);
         pstmt.setString(3, memo);
         pstmt.setInt(4, ref);
         pstmt.setInt(5, indent + 1);
         pstmt.setInt(6, step + 1);
         pstmt.setString(7, code);
         pstmt.setString(8, userCode);
         pstmt.setString(9, email);
         pstmt.execute();
         rs.close();
         stmt.close();
         pstmt.close();

      }
      conn.close();

   } catch (Exception e) {

   }
%>
<script language=javascript>
   self.window.alert("입력한 글을 저장하였습니다.");
   location.href = "boardList.jsp";
</script>