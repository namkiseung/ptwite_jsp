<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
	<title>vuln web</title>
	<link rel="stylesheet" type="text/css" href="main.css">
</head>
<body>
 <%
	
        // main content에 삽입할 jsp파일을 명을 구하자
        String category = request.getParameter("category"); //아이디
%>		
<div id="container">
	<div id="header">
		<span class="style1"><%@ include file="login.jsp"%></span>
	</div>
		<%@ include file="left.jsp"%>
							<!--<div id="sidebar">right area</div>-->
	<div id="content">
	<%
	   if(category=="home"){
	%>
		<h1>TEST JSP 프로그래밍</h1>
	<%
	   }else if(category=="board"){
	%>
		<%@ include file="board.jsp"%>
	<%
	   }else{
	%>
		<%@ include file="index.jsp"%>
	<%
	   }
	%>
	 </div>
						<!--<div align="center" id="footer">footer area</div>-->
</div>
</body>
</html>