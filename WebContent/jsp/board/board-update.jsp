<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String num = request.getParameter("bi_num");
		String sql = "select*from board_info where bi_num=?";
		Connection con = DBCon.getCon();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, num);
		ResultSet rs = ps.executeQuery();
		if (!rs.next()) {//조건문(ture/false) 
			out.println(num + "에 해당하는 게시물은 존재 하지 않습니다.");//값이 없으면 출력
		} else {//값이 있으니까 화면에 보여줌
		
	%>
	<form method = "get" action = "/bdi-web/jsp/board/board-update_ok.jsp">
		<table border="1">
			<tr>
				<th>게시판 제목</th>
				<td><input type="text" name="title"
					value="<%out.println(rs.getString("bi_title"));%>"></td>

			</tr>
			<tr>
				<th>게시판 작성자</th>
				<td><input type="text" name="user"
					value="<%out.println(rs.getString("bi_user"));%>"></td>

			</tr>
			<tr>
				<th>게시판 내용</th>
				<td><textarea name="content">
						<%
							out.println(rs.getString("bi_content"));
						%>
				</textarea></td>
				</td>
			</tr>
		</table>
		<button>작성완료</button>
			<input type="hidden" name="num" value="<%=rs.getString("bi_num")%>">
	</form>
	<%} %>
</body>
</html>