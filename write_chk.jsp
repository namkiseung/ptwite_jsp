<%@ page language="java" 
    contentType="text/html; charset="UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
 
    <%
        // signin.jsp input 에서 입력한 회원가입에 필요한 값들을 변수에 담아준다
        String his_id = request.getParameter("siup_id"); //아이디
        String his_pw = request.getParameter("siup_pw"); //비밀번호
		String his_email = request.getParameter("siup_email"); //이메일
        String his_name = request.getParameter("siup_name"); //이름
		String his_birth = request.getParameter("siup_birth"); //생년월일
		String his_addr = request.getParameter("siup_addr"); //주소
		
        try {
            // 드라이버 로딩
            String driver = "oracle.jdbc.driver.OracleDriver";
            Class.forName(driver);
            
            // 관리자 Login
            String url = "jdbc:oracle:thin:@192.168.177.135:1521:xe";
            String id = "testuser";
            String pw = "1234";
            
            // 연결
            // INSERT 해달라 USERTABLE에 
            // id, pw, hobby 라는 필드를 가진
            Connection conn = DriverManager.getConnection(url, id, pw);
            Statement st = conn.createStatement();
			//,'hello title', 'hello world test content', 'admin@naver.com', 'admin', SYSDATE
            String sql = "INSERT INTO member VALUES (
			                    "tmp_bseq.NEXTVAL",
								"'"+his_id+"'",
								"'"+his_pw+"'",
								"'"+his_email+"'",
								"'"+his_name+"'",
								"'"+his_birth+"'",
								"'"+his_addr+"'",
								"SYSDATE")";
            st.executeUpdate(sql);
            
            // 회원가입에 성공하였으면 첫 페이지로 보낸다
            response.sendRedirect("main.jsp");        
            
        } catch (Exception e) {       
            out.println("DB 연동 실패");
        } catch (SQLException e){
			out.println( "<script>"
            + "alert('회원가입 오류입니다.');"
            + "location.href='main.jsp';"
            + "</script>");
		}
    %>
 
</body>
</html>
