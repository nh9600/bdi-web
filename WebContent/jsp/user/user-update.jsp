<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
		String num = request.getParameter("ui_num");
		String sql = "select*from user_info where ui_num=?";
		Connection con = DBCon.getCon();
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, num);
		ResultSet rs = ps.executeQuery();
		if (!rs.next()) {//조건문(ture/false)
			out.println(num + "에 해당하는 게시물은 존재 하지 않습니다.");
		} else {

			//pk는 건들이면 안되는 것
	%>
	<form method="post" action="/bdi-web/jsp/user/user-update_ok.jsp">
		<table border="1">
			<tr>
				<th>번호</th>
				<td><%=num%></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id"
					value="<%out.println(rs.getString("ui_id"));%>"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pwd"
					value="<%out.println(rs.getString("ui_pwd"));%>"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name"
					value="<%out.println(rs.getString("ui_name"));%>"></td>
			</tr>
			<tr>
				<th>나이</th>
				<td><input type="number" name="age"
					value="<%out.print(rs.getString("ui_age"));%>"></td>
			</tr>
			<tr>
				<th>비고</th>
				<td><textarea name="etc">
						<%
							out.println(rs.getString("ui_age"));
						%>
					</textarea></td>
			</tr>
			<tr>
			<th>hobby</th>
			<td></td>
			</tr>
		</table>
		<button>signup</button>
		<input type="hidden" name="num" value="<%=rs.getString("ui_num")%>">
	</form>
	<%
		}
	%>
	<%
		
	%>
</body>
</html>