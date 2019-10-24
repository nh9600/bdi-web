<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="get" action="/bdi-web/jsp/board/board_ok.jsp">
		<table border="1">
			<tr>
				<th>게시판 제목</th>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<th>게시판 작성자</th>
				<td><input type="text" name="user"></td>
			</tr>
			<tr>
				<th>게시판 내용</th>
				<td><textarea name="content"></textarea></td>
			</tr>
		</table>
					<button>작성완료</button>
	</form>
</body>
</html>