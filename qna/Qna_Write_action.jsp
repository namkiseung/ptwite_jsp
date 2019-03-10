<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@page import="java.io.File"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기 완료</title>
</head>
<%@ page import="java.security.*" %>

<body>
<%	 
    request.setCharacterEncoding("UTF-8");
	String pass="";
    String req_title=""; 
	String req_content="";
	String req_password="";
	String req_name = request.getParameter("name");	 	 
	String req_email = request.getParameter("email");	 	 
	    req_title = request.getParameter("title");	 	 
	    req_content = request.getParameter("content");	 	 
	    req_password = request.getParameter("password");
	  
	
     try{
	   
       String driver = "oracle.jdbc.driver.OracleDriver";  
       Class.forName(driver);
 
       String url = "jdbc:oracle:thin:@192.168.232.1:1521:xe";
       String id = "testuser";
       String pw = "1234";
 
       Connection conn = DriverManager.getConnection(url, id, pw);
       Statement st = conn.createStatement();   	 
		String sql = "INSERT INTO QNABOARD (idxQ, titleQ, writerQ, emailQ, contentQ, passQ, hitQ, attachQ, dateQ) values (SEQ.NEXTVAL, '"+req_title+"', '"+req_name+"', '"+req_email+"', '"+req_content+"', '"+req_password+"', 0, '"+"null"+"', to_char(sysdate, \'YYYY-MM-DD HH:MI:SS\'))";
	   // out.print(sql);
		st.executeUpdate(sql);  
		conn.close();
		st.close();
} catch (SQLException e){
	e.printStackTrace();
}	   
%>
		작업이 완료되었습니다. 목록으로 돌아갑니다!!
		<script>
		
		setTimeout(function(){ location.href='/qna/Qna_List.jsp'; }, 500);
		</script>
</body>
</html>