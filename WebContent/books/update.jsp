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
String biNum = request.getParameter("bi_num");
Connection con = DBCon.getCon();
String sql="Select * from books_info where bi_num=?";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,biNum);
ResultSet rs = ps.executeQuery();
if(!rs.next()){
	out.println("존재하지 않습니다.");
}else{
%>
<form method="get" action="<%=rootPath%>/books/update_ok.jsp">
<table border="1">
<tr>
<th>제목</th>
<td><input type="text" name="bi_title" value="<%=rs.getString("bi_title")%>"></td>
</tr>
<tr>
<th>종류</th>
<td><input type="text" name="bi_type" value="<%=rs.getString("bi_type")%>"></td>
</tr>
<tr>
<th>별점</th>
<td><input type="number" name="bi_star" value="<%=rs.getString("bi_star")%>"></td>
</tr>
<tr>
<th>날짜</th>
<td><input type="text" name="bi_credat" value="<%=rs.getString("bi_credat")%>"></td>
</tr>
<tr>
<th>내용</th>
<td><textarea name="bi_desc"><%=rs.getString("bi_desc")%></textarea></td>
</tr>
</table>
<button>작성완료</button>
<input type="hidden" name="bi_num" value="<%=rs.getString("bi_num")%>">
</form>
<%
}
%>
</body>
</html>