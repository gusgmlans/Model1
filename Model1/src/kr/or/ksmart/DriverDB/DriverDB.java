package kr.or.ksmart.DriverDB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DriverDB {
	
	public Connection driverDb() throws ClassNotFoundException, SQLException {
		System.out.println("01_����̹� �ε� �� DB ����");
		
		Class.forName("com.mysql.jdbc.Driver");
		
		String jdbcDriver = "jdbc:mysql://localhost:3306/gusgmlans?useUnicode=true&characterEncoding=euckr";
		String dbUser = "gusgmlans";
		String dbPass = "qudtls78!!@@";
		
		Connection connection = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		System.out.println(connection + "<-- connection");
		
		return connection;
	}
}