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

	<form>
		숫자1:<input type="number" name="num1" value="3">
		    <select name="op"><%----%>
			<option value="">선택</option>
			<option value="+">더하기</option>
			<option value="-">빼기</option>
			<option value="*">곱하기</option>
			<option value="/">나누기</option>
		</select> 숫자2:<input type="number" name="num2" value="4">
		<button>계산</button>

	</form>
</body>
</html>