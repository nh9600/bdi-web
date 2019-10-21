package com.bdi.test.test01;

class Mother{
	static {//static영역은 한번만 실행
		System.out.println(5);
	}
	Mother(){
		System.out.println(1);
	}
	Mother(int a){
		System.out.println(2);
	}
}
public class MethodTest extends Mother {
	MethodTest(){//슈퍼가 생략된 것
		//반드시 한번은 실행하는데 다시는 실행하지 않음 
		System.out.println(3);
	}
	MethodTest(int a){
		System.out.println(4);
	}
	
	public static void main(String[]args) {
		Mother m = new MethodTest();
		//상속받고 있기때문에 실행할 수 있는 것
		
		MethodTest mt = new MethodTest();

		
		//파라메터의 개수나, 데이터 타입이 달라야 오버로딩할 수 있다.
		//오버로딩을 사용하는 이유: 보기 편해서 
		//같은 메소드 이름으로 사용하기때문에 알아보기 쉽다.
		//아빠가 가진 접근제어자보다 더 작게는 안됨(보통 똑같은 접근제어자 사용)
		//변수는 각각에 것(이건 오버라이딩 개념이 아님)
		//MethodTest mt = new MethodTest()메소드테스트 데이터 타입이니까 메소드테스트 안에 있는 변수가 읽힘
		//오버라이딩이 된 것처럼 보이지만 착각이다 그냥 메소드테스트 생성자를 만들었기때문에 그 안에 있는 변수가 읽힌것 뿐..
		//Mother mt = new MethodTest();라면 엄마꺼 먼저 실행하고 아들꺼 실행
	}

}
