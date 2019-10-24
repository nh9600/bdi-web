package com.bdi.test;

public class SplitTest {
	public static void main(String[]args) {
		String hobby = "study,movie,game";//사용자가 구분자를 입력
		String[] hobbies = hobby.split(",");
		String hob1 = "study";
		System.out.println(hobbies.length);//방3개
		System.out.println(hobbies[0]);//study
		System.out.println(hobbies[1]);//movie
		/*
		 * for(int i=0;i<hobbies.length;i++) { 
		 * System.out.println(hobbies[i]); }
		 */
		for(String str:hobbies) {//hobbies안에 있는 값을 다 뽑아내
			if(str.equals(hob1))//hob1과 비교
			//study와 study비교 = ture니까 checked 출력 	
			//movie와 study비교
			//game과 study비교
			System.out.println("checked");//ArrayList할땐 이걸 많이 씀
			break;//값이 맞으면 끝
		}
	}

}
