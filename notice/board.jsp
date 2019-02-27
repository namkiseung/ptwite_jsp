<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
	<title>vuln web</title>
	<link rel="stylesheet" type="text/css" href="../main.css">
</head>
<body> 
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
int total=0;
try {
 String JDBCINFO = "jdbc:oracle:thin:@192.168.232.1:1521:xe";
 String ORA_USER = "testuser";
 String USER_PASSWD = "1234";
 String SQL_QUERY ="select * from board";

 conn = DriverManager.getConnection(JDBCINFO, ORA_USER, USER_PASSWD);
 stmt = conn.createStatement();

 rs = stmt.executeQuery(SQL_QUERY);
 if ( rs.next() ) {
	 total=rs.getInt(1);
 }	 
 rs.close();
 //out.print("총 게시물:" + total + "개");
 String sqlList = "SELECT idx, userid, title, joindate from board order by idx desc";
 rs = stmt.executeQuery(sqlList);
%>  
<div id="container">
	<div id="header">
		<span class="style1"><%@ include file="../login.jsp"%></span>
	</div>
		<%@ include file="../left.jsp"%>
							<!--<div id="sidebar">right area</div>-->
	<div id="content">
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr height="5"><td width="5"></td></tr>
 <tr style="text-align:center;">
   <td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
   <td width="73">번호</td>
   <td width="379">제목</td>
   <td width="73">작성자</td>
   <td width="164">작성일</td>
   <td width="58">조회수</td>
   <td width="7"></td>
  </tr>
  <%
  if(total==0){
  %>
  <tr align="center" bgcolor="#FFFFFF" height="30">
	 	   <td colspan="6">등록된 글이 없습니다.</td>
	 	  </tr>
<%
	 	} else {
	 		
		while(rs.next()) {
			int idx = rs.getInt(1);
			String userid = rs.getString(2);
			String title = rs.getString(3);
			String join_date = rs.getString(4);
		
%>
<tr height="25" align="center">
	<td>&nbsp;</td>
	<td><%=idx %></td>
	<td align="left"><%=title %></td>
	<td align="center"><%=userid %></td>
	<td align="center"><%=join_date %></td>
	<td align="center">0</td>
	<td>&nbsp;</td>
</tr>
  <tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>
<%
		}
	} 
	rs.close();
	stmt.close();
	conn.close();
} catch(SQLException e) {
	out.println( e.toString() );
}
%>
 <tr height="1" bgcolor="#82B5DF"><td colspan="6" width="752"></td></tr>
 </table>
 <hr/>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr><td colspan="4" height="5"></td></tr>
  <tr align="center">
  <%
  if(session.getAttribute("id") != null){
  %>
   <td><input type=button value="글쓰기" onclick="location.href='notice/write.jsp'"></td>
  <%
  }
  %>
  </tr>
</table>
	 </div>
						<!--<div align="center" id="footer">footer area</div>-->
</div>
</body>
</html>