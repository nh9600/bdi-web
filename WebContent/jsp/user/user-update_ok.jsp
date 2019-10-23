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
request.setCharacterEncoding("UTF-8");
String num = request.getParameter("num");
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String name = request.getParameter("name");
String age = request.getParameter("age");
String etc = request.getParameter("etc");
String sql= "update user_info set ui_id=?,ui_pwd=?,ui_name=?,ui_age=?,ui_etc=?";
sql+=" where ui_num=?";
Connection con = DBCon.getCon();
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,id);
ps.setString(2,pwd);
ps.setString(3,name);
ps.setString(4,age);
ps.setString(5,etc);
ps.setString(6,num);
int result = ps.executeUpdate();
if(result==1){
	out.println("회원수정완료");
	con.commit();
}
out.println(sql);

%>
</body>
</html>