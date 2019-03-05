<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
	<%
request.setCharacterEncoding("UTF-8");   
	 String data_num = request.getParameter("del_content");	 
	 try{
	   
       String driver = "oracle.jdbc.driver.OracleDriver";  
       Class.forName(driver);
 
       String url = "jdbc:oracle:thin:@192.168.232.1:1521:xe";
       String id = "testuser";
       String pw = "1234";
 
       Connection conn = DriverManager.getConnection(url, id, pw);
       Statement st = conn.createStatement();
       String sql; 
	  
		   String req_name = request.getParameter("name");	 
			String req_email = request.getParameter("email");	 	 
			String req_attach = request.getParameter("attach");	 	 
			String req_title = request.getParameter("title");	 	 
			String req_content = request.getParameter("content");	 	 
			String req_password = request.getParameter("password");	 	 		 
		  sql = "delete noticeboard where idxB="+data_num+" or passB=''";
	   
		st.executeUpdate(sql);  
		conn.close();
		st.close();
} catch (SQLException e){}	 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 삭제완료</title>
</head>
<body>

	글이 삭제되었습니다.
	<script>
		setTimeout(function(){ location.href='/notice/Board_List.jsp'; }, 300);
		</script>
</body>
</html>