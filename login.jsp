<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

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
        // 현재 로그인된 아이디가 없다면 (= session에 저장된 id가 없다면)
        if(session.getAttribute("id") == null) {
            %>
			
		<form name="loginform" action="http://192.168.56.1:8080/login_chk.jsp" method="post">
			<center>
				<table style="margin-top:20px;">
					<tr>
						<td bgcolor=#ffffe8>아이디 : </td><td><input type="text" name="siin_id" placeholder="username"></td>
						<td bgcolor=#ffffe8>비밀번호 : </td><td><input type="password" name="siin_pw">&nbsp;&nbsp;</td>
						<td>
						<input type="submit" value="로그인" class="hover"> &nbsp;<!-- 위의 form과 연동되어 loginProcess로 이동한다. -->
						<button><a href ="http://192.168.56.1:8080/agree.jsp" class="hover">회원가입</a></button>  <!-- 회원가입을 누르면 a태그를 통해서 joinForm으로 이동한다. -->
						</td>
					</tr>
				</table>
			</center>
		</form>
			<span style="margin-left:70%; font-size:10pt">Forgot your 
			<a href="ologin.jsp">userid</a> or <a href="http://192.168.56.1:8080/findpw.jsp">password</a></span>
            <%
        }else if(cookie!=null && Integer.parseInt(cookie.getValue())>4){
			%>
					<form name="loginform" action="http://192.168.56.1:8080/login_chk.jsp" method="post">
			<center>
				<table style="margin-top:20px;">
					<tr>
						<td bgcolor=#ffffe8>아이디 : </td><td><input type="text" name="siin_id" placeholder="비활성화 상태입니다." readonly ></td>
						<td bgcolor=#ffffe8>비밀번호 : </td><td><input type="password" name="siin_pw" readonly >&nbsp;&nbsp;</td>
						<td>
						<input type="submit" value="로그인" class="hover" readonly > &nbsp;<!-- 위의 form과 연동되어 loginProcess로 이동한다. -->
						<button><a href ="http://192.168.56.1:8080/agree.jsp" class="hover">회원가입</a></button>  <!-- 회원가입을 누르면 a태그를 통해서 joinForm으로 이동한다. -->
						</td>
					</tr>
				</table>
			</center>
		</form>
			<span style="margin-left:70%; font-size:10pt">Forgot your 
			<span>userid</span> or <span >password</span></span>
		<%} 
        // 현재 로그인된 아이디가 있다면 (= session에 저장된 id가 있다면)
        else if(session.getAttribute("id") != null){
            %>
			
		<table style="margin-top:20px;" >	
		<form name="logoutform" action="http://192.168.56.1:8080/logout.jsp" method="post">
			<tr>
				<td bgcolor=#ffffe8><%=session.getAttribute("id")%> 님</td>
				<td>
				<input type="submit" value="로그아웃"> &nbsp;<!-- 위의 form과 연동되어 loginProcess로 이동한다. -->
				</td>
			</tr>
		</form>
		</table>
		<table style="margin-top:-54.5px;margin-left:160px;" >	
		<form action="http://192.168.56.1:8080/user_edit.jsp" method="post" >
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


