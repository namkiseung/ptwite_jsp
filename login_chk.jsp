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
	Cookie [] cookieArray = request.getCookies(); // 브라우저에서 전달된 모든 쿠키 저장
	Cookie cookie = null;
	int countNum = 0;
	String countStr = "";
	if(cookieArray != null) { // 브라우저에서 전달된 쿠키정보가 있다면
	for(int i = 0; i < cookieArray.length; i++) { // 전달된 모든 쿠키를 검사하며,
		if(cookieArray[i].getName().equals("counter")) { // “counter”란 이름의 쿠키정보를 찾아
			cookie = cookieArray[i]; // 저장하고
			break; // for문을 빠져나간다.
		}
	}
	}

 String id = request.getParameter("siin_id");
 String pass =request.getParameter("siin_pw");
 String email = "";
 String name = "";
 
 String birth = "";
 String address = "";
 String joindate = "";
 String redirectUrl = "main.jsp";
 String fail_redirectUrl = "ologin.jsp";
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
	email = rs.getString("email");
	name = rs.getString("name");
	birth = rs.getString("birth");
	address = rs.getString("address");
	joindate = rs.getString("joindate");
  }
  if (isLogin){
	  //로그인 성공시 로그인 실패 쿠키 초기화
	  if(cookie != null) { // “counter”란 이름의 쿠키가 있으면
      countNum = Integer.parseInt(cookie.getValue()) + 1; // 값을 정수로 변환한 다음 1 증가한 후
      countStr = Integer.toString(countNum); // 다시 증가된 값을 문자열로 변환한 후
      cookie.setValue(countStr); // 'counter'란 이름의 쿠키값을 새롭게 설정한다.
      cookie.setMaxAge(0);
	  response.addCookie(cookie);
	  }
	  //로그인 성공시 세션 부여
	  session.setAttribute("id",id);
	  session.setAttribute("pw",pass);
	  session.setAttribute("email",email);
	  session.setAttribute("name",name);
	  session.setAttribute("birth",birth);
	  session.setAttribute("address",address);
	  session.setAttribute("joindate",joindate);
	  response.sendRedirect(redirectUrl);
  }else{
	  out.println("<script>");
	  out.println("location.href='ologin.jsp'");
	  out.println("</script>");
	  response.sendRedirect(fail_redirectUrl);
  }
  
 }catch(SQLException ex){
  ex.printStackTrace();
 }finally{
	//if (rs != null) try { rs.close();} catch(SQLException ex) {}
    //if (stmt != null) try { stmt.close();} catch(SQLException ex) {}
    //if (conn != null) try { conn.close(); } catch(SQLException ex) {}
 }
 
%>
</body>
</html>

