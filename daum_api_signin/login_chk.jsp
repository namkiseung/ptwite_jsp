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
 String redirectUrl = "/daum_api_signin/main.jsp";
 Class.forName("oracle.jdbc.driver.OracleDriver");
 Connection conn = null;
 Statement stmt =null;
 ResultSet rs = null;
 
 try{
  String JDBCINFO = "jdbc:oracle:thin:@192.168.177.135:1521:xe";
  String ORA_USER = "testuser";
  String USER_PASSWD = "1234";
  String SQL_QUERY ="SELECT * FROM member WHERE USERID='"+id+"' and USERPW='"+pass+"'";
  
  conn = DriverManager.getConnection(JDBCINFO, ORA_USER, USER_PASSWD);
  stmt = conn.createStatement();
  rs = stmt.executeQuery(SQL_QUERY);  
  
  Boolean isLogin=false;
  while(rs.next()){  
	isLogin=true;
  }
  if (isLogin){
	  session.setAttribute("id",id);
	  session.setAttribute("pw",pass);
	  
  }else{
	  %> <script> alert("계정 정보를 확인하세요."); history.go(-1); </script> <%
  }
  
 }catch(SQLException ex){
  ex.printStackTrace();
 }finally{
	//if (rs != null) try { rs.close();} catch(SQLException ex) {}
    //if (stmt != null) try { stmt.close();} catch(SQLException ex) {}
    //if (conn != null) try { conn.close(); } catch(SQLException ex) {}
 }
 response.sendRedirect(redirectUrl);
%>
</body>
</html>

