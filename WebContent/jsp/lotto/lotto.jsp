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
<form type="get" action="/bdi-web/jsp/lotto/lotto_ok.jsp">
<table border="1">
<th>회차</th>
<th>첫번째 번호</th>
<th>두번째 번호</th>
<th>세번째 번호</th>
<th>네번째 번호</th>
<th>다섯번째 번호</th>
<th>여섯번째 번호</th>
<%
Connection con = DBCon.getCon();
String sql ="select * from lotto";
PreparedStatement ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery();
while(rs.next()){
	out.println("<tr>");
	out.println("<td>"+rs.getString("seq")+"</td>");
	out.println("<td>"+rs.getString("num1")+"</td>");
	out.println("<td>"+rs.getString("num2")+"</td>");
	out.println("<td>"+rs.getString("num3")+"</td>");
	out.println("<td>"+rs.getString("num4")+"</td>");
	out.println("<td>"+rs.getString("num5")+"</td>");
	out.println("<td>"+rs.getString("num6")+"</td>");
}
%>
<tr align="center">
<td colspan="7">
<button>회차생성</button></a></td></tr>
</table>
</form>
</body>
</html>