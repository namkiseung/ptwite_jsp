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
 
 String redirectUrl = "/sec02/main.jsp";
 Boolean isLogin=false;
 
 
 try{
  ResultSet rs = null;
  PreparedStatement pstmt = null;
  String JDBCINFO = "jdbc:oracle:thin:@192.168.177.135:1521:xe";
  String ORA_USER = "testuser";
  String USER_PASSWD = "1234";
  
  conn = DriverManager.getConnection(JDBCINFO, ORA_USER, USER_PASSWD);  
  
  pstmt = conn.prepareStatement("SELECT * FROM member WHERE USERID=? and USERPW =?");
  pstmt.setString(1, id);
  pstmt.setString(2, pass);
  rs = pstmt.executeQuery();  
  
  
  while(rs.next()){  
	isLogin=true;
  }
  if (isLogin){
	  session.setAttribute("id", id);
	  session.setAttribute("pw", pass);
	  
  }else{
	  %> <script> alert("계정 정보를 확인하세요."); history.go(-1); </script> <%
  }
  
 }catch(SQLException ex){
  ex.printStackTrace();
 }
 response.sendRedirect(redirectUrl);
%>
</body>
</html>

