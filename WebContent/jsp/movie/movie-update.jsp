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
니가 수정할 영화 번호:<%=request.getParameter("mi_num")%>
<%
String num = request.getParameter("mi_num");
String name = request.getParameter("mi_name");
String sql = "update user_info set mi_num="+num+" where mi_name="+name;
Connection con = DBCon.getCon();
Statement stmt = con.createStatement();
int result = stmt.executeUpdate(sql);
if (result == 1) {
	out.println("수정완료");
	con.commit();
} else {
	out.println("수정안됐음");
	con.rollback();
}

%>
</body>
</html>