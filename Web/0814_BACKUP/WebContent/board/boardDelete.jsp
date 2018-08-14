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

int idx = Integer.parseInt(request.getParameter("idx"));
//System.out.print("reply: idx  "+idx);

Connection conn = DatabaseUtil.getConnection();
Statement stmt = conn.createStatement();

int root=-1;
int ref=-1;

String sql = "SELECT ref, indent FROM board WHERE num=" + idx;
ResultSet rs = stmt.executeQuery(sql);

	if(rs.next()){
		ref = rs.getInt(1);
		root = rs.getInt(2);
		//System.out.println("ref : " + ref + "// indent : " + root);
	}

	//첫(root) 게시물이라면, 그 아래 모든 게시물 함께 삭제
	if(root==0) {
			try {	
				
				sql = "DELETE FROM board WHERE ref=?"; 
				PreparedStatement pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, ref);
				pstmt.execute();
				
				pstmt.close();
				conn.close();
			} catch(SQLException e) {
				out.println( e.toString() );
				}
	}//end if
	
	// root 게시물이 아닌 게시물들 (단일삭제)
	else {
			try {	
				
				sql = "DELETE FROM board WHERE num=?"; 
				PreparedStatement pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, idx);
				pstmt.execute();
				
				pstmt.close();
				conn.close();
			} catch(SQLException e) {
				out.println( e.toString() );
				}
	}// end else
%>
<script language=javascript>
	self.window.alert("게시물을 삭제하였습니다.");
	location.href="boardList.jsp"; 
</script>
