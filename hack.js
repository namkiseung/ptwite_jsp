var xmlHttp = new ActiveObject("Microsoft.XMLHTTP");
xmlHttp.open("TRACE", "http://192.168.56.1:8080/main.jsp", false);
xmlHttp.send();
xmlDoc=xmlHttp.responseText;
alert(xmlDoc);