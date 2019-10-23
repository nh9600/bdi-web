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
String str = "abce";
String uiNum = "1";
out.println("<table border=1>");
out.println("<tr>");
out.println("<td><a href=\"uiNum=" +  uiNum + "\">" +str+ "</a></td>");
out.println("</tr>");
out.println("</table>");

out.println("<td>+str+</td>");
%>
</body>
</html>