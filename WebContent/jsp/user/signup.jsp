<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="/bdi-web/jsp/user/signup_ok.jsp">
<table border="1">
<tr>
<th>아이디</th>
<td><input type = "text" name = "id"></td>
</tr>
<tr>
<th>비밀번호</th>
<td><input type = "password" name = "pwd"></td>
</tr>
<th>이름</th>
<td><input type = "text" name = "name"></td>
</tr>
<tr>
<th>나이</th>
<td><input type = "number" name = "age"></td>
</tr>
<tr>
<th>비고</th>
<td><textarea type="text" name="etc"></textarea></td>
</tr>
<tr>
<th>hobby</th>
<td>
<input type = "checkbox" name="hobby" value="study">공부
<input type = "checkbox" name="hobby" value="game">게임
<input type = "checkbox" name="hobby" value="movie">영화
<input type = "checkbox" name="hobby" value="music">음악
</td>
</tr>
</table>
<th colspan="2"><button>signup</button></th>

</form>

</body>
</html>