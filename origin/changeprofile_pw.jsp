<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> ChangeProfile_pw </title>
</head>
<body>
 
    <h1> 비밀번호 변경 </h1>
    <br /> <form action="changeprofile_pw_check.jsp" method="post" onsubmit="return input_check_func()">
    <br />
    <br /> 지금 비밀번호 : <input id="now_pw" name="now_pw">
    <br />
    <br /> 바꿀 비밀번호 : <input id="change_pw" name="change_pw">
    <br /> 
    <br /> 한번더 쳐봐라 : <input id="change_pw_check" name="change_pw_check">
    <br />
    <br /> <button> 변경 </button>
    <br /> </form>
    
    <script>
    // input_check_func는 회원가입에 필요한 3가지 문항을 전부다 채워 넣었는지 check 해준다
    // 이는 form onsubmit에 의해 발동되며 return 값이 false 일 경우 페이지의 데이터가 action= 좌표로 넘어가지 않게된다
    function input_check_func() {
        var now_pw = document.getElementById('now_pw').value;
        var change_pw = document.getElementById('change_pw').value;
        var change_pw_check = document.getElementById('change_pw_check').value;
        
        if(now_pw == null || change_pw == null || change_pw_check == null ||
           now_pw == ""   || change_pw == ""   || change_pw_check == "") {
            alert("공백은 허용치 않는다");
            return false;
        } 
        // 새로운 비밀번호와 새로운 비밀번호 확인 input에 적은 값이 다르다면 경고창을 띄우고 false를 반환해서 action을 막는다
        else if ( change_pw != change_pw_check ) {
            alert("새로운 비밀번호가 안맞따");
            return false;
        } else {
            
            // input들이 공백인지, 새 비밀번호와 새 비밀번호 확인 유무가 통과되면 action=좌표 로 이동한다
            // 여기서 현재 비밀번호가 맞는지 안맞는지는 확인안한다 조금 어렵더라고
            return true;
        }
    }    
    </script>
 
</body>
</html>
