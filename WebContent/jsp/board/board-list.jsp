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
String search = request.getParameter("search");
String searchStr = request.getParameter("scr");
String sql="select * from board_info";
if(search!=null){
	if("bi_title".equals(search)){
		sql+=" where bi_title like ? ";
	}else if("bi_user".equals(search)){
		sql+=" where bi_user like ? ";
	}else if("bi_content".equals(search)){
		sql+=" where bi_content like ? ";
	}
}
sql+=" order by bi_num desc";
String num = request.getParameter("num");
String title = request.getParameter("title");
String user = request.getParameter("user");
String content = request.getParameter("content");
Connection con = DBCon.getCon();
PreparedStatement ps = con.prepareStatement(sql);
if(search!=null){
	if("bi_title".equals(search)||"bi_user".equals(search)||"bi_content".equals(search)){
		ps.setString(1,"%"+searchStr+"%");
	}
}
ResultSet rs = ps.executeQuery();
%>
<table border="1">
<form>
<select name="search">
<option value="bi_title">제목</option>
<option value="bi_user">글쓴이</option>
<option value="bi_content">내용</option>
</select>
<input type = "text" name = "scr"><button>검색</button>
</form>
<th>번호</th>
<th>제목</th>
<th>사용자</th>
<th>내용</th>
<th>등록일자</th>
<th>등록시간</th>
<th>수정일자</th>
<th>수정시간</th>
<th>수정</th>
<th>삭제</th>

<%
while(rs.next()){
		out.println("<tr>");
		out.println("<td>"+rs.getString("bi_num")+"</td>");
		out.println("<td>"+rs.getString("bi_title")+"</td>");
		out.println("<td>"+rs.getString("bi_user")+"</td>");
		out.println("<td>"+rs.getString("bi_content")+"</td>");
		out.println("<td>"+rs.getString("bi_credat")+"</td>");
		out.println("<td>"+rs.getString("bi_cretim")+"</td>");
		out.println("<td>"+rs.getString("bi_moddat")+"</td>");
		out.println("<td>"+rs.getString("bi_modtim")+"</td>");
		out.println("<td><a href=\"/bdi-web/jsp/board/board-update.jsp"+"?bi_num="+rs.getString("bi_num")+"\"><button>수정</button></td>");
		out.println("<td><a href=\"/bdi-web/jsp/board/board-delete.jsp"+"?bi_num="+rs.getString("bi_num")+"\"><button>삭제</button></td>");
		out.println("</tr>");
	}

%>

</table>
<a href="/bdi-web/jsp/board/board.jsp"><button>글쓰기</button></a>
</body>
</html>