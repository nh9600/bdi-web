<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
public void test(JspWriter out)throws Exception{//이렇게 해줘야 메소드 호출 가능!
out.println("하하");
}
%>
<%
String num1 = request.getParameter("num1");
int result = 0;
if(num1!=null){
	int n1 = Integer.parseInt(num1);
	String num2 = request.getParameter("num2");
	int n2 = Integer.parseInt(num2);
	
	String op = request.getParameter("op");
	if(op==null){
		out.println("연산자는 null일 수 없습니다.");
	}else if("+".equals(op)){//스트링을 먼저 쓰는게 좋음
		out.println(n1+n2);
	}else if("-".equals(op)){
		out.println(n1-n2);
	}else if("*".equals(op)){
		out.println(n1*n2);
	}else if("/".equals(op)){
		out.println(n1/n2);
	}else{
		out.println("잘못된 연산자입니다.");
	}
%>
	<form>
		숫자1:<input type="number" name="num1" value="3">
		    <select name="op"><%----%>
			<option value="">선택</option>
			<option value="+">더하기</option>
			<option value="-">빼기</option>
			<option value="*">곱하기</option>
			<option value="/">나누기</option>
		</select> 숫자2:<input type="number" name="num2" value="4">
		=
		<input type="number" name="result" value="<%=result%>">
		<button>계산</button>
		<%--메서드 안에 메서드 안됨--%>
	</form>
</body>
</html>