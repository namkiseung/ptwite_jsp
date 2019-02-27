<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
	<title>회원 정보 수정</title>
	<link rel="stylesheet" type="text/css" href="signup.css">
</head>
<body style="background-color:#FFFFFF">
<%
 String id = request.getParameter("id");
 Class.forName("oracle.jdbc.driver.OracleDriver");
 Connection conn = null;
 Statement stmt = null;
 ResultSet rs = null;
 
 try{
  String JDBCINFO = "jdbc:oracle:thin:@192.168.177.135:1521:xe";
  String ORA_USER = "testuser";
  String USER_PASSWD = "1234";
  String SQL_QUERY ="SELECT * FROM member WHERE USERID='"+id+"'";
  
  conn = DriverManager.getConnection(JDBCINFO, ORA_USER, USER_PASSWD);
  stmt = conn.createStatement();
  rs = stmt.executeQuery(SQL_QUERY);  

  while(rs.next()){  
	String  edit_id = rs.getString("userid"); 
	String  edit_email = rs.getString("email"); 
	String  edit_name = rs.getString("name"); 
	String  edit_birth = rs.getString("birth"); 
	String  edit_addr = rs.getString("address");
	String  edit_date = rs.getString("JOINDATE"); 
  
 %>
 <center>
 <h1> 회원 정보 수정</h1>
 <table bgcolor = "#bbbbbb" cellspacing = "1" >
 <FORM name="signup_form" action="profile_edit_chk.jsp" method="post">
 <tr>
   <td text-align="center">가입날짜 </td>
   <td> 
   <label><%=edit_date%></label>
   </td>
  </tr>
  <tr>
   <td text-align="center">아이디 </td>
    <input type = "hidden" name="siup_id" value="<%=edit_id%>"/>
   <td> 
   <label><%=edit_id%></label>
   </td>
  </tr>
  <tr>
   <td> 기존 비밀번호 </td>
   <td> <input type = "password" name="siup_pw_old"/></td>
  </tr>
  <!--<tr>
   <td> 비밀번호 </td>
   <td> <input type = "password" name="siup_pw_new"/></td>
  </tr>
  <tr>-->
   <td> 성명 </td>
   <td> <input type = "text" name="siup_name"/ value="<%=edit_name%>"> </td>
  </tr>
  <tr>
   <td> 이메일 </td>
   <td>
    <input type = "text" name="siup_email" value="<%=edit_email%>"/> 
   </td>
  </tr>
	<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
  <tr>
   <td> 주소 </td>
   <td>
    <input type="text" name="siup_addr" value="<%=edit_addr%>" style="width:190px; height:20px;" readonly />
   </td>
  </tr>
  <tr>
   <td> 생년월일 </td>
   <td>
   <input type = "text" name="siup_birth" value="<%=edit_birth%>"/>
	&nbsp;*앞 6자리
   </td>
  </tr>
 
</table>
<%
}
 }catch(SQLException ex){
  ex.printStackTrace();
 }finally{
	//if (rs != null) try { rs.close();} catch(SQLException ex) {}
    //if (stmt != null) try { stmt.close();} catch(SQLException ex) {}
    //if (conn != null) try { conn.close(); } catch(SQLException ex) {}
 }
%>
<br/>
<input type="submit" value="수정완료"/>
<input type="reset" value="다시 입력"/>
</FORM>
<button onclick="location.href='main.jsp'">메인으로</button>
</center>
</body>
</html>