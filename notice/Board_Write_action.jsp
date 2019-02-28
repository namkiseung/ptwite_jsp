<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%!
    public class CEncrypt
    {
        MessageDigest md;
        String strSRCData = "";
        String strENCData = "";

        public CEncrypt(){}
        //인스턴스 만들 때 한방에 처리할 수 있도록 생성자 중복시켰습니다. 
        public CEncrypt(String EncMthd, String strData)
        {
            this.encrypt(EncMthd, strData);
        }

        //암호화 절차를 수행하는 메소드입니다.
        public void encrypt(String EncMthd, String strData)
       {
           try
          {
              MessageDigest md = MessageDigest.getInstance(EncMthd); // "MD5" or "SHA1"
             byte[] bytData = strData.getBytes();
             md.update(bytData);

             byte[] digest = md.digest();
             for(int i =0;i<digest.length;i++)
             {
                 strENCData = strENCData + Integer.toHexString(digest[i] & 0xFF).toUpperCase();
             }
           }catch(NoSuchAlgorithmException e)
          {
             System.out.print("암호화 알고리즘이 없습니다.");
          };
        
          //나중에 원본 데이터가 필요할지 몰라서 저장해 둡니다.
          strSRCData = strData;
        }

        //접근자 인라인 함수(아니, 메소드)들입니다.
        public String getEncryptData(){return strENCData;}
        public String getSourceData(){return strSRCData;}

        //데이터가 같은지 비교해주는 메소드입니다.
        public boolean equal(String strData)
        {
          //암호화 데이터랑 비교를 하던, 원본이랑 비교를 하던 맘대로....
          if(strData == strENCData) return true;
          return false;
        }
    }    //CEncrypt
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기 완료</title>
</head>
<%@ page import="java.security.*" %>

<body>
<%	 
    request.setCharacterEncoding("UTF-8");
	String pass="";
	// request.getRealPath("상대경로") 를 통해 파일을 저장할 절대 경로를 구해온다.
    // 운영체제 및 프로젝트가 위치할 환경에 따라 경로가 다르기 때문에 아래처럼 구해오는게 좋음
    String uploadPath = request.getRealPath("/notice/board_storage");

	int maxSize = 1024 * 1024 * 10; // 한번에 올릴 수 있는 파일 용량 : 10M로 제한
	String fileName1 = ""; // 중복처리된 이름
    String originalName1 = ""; // 중복 처리전 실제 원본 이름
    long fileSize = 0; // 파일 사이즈
    String fileType = ""; // 파일 타입
    String req_title=""; 
	String req_content="";
	String req_password="";
	
    MultipartRequest multi = null;
	try{
        // request,파일저장경로,용량,인코딩타입,중복파일명에 대한 기본 정책
        multi = new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
         //String req_attach = request.getParameter("attach");	 	 
	    req_title = multi.getParameter("title");	 	 
	    req_content = multi.getParameter("content");	 	 
	    req_password = multi.getParameter("password");
	    CEncrypt encrypt = new CEncrypt("SHA1", req_password);
		pass = encrypt.getEncryptData();
        // form내의 input name="name" 인 녀석 value를 가져옴
       // name = multi.getParameter("name");
        // name="subject" 인 녀석 value를 가져옴
       // subject = multi.getParameter("subject");
         
        // 전송한 전체 파일이름들을 가져옴
        Enumeration files = multi.getFileNames();
         
        while(files.hasMoreElements()){
            // form 태그에서 <input type="file" name="여기에 지정한 이름" />을 가져온다.
            String file1 = (String)files.nextElement(); // 파일 input에 지정한 이름을 가져옴
            // 그에 해당하는 실재 파일 이름을 가져옴
            originalName1 = multi.getOriginalFileName(file1);
            // 파일명이 중복될 경우 중복 정책에 의해 뒤에 1,2,3 처럼 붙어 unique하게 파일명을 생성하는데
            // 이때 생성된 이름을 filesystemName이라 하여 그 이름 정보를 가져온다.(중복에 대한 처리)
            fileName1 = multi.getFilesystemName(file1);
			//업로드한 파일이름을 첨부파일 요청변수에 덮어쓴다.
		
            // 파일 타입 정보를 가져옴
            fileType = multi.getContentType(file1);
            // input file name에 해당하는 실재 파일을 가져옴
            File file = multi.getFile(file1);
            // 그 파일 객체의 크기를 알아냄
            fileSize = file.length();
        }
    }catch(Exception e){
        e.printStackTrace();
    }
	
     try{
	   
       String driver = "oracle.jdbc.driver.OracleDriver";  
       Class.forName(driver);
 
       String url = "jdbc:oracle:thin:@192.168.232.1:1521:xe";
       String id = "testuser";
       String pw = "1234";
 
       Connection conn = DriverManager.getConnection(url, id, pw);
       Statement st = conn.createStatement();   	 
		String sql = "INSERT INTO noticeboard (IDXB, TITLEB, WRITERB, EMAILB, CONTENTB, PASSB, HITB, ATTACHB, DATEB) values (nb_seq.NEXTVAL, '"+req_title+"', '"+session.getAttribute("name")+"', '"+session.getAttribute("email")+"', '"+req_content+"', '"+pass+"', 0, '"+fileName1+"', to_char(sysdate, \'YYYY-MM-DD HH:MI:SS\'))";
	   
		st.executeUpdate(sql);  
		conn.close();
		st.close();
} catch (SQLException e){
	e.printStackTrace();
}	   
%>
		작업이 완료되었습니다. 목록으로 돌아갑니다!!
		<script>
		
		setTimeout(function(){ location.href='/notice/Board_List.jsp'; }, 3500);
		</script>
</body>
</html>