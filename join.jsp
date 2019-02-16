<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("euc-kr");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title> Join </title>
</head>
<body>
 
    <h1> 회원가입 </h1>
    <form action="join_check.jsp" method="post" onsubmit="return input_check_func()">
    <table border="1">
        <tr>
            <th> id </th> <td> <input id="JOIN_id" name="JOIN_id"> </td>
        </tr>
        <tr>
            <th> pw </th> <td> <input id="JOIN_pw" name="JOIN_pw"> </td>
        </tr>
        <tr>
            <th> 취미 </th> <td> <input id="JOIN_hobby" name="JOIN_hobby"> </td>
        </tr>
    </table>
    <button> 가입하기 </button>
    </form>
    
    <script>
    // input_check_func는 회원가입에 필요한 3가지 문항을 전부다 채워 넣었는지 check 해준다
    // 이는 form onsubmit에 의해 발동되며 return 값이 false 일 경우 페이지의 데이터가 action= 좌표로 넘어가지 않게된다
    function input_check_func() {
        var id = document.getElementById('JOIN_id').value;
        var pw = document.getElementById('JOIN_pw').value;
        var hobby = document.getElementById('JOIN_hobby').value;
        
        if(id == null || pw == null || hobby == null ||
         id == ""   || pw == ""   || hobby == "") {
            alert("공백은 허용치 않는다");
            return false;
        } else {
            // 모든조건이 충족되면 true를 반환한다 이는 현재 페이지의 정보를 action= 좌표로 넘긴다는것을 의미
            return true;
        }
    }    
    </script>
 
</body>
</html>

