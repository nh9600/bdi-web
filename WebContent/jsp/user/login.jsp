<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bdi.test.common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><%--내가 누구인지 밝힘 --%>
<%--1차적인 방어 = ''--%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
if(id!=null){
	String sql="select * from user_info where ui_id=? and ui_pwd=?";//첫번째 물음표에 아이디 대입해
	Connection con = DBCon.getCon();//전화걸어
	PreparedStatement ps = con.prepareStatement(sql);//sql(select)을 먼저 머리속에 집어넣음
	ps.setString(1,id);//첫번째 물음표에 아이디 셋팅해줘
	ps.setString(2,pwd);//두번째에 물음표에 비밀번호 셋팅해줘
	//물음표가 싱글코트까지 해줌
	ResultSet rs = ps.executeQuery();
	if(rs.next()){//한번만 돌릴거니까 if
		out.println(rs.getString("ui_name")+"님 안녕하세요~");
	}else
		out.println("야... 아이디 비번 잘못입력했다~");
}
%>
<form method = "post" id="loginForm" action="/bdi/jsp/user/login-ok.jsp"><%--겟방식은 url이 바뀌는데 포스트방식는 바뀌지 않는다--%>
아이디:<input type = "text" name = "id" id="id"><br><%--아이디를 아이디라는 스트링으로 만듦 --%>
비밀번호:<input type = "password" name = "pwd" id="pwd"><br><%--아이디를 pwd라는 스트링으로 만듦 --%>
<button type="button"onclick="login()">로그인</button><%--버튼은 알아서 서브밋을 했는데 타입을 버튼으로 두면 아님--%>
</form>
<script>

function login(){//DOM(Document Object Model)
	//alert("아 로그인버튼을 클릭했군!");window.alert앞에 아무것도 없으면 윈도우꺼(기본적으로 윈도우가 가지고 있는것)
	var idObj = document.getElementById("id");//아이디가 아이디인 것을 찾고
	//스트링 엘레멘트(배열),ById=Id가져와줄래?, var=가변,인자값=메소드를 호출할때 들어가야하는 값(id)
    //alert(idObj.value);//로그인 값이 무엇인지,idobj.value(밸류는 속성)
    var id = idObj.value;//idObj의 값을 id의 저장
    var pwdObj = document.getElementById("pwd");//아이디가 pwd인 것을 찾고
    //alert(pwdObj.value);
    var pwd = pwdObj.value;//pwdObj의 value를 pwd의 저장
    alert(id.length);//아이디 길이 출력
    alert(pwd.length);
    
    if(id.length<5){//
    	alert("id는 5글자 이상 입력해야 합니다.");
    	idObj.value="";//idObj값을 빈문자열로 초기화 시킴
    	idObj.focus();//아이디란에 커서(초점이 맞춰짐)
     	return;//밑에 것까지 실행할 필요가 없으니까 해당 메소드를 나감
    }
    if(pwd.length<5){
    	alert("pwd는 5글자 이상 입력해야 합니다.");
    	idObj.value="";
    	idObj.focus();
    	return;
    }
    var loginForm = document.getElementById("loginForm");
    loginForm.submit();//loginForm안에 있는 값을 가져와서 서브밋(전송),폼태그에 액션값을 줬으니까 넘어감
    //alert("로그인 로직 정상적으로 타야함");
}//33번줄
//windos.onload=function(){//윈도우가 로드될때(이벤트)
//document.getElementById("id").value="haneul";
//}
//login();function login에 귀속(앞에 아무것도 없으니까 윈도우꺼)
</script>
</body>
</html>