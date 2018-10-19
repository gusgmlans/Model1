package kr.or.ksmart.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.or.ksmart.DriverDB.DriverDB;
import kr.or.ksmart.DTO.UserDTO;

public class UserDAO {
	
	Connection connection = null;
	PreparedStatement preparedStatement = null;
	ResultSet resultSet = null;
	
	//회원가입 메서드
	public void insertUser(UserDTO userDto) throws ClassNotFoundException, SQLException {
		System.out.println("01 insertUser UserDAO.java");
		
		DriverDB driverDb = new DriverDB();
		connection = driverDb.driverDb();
		System.out.println(connection + "<-- connection");
		
		preparedStatement = connection.prepareStatement("INSERT INTO tb_user VALUES (?, ?, ?, ?, ?, ?, ?)");
		
		preparedStatement.setString(1, userDto.getU_id());
		preparedStatement.setString(2, userDto.getU_pw());
		preparedStatement.setString(3, userDto.getU_level());
		preparedStatement.setString(4, userDto.getU_name());
		preparedStatement.setString(5, userDto.getU_email());
		preparedStatement.setString(6, userDto.getU_phone());
		preparedStatement.setString(7, userDto.getU_addr());
		
		preparedStatement.executeUpdate();
		
		preparedStatement.close();
		connection.close();
	}
	
	//회원정보수정을 위한 조회 메서드
	public UserDTO selectUserForUpdate(String get_id) throws ClassNotFoundException, SQLException {
		System.out.println("02_01 selectUserForUpdate UserDAO.java");
		
		UserDTO userDto = new UserDTO();
		
		DriverDB driverDb = new DriverDB();
		connection = driverDb.driverDb();
		System.out.println(connection + "<-- connection");
		
		preparedStatement = connection.prepareStatement("SELECT u_id, u_pw, u_level, u_name, u_email, u_phone, u_addr FROM tb_user WHERE u_id = ?");
		preparedStatement.setString(1, get_id);

		resultSet = preparedStatement.executeQuery();

		if (resultSet.next()) {
			userDto.setU_id(resultSet.getString("u_id"));
			userDto.setU_pw(resultSet.getString("u_pw"));
			userDto.setU_level(resultSet.getString("u_level"));
			userDto.setU_name(resultSet.getString("u_name"));
			userDto.setU_email(resultSet.getString("u_email"));
			userDto.setU_phone(resultSet.getString("u_phone"));
			userDto.setU_addr(resultSet.getString("u_addr"));
		}
		
		resultSet.close();
		preparedStatement.close();
		connection.close();
		
		return userDto;
	}
	
	//회원정보수정 메서드
	public void updateUser(UserDTO userDto) throws ClassNotFoundException, SQLException {
		System.out.println("02_02 updateUser UserDAO.java");
		
		DriverDB driverDb = new DriverDB();
		connection = driverDb.driverDb();
		System.out.println(connection + "<-- connection");
		
		preparedStatement = connection.prepareStatement("UPDATE tb_user SET u_pw=?,u_level=?,u_name=?,u_email=?,u_phone=?,u_addr=? WHERE u_id=?");
		preparedStatement.setString(1, userDto.getU_pw());
		preparedStatement.setString(2, userDto.getU_level());
		preparedStatement.setString(3, userDto.getU_name());
		preparedStatement.setString(4, userDto.getU_email());
		preparedStatement.setString(5, userDto.getU_phone());
		preparedStatement.setString(6, userDto.getU_addr());
		preparedStatement.setString(7, userDto.getU_id());
		
		preparedStatement.executeUpdate();
		
		preparedStatement.close();
		connection.close();
	}
	
	//회원삭제 메서드
	public void deleteUser(String get_id) throws ClassNotFoundException, SQLException {
		System.out.println("03 deleteUser UserDAO.java");
		
		DriverDB driverDb = new DriverDB();
		connection = driverDb.driverDb();
		System.out.println(connection + "<-- connection");
		
		preparedStatement = connection.prepareStatement("DELETE FROM tb_user WHERE u_id = ?");
		preparedStatement.setString(1, get_id);

		preparedStatement.executeUpdate();
		
		preparedStatement.close();
		connection.close();
	}
	
