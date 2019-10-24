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
String num = request.getParameter("num");
String title = request.getParameter("title");
String user = request.getParameter("user");
String content = request.getParameter("content");
String credat = request.getParameter("credat");
String cretim = request.getParameter("cretim");
String moddat = request.getParameter("moddat");
String modtim = request.getParameter("modtim");
String sql= "update board_info set bi_title=?,bi_user=?,bi_content=?";
sql+=" where bi_num=?";
Connection con = DBCon.getCon();
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,num);
ps.setString(2,user);
ps.setString(3,content);
ps.setString(4,num);
int result = ps.executeUpdate();
if(result==1){
	out.println("업데이트 완료");
	con.commit();
}
%>
<a href="/bdi-web/jsp/board/board-list.jsp"><button>리스트로 가기</button></a>
</body>
</html>