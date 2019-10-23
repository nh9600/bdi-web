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
<form>
<select name="search">
<option value="ui_name">이름</option>
<option value="ui_id">아이디</option>
<option value="ui_age">나이</option>
</select> : <input type="text"name="searchStr"><button>검색</button>
</form>
<table border="1">
<tr>
<th>번호</th>
<th>아이디</th>
<th>비밀번호</th>
<th>이름</th>
<th>나이</th>
<th>비고</th>
<th>취미</th>
</tr>
<%//get 조회,post
String search = request.getParameter("search");
String searchStr = request.getParameter("searchStr");
String uiId = request.getParameter("ui_id");
String sql="select * from user_info ";
if(search!=null){
	if("ui_name".equals(search)){
		sql+=" where ui_name like? ";
	}else if("ui_id".equals(search)){
		sql+=" where ui_id like? ";
	}else if("ui_age".equals(search)){
		sql+=" where ui_age like? ";
	}
	//sql+="where ui_id=?"; 
}
sql+=" order by ui_num desc";//order by는 무조건 마지막에 붙여아함
Connection con = DBCon.getCon();
PreparedStatement ps = con.prepareStatement(sql);
if(search!=null){
	ps.setString(1,"%"+searchStr+"%");//like에 붙음
	//ps.setString(1,uiId);//첫번째 물음표에 값을 집어넣어 
}
ResultSet rs = ps.executeQuery();
while(rs.next()){ 
	out.println("<tr>");
	out.println("<td>"+rs.getString("ui_num")+"</td>");
	out.println("<td><a href=\"/bdi-web/jsp/user/user-update.jsp?ui_num="+rs.getString("ui_num")+"\">"+rs.getString("ui_id")+"</td>");
	out.println("<td>"+rs.getString("ui_pwd")+"</td>");
	out.println("<td>"+rs.getString("ui_name")+"</td>");
	out.println("<td>"+rs.getString("ui_age")+"</td>");
	out.println("<td>"+rs.getString("ui_etc")+"</td>");
	out.println("<td>"+rs.getString("hobby")+"</td>");
	out.println("</tr>");
}
%>
</table>
</body>
</html>