<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><%--html:문서(document 제일 짱,윈도우꺼)--%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
숫자1:<input type="number" id="num1"><%--name을 써야지만 key값이 됨(form태그)--%>
+
숫자2:<input type="number" id="num2"><%--id는 중복되면 안됨(중복돼도 에러가 안나는 이유는 자바스크립트니까^^--%>
<button onclick="calc();">계산하기</button><%--버튼을 누루면 날 호출했군이 뜸--%>
<%--'on'붙으면 모두 이벤트(클릭이벤트(클릭했을때 무엇가가 발생하는 시스템))--%>
<%--메소드=void,그 외에 것 --%>
<script>
//calc();여기서도 사용할 수 있음
function calc(){//데이터 타입을 쓰면 에러남
	var n1 = document.getElementById("num1");//아이디가 num1인 데이터를 가져와라
	var n2 = document.getElementById("num2");
	alert(parseInt(n1.value)+parseInt(n2.value));//웹에서 쓴 숫자가 알림
	//parseInt앞에 Integer가 생략된 것
	//스크립트에서 하면 안되는 것
	//1.돈과 관련된 모든 것(돈처럼 사용할 수 있는것(포인트 포함))
	//2.회원가입 
	alert(n1+n2);
	alert(n1==n2);
}//함수의 선언!

</script>
</body>
</html>