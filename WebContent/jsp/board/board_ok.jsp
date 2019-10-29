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
String title = request.getParameter("title");
String user = request.getParameter("user");
String content = request.getParameter("content");

String sql="insert into board_info(bi_num,bi_title,bi_user,bi_content,bi_credat,bi_cretim,bi_moddat,bi_modtim)";
sql+="values(seq_ui_num.nextval,?,?,?,to_char(sysdate,'yyyymmdd'),to_char(sysdate,'hh24miss'),to_char(sysdate,'yyyymmdd'),to_char(sysdate,'hh24miss'))";
Connection con = DBCon.getCon();
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,title);
ps.setString(2,user);
ps.setString(3,content);
int result = ps.executeUpdate();
if(result==1){
	out.println("작성완료");
	con.commit();
}
%>
<a href="/bdi/books/list.jsp"><button>리스트로 가기</button></a>
</body>
</html>