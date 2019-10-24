<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%!//선언문은 맨 위에 하는게 보기 편함
	public String checkStr(String str, String targetStr) {//첫번째 인자는 꼭 스트링,두번째 인자는 꼭 스트링
		String[] strs = str.split(",");
		for (String s : strs) {//0번째방에 movie 1번째방에 study 
			//s : strs(비교할 값)
			if (s.equals(targetStr)) {//같은지 비교 
				return "checked";//같으니까 스트링으로 부를 수 있는 값을 가지고 메소드를 나감
			}
		}
		return "";//같지않으니까 스트링으로 불릴 수 있는 빈문자열을 가지고 메소드를 나감
	}%>
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
			out.println(num + "에 해당하는 게시물은 존재 하지 않습니다.");//값이 없으면 출력
		} else {//값이 있으니까 화면에 보여줌

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
				<th>hobby</th><%--다이나믹 리소스
				out.println("a")을 줄여서 ="a" --%>
				<%--checStr내가 만든 메소드를 호출(첫문자가 소문자니까 메소드--%>
				<%--getString 스트링을 가져오겠다. --%>
				<td><input type="checkbox" name="hobby" value="study" <%=checkStr(rs.getString("hobby"),"study")%>>공부
				<%--rs.getString/  "checked"--%>
				<%--값이 안맞으면 빈문자열 출력문("")--%>
					<input type="checkbox" name="hobby" value="game" <%=checkStr(rs.getString("hobby"),"game")%>>게임 
					<input type="checkbox" name="hobby" value="movie" <%=checkStr(rs.getString("hobby"),"movie")%>>영화 
					<input type="checkbox" name="hobby" value="music" <%=checkStr(rs.getString("hobby"),"music")%>>음악
				</td>
			</tr>
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