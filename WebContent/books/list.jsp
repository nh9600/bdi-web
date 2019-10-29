<%@page import="java.sql.ResultSet"%>
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
<table border="1">
<th>번호</th>
<th>이미지</th>
<th>제목</th>
<th>종류</th>
<th>별점</th>
<th>날짜</th>
<th>내용</th>
<th>수정</th>
<th>삭제</th>
<%
String search = request.getParameter("search");
String searchStr = request.getParameter("searchStr");

%>
<form>
<select name="search">
<option value="bi_title">제목</option>
<option value="bi_type">종류</option>
<option value="bi_star">별점</option>
</select>
<input type = "text" name = "searchStr"><button>검색</button>
</form>
<%
String sql="select bi.bi_num,bi.bi_image,bi.bi_title,bi.bi_desc,bi.bi_star,bi.bi_credat,";
sql+=" (select bt.bt_name from books_type bt where bt.bt_num = bi.bi_type) bi_type";
sql+=" from books_info bi";
if(search!=null){
	if("bi_title".equals(search)){
		sql += " where bi_title like ? ";
	}else if("bi_type".equals(search)){
		sql +=(" where bi_type like ? ");
	}else if("bi_star".equals(search)){
		sql +=(" where bi_star like ? ");
	}
}
Connection con = DBCon.getCon();
PreparedStatement ps = con.prepareStatement(sql);
if(search!=null){
	ps.setString(1,"%"+searchStr+"%");
}
ResultSet rs = ps.executeQuery();
while (rs.next()){
%>
<tr>
<td><%=rs.getString("bi_num")%></td>
<td><img src="<%=rootPath+rs.getString("bi_image")%>"width="100"></td>
<td><%=rs.getString("bi_title")%></td>
<td><%=rs.getString("bi_type")%></td>
<td><%=rs.getString("bi_star")%></td>
<td><%=rs.getString("bi_credat")%></td>
<td><%=rs.getString("bi_desc")%></td>
<td><a href="<%=rootPath%>/books/update.jsp?bi_num=<%=rs.getString("bi_num")%>"><button type="button">수정</button></a></td>
<td><a href="<%=rootPath%>/books/delete.jsp?bi_num=<%=rs.getString("bi_num")%>"><button type="button">삭제</button></a></td>
</tr>
<%} %>
</table>
<a href="<%=rootPath%>/books/insert.jsp"><button>글쓰기</button>
</body>
</html>