<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--메뉴영역-->
	<div id="leftnav">
		<ul id="navlist"> 
		<li><a href="http://192.168.56.1:8080/main.jsp">홈</a></li>
		<li><a href="http://192.168.56.1:8080/best_content/Best_List.jsp">베스트글</a></li>
		<li><a href="http://192.168.56.1:8080/notice/Board_List.jsp">게시판</a></li>
		<li><a href="http://192.168.56.1:8080/qna/Qna_List.jsp">Q&A</a></li>
		<li><a href="http://192.168.56.1:8080/basic_xssgame/main.jsp">xss-game실습</a></li>
		<li><a href="http://192.168.56.1:8080/basic_csrf/main.jsp">csrf실습</a></li>
		<%
		 if(session.getAttribute("id") == null) {
		%>
		<li><a href="http://192.168.56.1:8080/my_boardList.jsp">내가 쓴 글</a></li>
		<%
		 }
		%>
		</ul>
	</div>