	//회원상세정보 조회 메서드
	public UserDTO selectUserForDetail(String get_id) throws ClassNotFoundException, SQLException {
		System.out.println("04 selectUserForDetail UserDAO.java");
		
		UserDTO userDto = new UserDTO();
		
		DriverDB driverDb = new DriverDB();
		connection = driverDb.driverDb();
		System.out.println(connection + "<-- connection");
		
		preparedStatement = connection.prepareStatement("SELECT u_id, u_pw, u_level, u_name, u_email, u_phone, u_addr FROM tb_user WHERE u_id = ?");
		preparedStatement.setString(1, get_id);

		resultSet = preparedStatement.executeQuery();
		
		if(resultSet.next()) {
			userDto.setU_id(resultSet.getString("u_id"));
			userDto.setU_pw(resultSet.getString("u_pw"));
			userDto.setU_level(resultSet.getString("u_level"));
			userDto.setU_name(resultSet.getString("u_name"));
			userDto.setU_email(resultSet.getString("u_email"));
			userDto.setU_phone(resultSet.getString("u_phone"));
			userDto.setU_addr(resultSet.getString("u_addr"));
		}
		
		resultSet.close();
		preparedStatement.close();
		connection.close();
		
		return userDto;
	}
	
	//회원리스트 메서드
	public ArrayList<UserDTO> selectUserForList() throws ClassNotFoundException, SQLException{
		System.out.println("05 selectUserForList UserDAO.java");
		
		ArrayList<UserDTO> arrayListUserDto = new ArrayList<UserDTO>();
		
		DriverDB driverDb = new DriverDB();
		connection = driverDb.driverDb();
		System.out.println(connection + "<-- connection");
		
		preparedStatement = connection.prepareStatement("SELECT u_id, u_pw, u_level, u_name, u_email, u_phone, u_addr FROM tb_user");
		
		resultSet = preparedStatement.executeQuery();
		
		while(resultSet.next()) {
			System.out.println(resultSet.getString("u_id") + "<-- u_id");
			System.out.println(resultSet.getString("u_pw") + "<-- u_pw");
			System.out.println(resultSet.getString("u_level") + "<-- u_level");
			System.out.println(resultSet.getString("u_name") + "<-- u_name");
			System.out.println(resultSet.getString("u_email") + "<-- u_email");
			System.out.println(resultSet.getString("u_phone") + "<-- u_phone");
			System.out.println(resultSet.getString("u_addr") + "<-- u_addr");
			
			UserDTO UserDto = new UserDTO();
			
			UserDto.setU_id(resultSet.getString("u_id"));
			UserDto.setU_pw(resultSet.getString("u_pw"));
			UserDto.setU_level(resultSet.getString("u_level"));
			UserDto.setU_name(resultSet.getString("u_name"));
			UserDto.setU_email(resultSet.getString("u_email"));
			UserDto.setU_phone(resultSet.getString("u_phone"));
			UserDto.setU_addr(resultSet.getString("u_addr"));
			arrayListUserDto.add(UserDto);
		}
		
		resultSet.close();
		preparedStatement.close();
		connection.close();
		
		return arrayListUserDto;
	}
	
