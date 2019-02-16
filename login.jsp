<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> Login </title>
</head>
<body>
 
    <%
        // 현재 로그인된 아이디가 없다면 (= session에 저장된 id가 없다면)
        if(session.getAttribute("id") == null) {
            %>
            <h1> 로그인 페이지 </h1> 
            <br /> <form action="login_check.jsp" method="post">
            <br />
            <br /> <input name="input_id" type="text">
            <br />
            <br /> <input name="input_pw" type="password"> <button> 로그인 </button>
            <br /> </form>
            <br /> <button onClick="location.href='join.jsp'"> 회원가입 </button>
            <%
        } 
        // 현재 로그인된 아이디가 있다면 (= session에 저장된 id가 있다면)
        else {
            out.print(session.getAttribute("id") + " 님 환영합니다");
            %>
            <h1> 로그인 페이지 </h1> 
            <br /> <form action="logout.jsp" method="post">
            <br />
            <br /> <button> 로그아웃 </button>
            <br />
            <br /> </form>
            <br /> <button onClick="location.href='change.jsp'"> 개인정보 변경</button>
            <%
        }
    %>
    
 
</body>
</html>
