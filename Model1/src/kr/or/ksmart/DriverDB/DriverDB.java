package kr.or.ksmart.DriverDB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DriverDB {
	
	public Connection driverDb() throws ClassNotFoundException, SQLException {
		System.out.println("01_드라이버 로딩 및 DB 연결");
		
		Class.forName("com.mysql.jdbc.Driver");
		
		String jdbcDriver = "jdbc:mysql://localhost:3306/db14hhm?useUnicode=true&characterEncoding=euckr";
		String dbUser = "dbid14hhm";
		String dbPass = "dbpw14hhm";
		
		Connection connection = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		System.out.println(connection + "<-- connection");
		
		return connection;
	}
}