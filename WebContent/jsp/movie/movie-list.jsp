<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
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
/*Statement
1. 단일로 사용될 때 빠른 속도를 지닙니다.
2. 쿼리에 인자를 부여할 수 없습니다.
3. 매번 컴파일을 수행해야 합니다.
PreparedStatement
1. 쿼리에 인자를 부여할 수 있습니다.
2. 처음 프리컴파일 된 후, 이후에는 컴파일을 수행하지 않습니다.	
3. 여러번 수행될 때 빠른 속도를 지닙니다.*/
Connection con = DBCon.getCon();
String sql="select * from movie_info";
PreparedStatement ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery();
//버튼태그는 꼭 폼태그 안에 있어야 함 
%>
<table border="1">
<tr>
<th>번호</th>
<th>영화제목</th>
<th>티켓가격</th>
<th>개봉일</th>
<th>영화설명</th>
<th>연령등급</th>
<th>별점</th>
<th>수정</th>
<th>삭제</th>
</tr>

<%
while(rs.next()){	
	out.println("<tr>");
	out.println("<td>"+rs.getString("mi_num")+"</td>");
	out.println("<td>"+rs.getString("mi_name")+"</td>");
	out.println("<td>"+rs.getString("mi_price")+"</td>");
	out.println("<td>"+rs.getString("mi_date")+"</td>");
	out.println("<td>"+rs.getString("mi_desc")+"</td>");
	out.println("<td>"+rs.getString("mi_age")+"</td>");
	out.println("<td>"+rs.getString("mi_star_rate")+"</td>");
	out.println("<td><a href=\"/bdi-web/jsp/movie/movie-update.jsp"+"?mi_num="+rs.getString("mi_num")+"\"><button>수정</button></td>");
	out.println("<td><a href=\"/bdi-web/jsp/movie/movie-delete.jsp"+"?mi_num="+rs.getString("mi_num")+"\"><button>삭제</button></td>");
	out.println("</tr>");
}
%>
</table>
<a href="/bdi-web/jsp/movie/movie-insert.jsp"><button>글쓰기</button></a>
</body>
</html>