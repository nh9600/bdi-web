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
		String num = request.getParameter("mi_num");
		String name = request.getParameter("mi_name");
		String price = request.getParameter("mi_price");
		String date = request.getParameter("mi_date");
		date = date.replace("-","");
		String desc = request.getParameter("mi_desc");
		String age = request.getParameter("mi_age");
		String star_rate = request.getParameter("mi_star_rate");

		String sql = "insert into movie_info(mi_num,mi_name,mi_price,mi_date,mi_desc,mi_age,mi_star_rate)";
		sql += "values('" + num + "',";
		sql += "'" + name + "',";
		sql += "'" + price + "',";
		sql += "'" + date + "',";
		sql += "'" + desc + "',";
		sql += "'" + age + "',";
		sql += "'" + star_rate + "')";
		System.out.println(sql);
		Connection con = DBCon.getCon();
		Statement stmt = con.createStatement();
		int result = stmt.executeUpdate(sql);
		if (result == 1) {
			out.println("작성완료");
			con.commit();
		} else {
			out.println("잘못됐음");
			con.rollback();
		}
		//전화기를 없애버린게 아니라 전화만 끊은것
	%>
<a href="/bdi-web/jsp/movie/movie-list.jsp"><button>리스트로 가기</button></a>
</body>
</html>