<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<%
int check=0;
        // 현재 로그인된 아이디가 없다면 (= session에 저장된 id가 없다면)
        if(session.getAttribute("id") == null) {
            %>
			
		<form name="loginform" action="/sec02/login_chk.jsp" method="post">
			<center>
				<table style="margin-top:20px;">
					<tr>
						<td>아이디 : </td><td><input type="text" name="siin_id" placeholder="username"></td>
						<td>비밀번호 : </td><td><input type="password" name="siin_pw">&nbsp;&nbsp;</td>
						<td>
						<input type="submit" value="로그인" class="hover"> &nbsp;<!-- 위의 form과 연동되어 loginProcess로 이동한다. -->
						<button><a href ="/sec01/agree.jsp" class="hover">회원가입</a></button>  <!-- 회원가입을 누르면 a태그를 통해서 joinForm으로 이동한다. -->
						</td>
					</tr>
				</table>
			</center>
		</form>
			<span style="margin-left:70%; font-size:10pt">Forgot your 
			<a href="ologin.html">userid</a> or <a href="/sec01/findpw.jsp">password</a></span>
            <%
        } 
        // 현재 로그인된 아이디가 있다면 (= session에 저장된 id가 있다면)
        else {
            %>
			
		<table style="margin-top:20px;" >	
		<form name="logoutform" action="/sec02/logout.jsp" method="post">
			<tr>
				<td><%=session.getAttribute("id")%> 님</td>
				<td>
				<input type="submit" value="로그아웃"> &nbsp;<!-- 위의 form과 연동되어 loginProcess로 이동한다. -->
				</td>
			</tr>
		</form>
		</table>
		<table style="margin-top:-54.5px;margin-left:160px;" >	
		<form action="/sec01/user_edit.jsp" method="post" >
			<tr>
				<td>
				<input type="hidden" value=<%=(String)session.getAttribute("id")%> name="id"/>
				<input type="submit" value="정보수정"> &nbsp;<!-- 위의 form과 연동되어 loginProcess로 이동한다. -->
				</td>
			</tr>
		</form>
		
		</table> 
	<%
       }
	   
    %>