	//회원검색 메서드
	public ArrayList<UserDTO> selectUserForSearch(String searchKey, String searchValue) throws ClassNotFoundException, SQLException{
		System.out.println("06 selectUserForSearch UserDAO.java");
		
		ArrayList<UserDTO> arrayListUserDto = new ArrayList<UserDTO>();
		
		DriverDB driverDb = new DriverDB();
		connection = driverDb.driverDb();
		System.out.println(connection + "<-- connection");
		
		if(searchKey == null & searchValue == null){
			
			preparedStatement = connection.prepareStatement("SELECT u_id, u_pw, u_level, u_name, u_email, u_phone, u_addr FROM tb_user");
			System.out.println(preparedStatement + "<-- preparedStatement");
			
		}else if(searchKey != null & searchValue.equals("")){
			
			preparedStatement = connection.prepareStatement("SELECT u_id, u_pw, u_level, u_name, u_email, u_phone, u_addr FROM tb_user");
			System.out.println(preparedStatement + "<-- preparedStatement");
			
		}else if(searchKey != null & searchValue != null){
			
			if(searchKey.equals("u_id")){
				
				preparedStatement = connection.prepareStatement("SELECT u_id, u_pw, u_level, u_name, u_email, u_phone, u_addr FROM tb_user WHERE u_id = ?");
				preparedStatement.setString(1, searchValue);
				System.out.println(preparedStatement + "<-- preparedStatement");
				
			}else if(searchKey.equals("u_level")){
				
				preparedStatement = connection.prepareStatement("SELECT u_id, u_pw, u_level, u_name, u_email, u_phone, u_addr FROM tb_user WHERE u_level = ?");
				preparedStatement.setString(1, searchValue);
				System.out.println(preparedStatement + "<-- preparedStatement");
				
			}else if(searchKey.equals("u_name")){
				
				preparedStatement = connection.prepareStatement("SELECT u_id, u_pw, u_level, u_name, u_email, u_phone, u_addr FROM tb_user WHERE u_name = ?");
				preparedStatement.setString(1, searchValue);
				System.out.println(preparedStatement + "<-- preparedStatement");
				
			}else if(searchKey.equals("u_email")){
				
				preparedStatement = connection.prepareStatement("SELECT u_id, u_pw, u_level, u_name, u_email, u_phone, u_addr FROM tb_user WHERE u_email = ?");
				preparedStatement.setString(1, searchValue);
				System.out.println(preparedStatement + "<-- preparedStatement");
				
			}else if(searchKey.equals("u_phone")){
				
				preparedStatement = connection.prepareStatement("SELECT u_id, u_pw, u_level, u_name, u_email, u_phone, u_addr FROM tb_user WHERE u_phone = ?");
				preparedStatement.setString(1, searchValue);
				System.out.println(preparedStatement + "<-- preparedStatement");
				
			}else if(searchKey.equals("u_addr")){
				
				preparedStatement = connection.prepareStatement("SELECT u_id, u_pw, u_level, u_name, u_email, u_phone, u_addr FROM tb_user WHERE u_addr = ?");
				preparedStatement.setString(1, searchValue);
				System.out.println(preparedStatement + "<-- preparedStatement");
			}
		}
		
		resultSet = preparedStatement.executeQuery();
		
		while(resultSet.next()) {
			System.out.println(resultSet.getString("u_id") + "<-- u_id");
			System.out.println(resultSet.getString("u_pw") + "<-- u_pw");
			System.out.println(resultSet.getString("u_level") + "<-- u_level");
			System.out.println(resultSet.getString("u_name") + "<-- u_name");
			System.out.println(resultSet.getString("u_email") + "<-- u_email");
			System.out.println(resultSet.getString("u_phone") + "<-- u_phone");
			System.out.println(resultSet.getString("u_addr") + "<-- u_addr");
			
			UserDTO UserDto = new UserDTO();
			
			UserDto.setU_id(resultSet.getString("u_id"));
			UserDto.setU_pw(resultSet.getString("u_pw"));
			UserDto.setU_level(resultSet.getString("u_level"));
			UserDto.setU_name(resultSet.getString("u_name"));
			UserDto.setU_email(resultSet.getString("u_email"));
			UserDto.setU_phone(resultSet.getString("u_phone"));
			UserDto.setU_addr(resultSet.getString("u_addr"));
			arrayListUserDto.add(UserDto);
		}
		
		resultSet.close();
		preparedStatement.close();
		connection.close();
		
		return arrayListUserDto;
	}
	
	//로그인 메서드
	//리턴 값 = 1 : 로그인 성공, 2 : 아이디 불일치, 3 : 비밀번호 불일치
	public int selectUserForLogin(String id, String pw) throws ClassNotFoundException, SQLException {
		System.out.println("07 selectUserForLogin UserDAO.java");
		
		int loginCheck = 0;
		
		DriverDB driverDb = new DriverDB();
		connection = driverDb.driverDb();
		System.out.println(connection + "<-- connection");
		
		preparedStatement = connection.prepareStatement("SELECT u_id, u_pw, u_level, u_name FROM tb_user WHERE u_id = ?");
		preparedStatement.setString(1, id);

		resultSet = preparedStatement.executeQuery();
		
		if(resultSet.next()){
			//아이디 일치
			if(pw.equals(resultSet.getString("u_pw"))){
				//로그인 성공
				loginCheck = 1;
			}else{
				//비밀번호 불일치
				loginCheck = 3;
			}
		}else{
			//아이디 불일치
			loginCheck = 2;
		}
		
		resultSet.close();
		preparedStatement.close();
		connection.close();
		
		return loginCheck;
	}
	
	//로그인 세션 메서드
	public UserDTO selectUserForSession(String id) throws ClassNotFoundException, SQLException {
		System.out.println("08 selectUserForSession UserDAO.java");
		
		UserDTO userDto = new UserDTO();
		
		DriverDB driverDb = new DriverDB();
		connection = driverDb.driverDb();
		System.out.println(connection + "<-- connection");
		
		preparedStatement = connection.prepareStatement("SELECT u_id, u_pw, u_level, u_name, u_email, u_phone, u_addr FROM tb_user WHERE u_id = ?");
		preparedStatement.setString(1, id);

		resultSet = preparedStatement.executeQuery();
		
		if(resultSet.next()) {
			userDto.setU_id(resultSet.getString("u_id"));
			userDto.setU_pw(resultSet.getString("u_pw"));
			userDto.setU_level(resultSet.getString("u_level"));
			userDto.setU_name(resultSet.getString("u_name"));
			userDto.setU_email(resultSet.getString("u_email"));
			userDto.setU_phone(resultSet.getString("u_phone"));
			userDto.setU_addr(resultSet.getString("u_addr"));
		}
		
		resultSet.close();
		preparedStatement.close();
		connection.close();
		
		return userDto;
	}
}