# sec02디렉터리

# 기본 로그인 인증 기능을 가지고 있다.
# java의 prepareStatement객체를 이용한 시큐어 코딩을 적용했다.



 String id = request.getParameter("siin_id");
 String pass =request.getParameter("siin_pw");
 
 Class.forName("oracle.jdbc.driver.OracleDriver");
 Connection conn = null;
 
 String redirectUrl = "/sec01/main.jsp";
 Boolean isLogin=false;
 
 
 try{
  ResultSet rs = null;
  PreparedStatement pstmt = null;
  String JDBCINFO = "jdbc:oracle:thin:@192.168.232.1:1521:xe";
  String ORA_USER = "testuser";
  String USER_PASSWD = "1234";
  
  conn = DriverManager.getConnection(JDBCINFO, ORA_USER, USER_PASSWD);  
  
  pstmt = conn.prepareStatement("SELECT * FROM member WHERE USERID=? and USERPW =?");
  pstmt.setString(1, id);
  pstmt.setString(2, pass);
  rs = pstmt.executeQuery();  
