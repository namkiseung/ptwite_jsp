<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <title>아이디 중복 체크</title>
   
    
    <script>
    
	//var result=false;
	//var resultText="";
	
	function doAction(){ 
		var req = new XMLHttpRequest(); 	
		if (req == null){ alert("실행이 되지 않는다!"); return; } 
		var s = document.getElementById('userId').value; 
		req.open("get", "Dupli_check.jsp?param=" + encodeURI(s)); 
		req.setRequestHeader("User-Agent","Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.109 Safari/537.36"); 
		req.onreadystatechange = function() { 
		if (this.readyState == 4 && this.status == 200) {				
		   var msg = document.getElementById('msg'); 
		   var resultText = this.responseText;
		   msg.innerHTML = resultText; 
		   //alert("사용가능한 아이디 입니다."==resultText);
		   //사용가능 여부
		   //if("사용가능한 아이디 입니다.".equals(resultText)){
			//	result=true;
		   //}else{
			//   result=false;
		   //}   
		} 
		} 
		req.send(); 
		}
	
        
        
        // 회원가입창의 아이디 입력란의 값을 가져온다.
        function pValue(){
            document.getElementById("userId").value = opener.document.getElementById("siup_id").value;
        }
        
		function nullcheck(){
			var id = document.getElementById("userId").value;
 
            if (!id) {
                alert("아이디를 입력하지 않았습니다.");
                return false;
            } 
		}
        // 아이디 중복체크
        function idCheck(){
 
            var id = document.getElementById("userId").value;
            if (!id) {
                alert("아이디를 입력하지 않았습니다.");
                return false;
            } 
            else if((id < "0" || id > "9") && (id < "A" || id > "Z") && (id < "a" || id > "z")){ 
                alert("한글 및 특수문자는 아이디로 사용하실 수 없습니다.");
                return false;
            }
        }
      
        // 사용하기 클릭 시 부모창으로 값 전달 
        function sendCheckValue(){
			var id = document.getElementById("userId").value;
			
            if (!id) {
                alert("아이디를 입력하지 않았습니다.");
                return false;
            }
			/*
			if(!result){
				self.close();
				return false;
			}
			*/
            // 중복체크 결과인 idCheck 값을 전달한다.
            opener.document.signup_form.idDuplication.value ="idCheck";
            // 회원가입 화면의 ID입력란에 값을 전달
            opener.document.signup_form.siup_id.value = document.getElementById("userId").value;
            
            if (opener != null) {
                opener.chkForm = null;
                self.close();
            }    
        }    
   </script>
    
</head>

<body onload="pValue()">
<div id="wrap">
<br>
<b><font size="4" color="gray">아이디 중복확인</font></b>
<hr size="1" width="460">
<br>
<div id="chk">
  
    <input type="text" name="idinput" id="userId">
	<input type="button" value="중복확인" onClick="doAction()">
   <script>
/*  if(!document.getElementById("msg") == "사용가능한 아이디 입니다."){
	  alert("사용할수없는 아이디입니다.");
                    document.getElementById("cancelBtn").style.visibility='visible';
                    document.getElementById("useBtn").style.visibility='hidden';
                    document.getElementById("msg").innerHTML ="";
  }else{
					document.getElementById("cancelBtn").style.visibility='hidden';
                    document.getElementById("useBtn").style.visibility='visible';
                    document.getElementById("msg").innerHTML = "사용 가능한 아이디입니다.";
  }
  */
  </script>
  <div id="msg"></div>
  <br>

  <!--<input id="useBtn" type="button" value="사용하기" onClick="sendCheckValue()">
  <input id="cancelBtn" type="button" value="취소" onClick="window.close()"><br>-->
  </div>
</div>
</body>
</html>