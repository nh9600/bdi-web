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
String sql="delete from books_info where bi_num="+biNum;
PreparedStatement ps = con.prepareStatement(sql);
int result = ps.executeUpdate();
if(result==1){
	out.println("삭제완료");
	con.commit();
}
%>
<a href="<%=rootPath%>/books/list.jsp"><button>리스트로 가기</button></a>
</body>
</html>