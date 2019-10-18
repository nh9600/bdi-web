
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup</title>
</head>
<body>
  <form method="get"action="/bdi-web/jsp/signup_ok.jsp"> 
    ID: <input type = "text" name = "id"> <br>
    Password: <input type = "password" name = "pwd"> <br>
    Name: <input type = "text" name = "name"> <br>
    Age: <input type = "number" name = "age"><br>
    Etc: <textarea name = "etc"></textarea><br>
    <button>Signup</button><br>
  </form>
</body>
</html>