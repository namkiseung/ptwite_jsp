<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기 업데이트 완료</title>

</head>
<body>
<%	 
     request.setCharacterEncoding("UTF-8");
	 String check_action = request.getParameter("isAction");	

     try{
	   
       String driver = "oracle.jdbc.driver.OracleDriver";  
       Class.forName(driver);
 
       String url = "jdbc:oracle:thin:@192.168.177.135:1521:xe";
       String id = "testuser";
       String pw = "1234";
 
       Connection conn = DriverManager.getConnection(url, id, pw);
       Statement st = conn.createStatement();
	
		
		   String req_name = (String)session.getAttribute("name");
			String req_email = (String)session.getAttribute("email");
			String req_attach = request.getParameter("attach");	 	 
			String req_title = request.getParameter("title");	 	 
			String req_content = request.getParameter("content");	  
			String req_pw = request.getParameter("pw");	
			String req_num = request.getParameter("num");	 	 
			String req_day = request.getParameter("day");	 	 
		String sql="UPDATE QNABOARD SET attachQ='"+req_attach+"', titleQ='"+req_title+"', contentQ='"+req_content+"', dateQ=to_char(sysdate, \'YYYY-MM-DD HH:MI:SS\') where idxQ="+req_num;
	   
		st.executeUpdate(sql);  
		   
%>

		작업이 완료되었습니다. 목록으로 돌아갑니다!
		<!--<h3><%= req_name%></h3>
		<h3><%= req_email%></h3>
		<h3><%= req_attach%></h3>
		<h3><%= req_title%></h3>
		<h3><%= req_content%></h3>
		<h3><%= req_pw%></h3>
		<h3><%= req_num%></h3>
		<h3><%= req_day%></h3>-->
		<%
		conn.close();
		st.close();
} catch (SQLException e){}	
		%>
		<script>
		setTimeout(function(){ location.href='/qna/Qna_List.jsp'; }, 500);
		</script>
</body>
</html>