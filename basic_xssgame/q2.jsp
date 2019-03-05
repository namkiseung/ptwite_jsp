<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
  <head>
	<title>Quiz 2</title>
    <script>
	
	function Post(message) { 
	  this.message = message;
	  this.date = (new Date()).getTime();
	}
	 
	function PostDB(defaultMessage) {
	  // Initial message to display to users
	  this._defaultMessage = defaultMessage || "";
	 
	  this.setup = function() {
		var defaultPost = new Post(defaultMessage);
		window.localStorage["postDB"] = JSON.stringify({
		  "posts" : [defaultPost]
		});
	  }
	 
	  this.save = function(message, callback) {
		var newPost = new Post(message);
		var allPosts = this.getPosts();
		allPosts.push(newPost);
		window.localStorage["postDB"] = JSON.stringify({
		  "posts" : allPosts
		});
	 
		callback();
		return false;
	  }
	 
	  this.clear = function(callback) {
		this.setup();
	 
		callback();
		return false;
	  }
	 
	  this.getPosts = function() {
		return JSON.parse(window.localStorage["postDB"]).posts;
	  }
	 
	  if(!window.localStorage["postDB"]) { 
		this.setup();
	  }
	}	
	
	</script>
   
    <script>
      var defaultMessage = "안녕하세요!<br><br>이곳은 개인 메모장입니다. <br><br>"
	    + "당신의 브라우저에서 <span style='color: #f001a7'>localStorage</span> 로 저장되어 집니다. <br><br>메모하세요! "
        + "<span style='color: #999999'>^_^</span><br><br>Stored XSS 취약점이 존재합니다.<br>Alert()을 띄우는 입력 값을 찾으세요~";
 
      var DB = new PostDB(defaultMessage);
 
      function displayPosts() {
        var containerEl = document.getElementById("post-container");
        containerEl.innerHTML = "";
 
        var posts = DB.getPosts();
        for (var i=0; i<posts.length; i++) {
          var html = '<table class="message"> <tr> <td valign=top> '
            + '>> </td> <td valign=top '
            + ' class="message-container"> <div class="shim"></div>';
 
          html += '<b>You</b>';
          html += '<span class="date">' + new Date(posts[i].date) + '</span>';
          html += "<blockquote>" + posts[i].message + "</blockquote";
          html += "</td></tr></table>"
          containerEl.innerHTML += html; 
        }
      }
 
      window.onload = function() { 
        document.getElementById('clear-form').onsubmit = function() {
          DB.clear(function() { displayPosts() });
          return false;
        }
 
        document.getElementById('post-form').onsubmit = function() {
          var message = document.getElementById('post-content').value;
          DB.save(message, function() { displayPosts() } );
          document.getElementById('post-content').value = "";
          return false;
        }
 
        displayPosts();
      }
 
    </script>
 
  </head>
 
  <body id="l2">
    <div id="header">
      
      <div>개인메모</div>
      <form action="?" id="clear-form">
        <input class="clear" type="submit" value="Clear all">
      </form>
    </div>
 
    <div id="post-container"></div>
 
    <table class="message">
      <tr>
        <td valign="top">
          ▶
        </td>
        <td class="message-container">
          <div class="shim"></div>
          <form action="?" id="post-form">
            <textarea id="post-content" name="content" rows="2"
              cols="50"></textarea>
            <input class="share" type="submit" value="Share status!">
            <input type="hidden" name="action" value="sign">
          </form>
        </td>
      </tr>
    </table>
 <br><button><a href="javascript:history.back(-1)">뒤로가기</A></button>
  </body>
</html>