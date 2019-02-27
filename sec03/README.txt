# sec03디렉터리
# 아이디를 비교 하여 식별 후
# 비밀번호를 통해 인증을 한다. (이 떄 인증은 java 코드로 따로 구현했다)

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
