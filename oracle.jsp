<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Oracle Test Table</title>
</head>
<body>
<h1> Oracle Test_Table </h1>
<table border="1">
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
try {
 String JDBCINFO = "jdbc:oracle:thin:@192.168.177.135:1521:xe";
 String ORA_USER = "testuser";
 String USER_PASSWD = "1234";
 String SQL_QUERY ="select name from test";

 conn = DriverManager.getConnection(JDBCINFO, ORA_USER, USER_PASSWD);
 stmt = conn.createStatement();

 rs = stmt.executeQuery(SQL_QUERY);
 while ( rs.next() ) { 
%>  
  <tr><td><%= rs.getString("name") %> </td></tr>
<%
 }

}catch(SQLException ex) {
%>
 Error : <%= ex.getMessage() %>
<%
}finally {
 if (rs != null) try { rs.close();} catch(SQLException ex) {}
 if (stmt != null) try { stmt.close();} catch(SQLException ex) {}
 if (conn != null) try { conn.close(); } catch(SQLException ex) {}
}
%>
</table>
</body>
</html>
