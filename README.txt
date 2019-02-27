# 디렉터리 : /usr/local/server/apache-tomcat-7.0.92/webapps/ROOT
# 1) 환경 구성
	- tomcat 7
	- oracle 11g express
# 2) 디렉터리 설명
	- 로그인 기능 수정 : /sec01/
	  아주 취약한 로직
	- 로그인 기능 수정 : /sec02/
	  PreparedStatement 구현한 시큐어 코딩 로직
	- 로그인 기능 수정 : /sec03/
	  인증 로직을 따로 구현한 시큐어 코딩
	- 로그인 기능 수정 : /sec04/
	  암호화를 적용했지만, 솔트 없고 해독 쉬운 해쉬로 암호화
# 3) 기능