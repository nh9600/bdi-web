<%@page import="java.sql.Statement"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup</title>
</head>
<body>
<%
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String name = request.getParameter("name");
String age= request.getParameter("age");
String etc = request.getParameter("etc");
if(id!=null){
out.println("니가 입력한 아이디 : "+id+"<br>");
out.println("니가 입력한 pwd : "+pwd+"<br>");
out.println("니가 입력한 name : "+name+"<br>");
out.println("니가 입력한 age : "+age+"<br>");
out.println("니가 입력한 etc : "+etc+"<br>");

Connection con = DBCon.getCon();//여기서는 컨트롤+스페이스 엔터!
Statement stmt = con.createStatement();//칠판 만들어주기!
String sql = "insert into user_info(ui_id,ui_pwd,ui_name,ui_age,ui_etc)";
sql+="values('"+id+"','"+pwd+"','"+name+"','"+age+"','"+etc+"')";
int result = stmt.executeUpdate(sql);
if(result==1){
out.println("회원가입완료");
}
con.commit();//전화기를 없애버린게 아니라 전화만 끊은것
}
%> 
  <form>
    ID: <input type = "text" name = "id"> <br>
    Password: <input type = "password" name = "pwd"> <br>
    Name: <input type = "text" name = "name"> <br>
    Age: <input type = "number" name = "age"><br>
    Etc: <textarea name = "etc"></textarea><br>
    <button>Signup</button><br>
  </form>
</body>
</html>