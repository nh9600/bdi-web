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
String sql = "delete from board_info where bi_num="+num;
Connection con = DBCon.getCon();
Statement stmt = con.createStatement();
int result = stmt.executeUpdate(sql);
if(result==1){
	out.println("삭제완료");
}else{
	out.println("삭제안됐음");
}
%>
<a href="/bdi-web/jsp/board/board-list.jsp"><button>리스트로 가기</button></a>
</body>
</html>