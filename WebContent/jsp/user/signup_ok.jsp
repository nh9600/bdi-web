<%@page import="java.sql.PreparedStatement"%>
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
request.setCharacterEncoding("UTF-8");
String[] hobbies = request.getParameterValues("hobby");
String hobby="";
for(int i=0;i<hobbies.length;i++){
	hobby+=hobbies[i]+",";
}
hobby=hobby.substring(0,hobby.length()-1);
out.println(hobby);
String num = request.getParameter("num");
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String name = request.getParameter("name");
String age = request.getParameter("age");
String etc = request.getParameter("etc");

String sql ="insert into user_info(ui_num,ui_id,ui_pwd,ui_name,ui_age,ui_etc,hobby)";//
sql+="values(seq_ui_num.nextval,?,?,?,?,?,?)";//
Connection con = DBCon.getCon();
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,id);
ps.setString(2,pwd);
ps.setString(3,name);
ps.setString(4,age);
ps.setString(5,etc);
ps.setString(6,hobby);//
int result = ps.executeUpdate();
if(result==1){
	out.println("회원가입 완료");
 	con.commit();
}
%>
<a href="/bdi-web/jsp/user/signup-list.jsp"><button>리스트로 가기</button></a>
</body>
</html>