<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Map<String,String[]> paramMap = request.getParameterMap();//키는 스트링, 밸류는 배열
Iterator<String> it = paramMap.keySet().iterator();
while(it.hasNext()){
	String key = it.next();
	String[] values = paramMap.get(key);
	out.println("key["+key+"]:");
	for(int i=0;i<values.length;i++){
		out.println(values[i]+",");
	}
	out.println();
}
%>