<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
	<title>vuln web</title>
	<link rel="stylesheet" type="text/css" href="../main.css">
</head>
<body> 
<div id="container">
	<div id="header">
		<span class="style1"><%@ include file="/sec03/login.jsp"%></span>
	</div>
		<%@ include file="/sec03/left.jsp"%>
							<!--<div id="sidebar">right area</div>-->
	<div id="content">

		TEST JSP 프로그래밍 !<br>
		<button onclick="location.href='http://192.168.56.1:8080/main.jsp'">default Main</button>
	 </div>
						<!--<div align="center" id="footer">footer area</div>-->
</div>
</body>
</html>