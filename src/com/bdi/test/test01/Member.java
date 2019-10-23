package com.bdi.test.test01;

import java.util.HashMap;
import java.util.Map;

public class Member {//매번 같은 일을 하기 귀찮으니까 메소드를 만드는 것 
	//내가 정의한 함수 = 사용자 정의 함수
	//static,접근제어자 안써도 가능
	int a; // 얘는 접근제어자를 안써줬으니까 디폴트, 그렇다고 default를 써주면 안됨! 그것은 인터페이스에서만 가능
	public String test(int a) {//오버로딩이 된건 맞지만 static을 안써줘서 메인메소드에 생성자를 만들어줘야함
		return "";
	}
	public static String test() {
		String str = "abc";//클래스 안에 안에 호출됐기때문에 접근제어자 안붙음
		String str1 = "bbc";
		return str;//리턴해줘야함 
	}
	//public static void neker(Map<String,String> map) {	
	//}
	//public static void test(Map<String,String> map) {//1.test(Map<String,String> map
		//똑같은 파라메터와 map을 써져워함 
		//test를 호출하려면 map이라고 부를 수 있는걸 넣어줘야함
	//	map.put("a","b");
	//	int a = map.size();
	//	System.out.println(map);
	//	neker(map);//2.
		//맵이 있기때문에 put,get 모두 가능
	//}
	
	public static void main(String[]args) {
		//Map<String,String> map = new HashMap<String,String>();//맵을 만들어주고
		//test(map);
		final String str = test();
		str.equals("abc");
		
		
		//static 안에서는 비static애들을 쓸 수 없음 
		//그래서 비static애들은 생성자를 만들어줘야 사용할 수 있음 
		
	}

}
