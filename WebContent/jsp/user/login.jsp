<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><%--내가 누구인지 밝힘 --%>
<%--1차적인 방어 = ''--%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
if(id!=null){
	String sql="select * from user_info where ui_id=? and ui_pwd=?";//첫번째 물음표에 아이디 대입해
	Connection con = DBCon.getCon();
	PreparedStatement ps = con.prepareStatement(sql);//sql을 먼저 머리속에 집어넣음
	ps.setString(1,id);//첫번째 물음표에 아이디 셋팅해
	ps.setString(2,pwd);//두번째에 물음표에 비밀번호 셋팅해 
	ResultSet rs = ps.executeQuery();
	
	if(rs.next()){//한번만 돌릴거니까 wif
		out.println(rs.getString("ui_name")+"님 안녕하세요~");
	}else
		out.println("야... 아이디 비번 잘못입력했다~");
}
%>
<form method = "post"><%--겟방식은 url이 바뀌는데 포스트방식는 바뀌지 않는다--%>
<button>로그인</button>

</form>
</body>
</html>