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
String biTitle = request.getParameter("bi_title");
String biType = request.getParameter("bi_type");
String biStar = request.getParameter("bi_star");
String biCredat = request.getParameter("bi_credat");
String biDesc= request.getParameter("bi_desc");
Connection con = DBCon.getCon();
String sql="update books_info set bi_title=?,bi_type=?,bi_star=?,bi_credat=?,bi_desc=?";
sql+="where bi_num=?";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,biTitle);
ps.setString(2,biType);
ps.setString(3,biStar);
ps.setString(4,biCredat);
ps.setString(5,biDesc);
ps.setString(6,biNum);
int result = ps.executeUpdate();
if(result==1){
	out.println("성공");
	con.commit();
}
%>
<a href="<%=rootPath%>/books/list.jsp"><button>리스트로 가기</button></a>
</body>
</html>