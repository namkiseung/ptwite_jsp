<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%
    request.setCharacterEncoding("UTF-8");
%>





<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="ko">
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Hello World by NAMKI world</title>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/awesome-bootstrap-checkbox.min.css" rel="stylesheet">
    <link href="assets/css/font-awesome.min.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
  </head>
  <body>
  <span class="header-ribbon"/>
  <div class="container-fluid">
    <div class="row">
        <div class="col-md-4 col-md-offset-4 col-centered">
            <div class="login-panel">
                <h4 class="login-panel-title">Sitename</h4>
                <p class="login-panel-tagline">Sitename helps you connect and share with the people in your life.</p>
                <div class="login-panel-section">
                    <div class="form-group">
                        <div class="input-group margin-bottom-sm">
                            <span class="input-group-addon"><i class="fa fa-envelope-o fa-fw" aria-hidden="true"></i></span>
                            <input class="form-control" type="text" placeholder="Email address">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-key fa-fw" aria-hidden="true"></i></span>
                            <input class="form-control" type="password" placeholder="Password">
                        </div>
                    </div>
                    <div class="checkbox checkbox-circle checkbox-success checkbox-small">
                        <input type="checkbox" id="checkbox1">
                        <label for="checkbox1">Keep me logged in</label>
                        <a href="#" class="pull-right">Forget your password?</a>
                    </div>
                </div>
                <div class="login-panel-section">
                    <button type="submit" class="btn btn-default"><i class="fa fa-sign-in fa-fw" aria-hidden="true"></i> Login</button> | <a href="#">Create Your Account</a>
                </div>
            </div>
        </div>
      </div>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
  </body>
</html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>


<title>SPP Manager</title>
<script type="text/javascript">
function load() {
	document.getElementById("j_username").focus();
}



$(document).ready(function() {
    $("#f input").keypress(function (e) {  
        if ((e.which && e.which == 13) || (e.keyCode && e.keyCode == 13)) {
            fn_login();
        }   
    });   
    
    frmChk = function(){
        if(!blankCheck("#j_username", "#f", "ID를 입력하세요")) { $("#j_username").focus(); return false; }
        if(!blankCheck("#j_password", "#f", "비밀번호를 입력하세요")) { $("#j_password").focus(); return false; }
        
        return true;
    };   
});

function fn_login() {
    if(frmChk()){
    	document.f.submit();
    }
}
</script>
</head>
<body onload="load()">
    <div id="login_box">
    <form id="f" name="f" action="/spp/login.do" method="post">
        <div id="login_logo"><a href="#" tabindex="4"><img src="images/login_logo.gif" alt="SPP Manager"/></a></div>
        <div id="login_input">
            <fieldset>
                <ul>
                    <li>
                        <label><img src="images/img_id.gif" alt="아이디"/></label>
                        <input type="text" class="input_id" id="j_username" name="j_username" tabindex="1" />
                    </li>
                    <li>
                        <label><img src="images/img_pw.gif" alt="비밀번호"/></label>
                        <input type="password" class="input_pw" id="j_password" name="j_password" tabindex="2" />
                    </li>
                </ul>
            </fieldset>
        </div>
        <div id="login_btn"><a href="javascript:fn_login();" tabindex="3"><img src="images/btn_login.gif" alt="로그인" /></a></div>
    </form>
    </div>
</body>
</html>
