<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
Connection con = DBCon.getCon();
String sql="insert into lotto(seq,num1,num2,num3,num4,num5,num6)";
sql+="values(sep.nextval,?,?,?,?,?,?)";
PreparedStatement ps = con.prepareStatement(sql);
List<Integer> list = new ArrayList<Integer>();
		Random ran = new Random();
		for(int i=0;i<6;i++) {
			int rNum = ran.nextInt(45)+1;
			if(list.indexOf(rNum)==-1) {
				list.add(rNum);
			}else {
				i--;
			}
		}
		ps.setInt(1,list.get(0));
		ps.setInt(2,list.get(1));
		ps.setInt(3,list.get(2));
		ps.setInt(4,list.get(3));
		ps.setInt(5,list.get(4));
		ps.setInt(6,list.get(5));
		
		int result = ps.executeUpdate();
		if(result==1){
			out.println("로또 번호 생성 완료");
			con.commit();
		}

%>
<a href="/bdi-web/jsp/lotto/lotto.jsp"><button>회차 리스트로 가기</button></a>
</body>
</html>