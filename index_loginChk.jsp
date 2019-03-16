<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/plain; charset=UTF-8">
</head>
<body>
 

<!-- loginchk은 입력된 정보를 DB와 연결해주는 창입니다. -->
<%
 //String id = request.getParameter("siin_id");
 //String tmp_pass =request.getParameter("siin_pw");

 //CEncrypt encrypt = new CEncrypt("SHA1", tmp_pass);
 //String pass = encrypt.getEncryptData();
 
 String user_id = request.getParameter("user_id");
 String user_pw = request.getParameter("user_pw")==null ? "1234" : request.getParameter("user_pw");

 if(user_id == "admin" || user_pw == "1234") {
   //out.print("success");
   response.sendRedirect("http://192.168.177.136:8080/pratice_jquery/index.jsp");
   
 }else{
   response.sendRedirect("http://192.168.177.136:8080");
 }
%>
</body>
</html>

