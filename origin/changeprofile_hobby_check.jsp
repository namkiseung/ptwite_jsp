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
<title> ChangeProfile_hobby_check </title>
</head>
<body>
 
    <h1> 취미 변경 확인 </h1>
    <%
        // new_hobby 는 바로 전 페이지인 CHANGEPROFILE_HOBBY.jsp 에서 입력한 새로운 hobby 이다
        String new_hobby = request.getParameter("change_hobby");
 
        try {
            // 드라이버 로딩
            String driver = "oracle.jdbc.driver.OracleDriver";
            Class.forName(driver);
 
            // 관리자 Login
            String url = "jdbc:oracle:thin:@192.168.177.135:1521:xe";
            String id = "testuser";
            String pw = "1234";
 
            // 연결
            Connection conn = DriverManager.getConnection(url, id, pw);
 
            // sql 구사
            // USERTABLE 안에있는 USER_ID= 현재 로그인한 ID 필드로 가서
            // USER_HOBBY 를 new_hobby 로 변경(SET) 해달라
            Statement st = conn.createStatement();
            String sql = "UPDATE USERTABLE SET USER_HOBBY ='" + new_hobby + "' WHERE USER_ID='"
                    + session.getAttribute("id") + "'";
            st.executeUpdate(sql);
            ResultSet rs = st.executeQuery(sql);
 
            // 변경이 끝나면 CHANGEPROFILE.jsp 페이지로 돌아간다
            response.sendRedirect("changeprofile.jsp");
 
        } catch (Exception e) {
            out.println("DB 연동 실패");
        }
    %>
 
</body>
</html>