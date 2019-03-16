<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
 
    <%
		request.setCharacterEncoding("UTF-8");
		
        // user_edit.jsp input 에서 입력한 회원가입에 필요한 값들을 변수에 담아준다
        String ed_id = request.getParameter("siup_id"); //아이디
        String ed_pw_old = request.getParameter("siup_pw_old"); //기존 비밀번호
		String ed_email = request.getParameter("siup_email"); //이메일
        String ed_name = request.getParameter("siup_name"); //이름
		String ed_birth = request.getParameter("siup_birth"); //생년월일
		String ed_addr = request.getParameter("siup_addr"); //주소
		//정보수정하는 쿼리
			String sql = "UPDATE member SET"
								+" email='"+ed_email+"',"
								+" name='"+ed_name+"',"
								+" birth='"+ed_birth+"',"
								+" address='"+ed_addr+"'"
								+" WHERE userid='"+ed_id+"'";
        try {
            // 드라이버 로딩
            String driver = "oracle.jdbc.driver.OracleDriver";
			ResultSet rs = null;
            Class.forName(driver);
            
            // 관리자 Login
            String url = "jdbc:oracle:thin:@192.168.177.135:1521:xe";
            String id = "testuser";
            String pw = "1234";
            
            // 연결
            Connection conn = DriverManager.getConnection(url, id, pw);
            Statement st = conn.createStatement();
			String check_sql = "select * from member where userid='"+ed_id+"' and userpw='"+ed_pw_old+"'";
			//기존비밀번호 체크할 변수
			Boolean ischeckpw=false;
			rs = st.executeQuery(check_sql);
			if(rs.next()){  
				ischeckpw=true;
			}
			
			//기존비밀번호로 DB확인 결과 존재하면 update하자.
			if (ischeckpw){	  
				try{
					st.executeUpdate(sql);
				}catch (SQLException e) {       
					out.println("DB 연동 실패"+e);
					out.println("query : "+sql);
					out.println(sql);
				}	
				//회원가입 성공시
				session.invalidate();
				
				// 2)첫 페이지로 보낸다
				out.println("<script>");
				out.println("alert('회원 정보가 수정되었습니다..');alert('다시 로그인 해주세요.'); location.href='http://192.168.177.136:8080/ologin.jsp';");
				out.println("</script>");
			}else{
				out.println("<script>");
				out.println("alert('비밀번호가 올바르지 않습니다.');location.href='http://192.168.177.136:8080/main.jsp';");
				out.println("</script>");
				
			}		    
            
        } catch (SQLException e) {       
            out.println("DB 연동 실패"+e);
			out.println("query : "+sql);
			out.println(sql);
        }
		     
    %>
 
</body>
</html>
