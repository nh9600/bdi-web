<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/first.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Connection con = DBCon.getCon();
String sql = "select * from books_type order by bt_num";
PreparedStatement ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery();
%>
<form method="get" action="<%=rootPath%>/books/insert_ok.jsp">
<table border="1">
<tr>
<th>제목</th>
<td><input type="text" name="bi_title"></td>
</tr>
<tr>
<th>종류</th>
<td><select name="bi_type">
<%
while(rs.next()){
%>
<option value="<%=rs.getString("bt_num") %>"><%=rs.getString("bt_name")%></option>
<%
}
%>
</select>
</tr>
<tr>
<th>별점</th>
<td><input type="number" name="bi_star"></td>
</tr>
<tr>
<th>날짜</th>
<td><input type="number" name="bi_credat"></td>
</tr>
<tr>
<th>내용</th>
<td><textarea name="bi_desc"></textarea></td>
</tr>
</table>
<button>작성완료</button>
</form>
</body>
</html>