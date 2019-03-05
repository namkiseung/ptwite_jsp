<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
 
<!-- loginchk은 입력된 정보를 DB와 연결해주는 창입니다. -->
<%

 String id = request.getParameter("siin_id");
 String pass =request.getParameter("siin_pw");
 
 Class.forName("oracle.jdbc.driver.OracleDriver");
 Connection conn = null;
 Statement stmt =null;
 ResultSet rs = null;
 String view_date = null;
 try{
  String JDBCINFO = "jdbc:oracle:thin:@192.168.232.1:1521:xe";
  String ORA_USER = "testuser";
  String USER_PASSWD = "1234";
  String SQL_QUERY ="SELECT * FROM member WHERE USERID='"+id+"'";
  
  conn = DriverManager.getConnection(JDBCINFO, ORA_USER, USER_PASSWD);
  stmt = conn.createStatement();
  rs = stmt.executeQuery(SQL_QUERY);  
  
  Boolean isLogin=false;
  while(rs.next()){
	view_date = rs.getString("USERPW");
	if(view_date.equals(pass)){
	  session.setAttribute("id",id);
	  session.setAttribute("pw",pass);
	}
  }
  
 }catch(SQLException ex){
  response.sendRedirect("aiaain.jsp");
 }
 response.sendRedirect("/sec03/main.jsp");
 
%>
<!--response.sendRedirect("/sec03/main.jsp?q="+view_date+"&p="+pass);-->
</body>
</html>

