<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>vuln web</title>
    <!--<link rel="stylesheet" type="text/css" href="../assets/css/style.css">-->
    <link rel="stylesheet" type="text/css" href="../main.css">
    <script src="http://code.jquery.com/jquery-1.12.0.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
    <style type="text/css">
        #navlist li {
            list-style:none;
            float:left;
            padding:5px;
        }
        #navlist {
            cursor:pointer;
        }
        #navlist .selected {
            background-color:greenyellow;
            color:white;
        }
    </style>
</head>
<body> 
    <%
        String html = request.getParameter("include") == null ? "" : "main.html";
        if(html == "page_event"){

        }else if(html == "page_selector"){

        }
    %>
<div id="container">
	<div id="header">
		<span class="style1"><%@ include file="../login.jsp"%></span>
	</div>
         <div id="leftnav">
            <ul id="navlist"> 
                <li><a href="http://192.168.177.136:8080">초기화</a></li> 
                <li><a href="http://192.168.177.136:8080/main.jsp">홈</a></li> 
                <li>선택자</li><!--<a href="http://192.168.177.136:8080/pratice_jquery/ot_selector.html">-->
                <li>이벤트</li><!--<a href="http://192.168.177.136:8080/pratice_jquery/ot_event.html">이벤트</a>-->
            </ul>
        </div>
    <div id="content"></div>
    <script>
            
            $('#navlist li').mouseover(function(){
              $(this).addClass('selected');              
            });
            
            $('#navlist li').mouseout(function(){
              $('#navlist li').removeClass('selected');
            });
            
            
            //if(){}
    </script>
						<!--<div align="center" id="footer">footer area</div>-->
</div>
</body>
</html>