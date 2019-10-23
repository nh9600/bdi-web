package com.bdi.test.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBCon {
	private static final String URL;
	private static final String ID;
	private static final String PWD;
	private static final String DRIVER_NAME;
	
	static {
		URL = "jdbc:oracle:thin:@localhost:1521:xe";
		ID = "bdi";
		PWD = "12345678";
		DRIVER_NAME = "oracle.jdbc.driver.OracleDriver";
		try {
			Class.forName(DRIVER_NAME);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	private static Connection con;
	public static Connection getCon() {
		if(con==null) {
			try {
				con = DriverManager.getConnection(URL,ID,PWD);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return con;//반드시 리턴해줘야함 
		
	}
	public static void main(String[] args) {
		getCon();
	}
}