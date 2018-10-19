package kr.or.ksmart.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.or.ksmart.DriverDB.DriverDB;
import kr.or.ksmart.DTO.GoodsDTO;

public class GoodsDAO {
	
	Connection connection = null;
	PreparedStatement preparedStatement = null;
	ResultSet resultSet = null;
	
	//��ǰ����� ���� g_code�� �ִ밪 ��ȸ �޼���
	public GoodsDTO selectGoodsForInsert(GoodsDTO goodsDto) throws ClassNotFoundException, SQLException {
		System.out.println("01_01 selectGoodsForInsert GoodsDAO.java");
		
		DriverDB driverDb = new DriverDB();
		connection = driverDb.driverDb();
		System.out.println(connection + "<-- connection");
		
		preparedStatement = connection.prepareStatement("SELECT MAX(CAST(SUBSTRING(g_code, 7) AS DECIMAL)) AS maxCode FROM tb_goods");

		resultSet = preparedStatement.executeQuery();
		
		int max1 = 0;
		
		String tempCode = "goods_";
		
		String g_code = "goods_1";
		
		if (resultSet.next()) {
			max1 = resultSet.getInt("maxCode");
			System.out.println(max1 + "<-- max1");
			
			int max2 = max1 + 1;
			System.out.println(max2 + "<-- max2");
			
			g_code = tempCode + max2;
		}
		
		System.out.println(g_code);
		
		goodsDto.setG_code(g_code);
		
		resultSet.close();
		preparedStatement.close();
		connection.close();
		
		return goodsDto;
	}
	
	//��ǰ��� �޼���
	public void insertGoods(GoodsDTO goodsDto) throws ClassNotFoundException, SQLException {
		System.out.println("01_02 insertGoods GoodsDAO.java");
		
		DriverDB driverDb = new DriverDB();
		connection = driverDb.driverDb();
		System.out.println(connection + "<-- connection");
		
		preparedStatement = connection.prepareStatement("INSERT INTO tb_goods VALUES (?, ?, ?, ?, ?, ?, ?, now(), ?)");
		preparedStatement.setString(1, goodsDto.getG_code());
		preparedStatement.setString(2, goodsDto.getU_id());
		preparedStatement.setString(3, goodsDto.getG_name());
		preparedStatement.setString(4, goodsDto.getG_cate());
		preparedStatement.setString(5, goodsDto.getG_price());
		preparedStatement.setString(6, goodsDto.getG_color());
		preparedStatement.setString(7, goodsDto.getG_size());
		preparedStatement.setString(8, goodsDto.getG_desc());

		preparedStatement.executeUpdate();
		
		preparedStatement.close();
		connection.close();
	}
	
	//��ǰ���� ������ ���� ��ǰ��ȸ �޼���
	public GoodsDTO selectGoodsForUpdate(String get_g_code) throws ClassNotFoundException, SQLException {
		System.out.println("02 selectGoodsForUpdate GoodsDAO.java");
		
		GoodsDTO goodsDto = new GoodsDTO();
		
		DriverDB driverDb = new DriverDB();
		connection = driverDb.driverDb();
		System.out.println(connection + "<-- connection");
		
		preparedStatement = connection.prepareStatement("SELECT g_code, u_id, g_name, g_cate, g_price, g_color, g_size, g_date, g_desc FROM tb_goods WHERE g_code = ?");
		preparedStatement.setString(1, get_g_code);
		
		resultSet = preparedStatement.executeQuery();
		
		if(resultSet.next()) {
			goodsDto.setG_code(resultSet.getString("g_code"));
			goodsDto.setU_id(resultSet.getString("u_id"));
			goodsDto.setG_name(resultSet.getString("g_name"));
			goodsDto.setG_cate(resultSet.getString("g_cate"));
			goodsDto.setG_price(resultSet.getString("g_price"));
			goodsDto.setG_color(resultSet.getString("g_color"));
			goodsDto.setG_size(resultSet.getString("g_size"));
			goodsDto.setG_date(resultSet.getString("g_date"));
			goodsDto.setG_desc(resultSet.getString("g_desc"));
		}
		
		resultSet.close();
		preparedStatement.close();
		connection.close();
		
		return goodsDto;
	}
	
	//��ǰ���� ���� �޼���
	public void updateGoods(GoodsDTO goodsDto) throws ClassNotFoundException, SQLException {
		System.out.println("03 updateGoods GoodsDAO.java");
		
		DriverDB driverDb = new DriverDB();
		connection = driverDb.driverDb();
		System.out.println(connection + "<-- connection");
		
		preparedStatement = connection.prepareStatement("UPDATE tb_goods SET g_name = ?, g_cate = ?, g_price = ?, g_color = ?, g_size = ?, g_date = now(), g_desc = ? WHERE g_code = ?");
		preparedStatement.setString(1, goodsDto.getG_name());
		preparedStatement.setString(2, goodsDto.getG_cate());
		preparedStatement.setString(3, goodsDto.getG_price());
		preparedStatement.setString(4, goodsDto.getG_color());
		preparedStatement.setString(5, goodsDto.getG_size());
		preparedStatement.setString(6, goodsDto.getG_desc());
		preparedStatement.setString(7, goodsDto.getG_code());
		
		preparedStatement.executeUpdate();
		
		preparedStatement.close();
		connection.close();
	}
	
	//��ǰ ���� �޼���
	public void deleteGoods(String get_g_code) throws ClassNotFoundException, SQLException {
		System.out.println("04 deleteGoods GoodsDAO.java");
		
		DriverDB driverDb = new DriverDB();
		connection = driverDb.driverDb();
		System.out.println(connection + "<-- connection");
		
		preparedStatement = connection.prepareStatement("DELETE FROM tb_goods WHERE g_code = ?");
		preparedStatement.setString(1, get_g_code);

		preparedStatement.executeUpdate();

		preparedStatement.close();
		connection.close();
	}
	
	//��ǰ����Ʈ �޼���
	public ArrayList<GoodsDTO> selectForList() throws ClassNotFoundException, SQLException{
		System.out.println("05 selectForList GoodsDAO.java");
		
		ArrayList<GoodsDTO> arrayListGoodsDto = new ArrayList<GoodsDTO>();
		
		DriverDB driverDb = new DriverDB();
		connection = driverDb.driverDb();
		System.out.println(connection + "<-- connection");
		
		preparedStatement = connection.prepareStatement("SELECT g_code, u_id, g_name, g_cate, g_price, g_color, g_size, g_date, g_desc FROM tb_goods");
		
		resultSet = preparedStatement.executeQuery();
		
		while(resultSet.next()){
			System.out.println(resultSet.getString("g_code") + "<-- g_code");
			System.out.println(resultSet.getString("u_id") + "<-- u_id");
			System.out.println(resultSet.getString("g_name") + "<-- g_name");
			System.out.println(resultSet.getString("g_cate") + "<-- g_cate");
			System.out.println(resultSet.getString("g_price") + "<-- g_price");
			System.out.println(resultSet.getString("g_color") + "<-- g_color");
			System.out.println(resultSet.getString("g_size") + "<-- g_size");
			System.out.println(resultSet.getString("g_date") + "<-- g_date");
			System.out.println(resultSet.getString("g_desc") + "<-- g_desc");
			
			GoodsDTO goodsDto = new GoodsDTO();
			goodsDto.setG_code(resultSet.getString("g_code"));
			goodsDto.setU_id(resultSet.getString("u_id"));
			goodsDto.setG_name(resultSet.getString("g_name"));
			goodsDto.setG_cate(resultSet.getString("g_cate"));
			goodsDto.setG_price(resultSet.getString("g_price"));
			goodsDto.setG_color(resultSet.getString("g_color"));
			goodsDto.setG_size(resultSet.getString("g_size"));
			goodsDto.setG_date(resultSet.getString("g_date"));
			goodsDto.setG_desc(resultSet.getString("g_desc"));
			arrayListGoodsDto.add(goodsDto);
		}
		
		resultSet.close();
		preparedStatement.close();
		connection.close();
		
		return arrayListGoodsDto;
	}
	
	//��ǰ�˻� �޼���
	public ArrayList<GoodsDTO> selectForSearch(String searchKey, String searchValue) throws ClassNotFoundException, SQLException{
		System.out.println("06 selectForSearch GoodsDAO.java");
		
		ArrayList<GoodsDTO> arrayListGoodsDto = new ArrayList<GoodsDTO>();
		
		DriverDB driverDb = new DriverDB();
		connection = driverDb.driverDb();
		System.out.println(connection + "<-- connection");
		
		if(searchKey == null & searchValue == null){
			System.out.println("01����_sk null sv null");
			preparedStatement = connection.prepareStatement("SELECT g_code, u_id, g_name, g_cate, g_price, g_color, g_size, g_date, g_desc FROM tb_goods");
		
		}else if(searchKey != null & searchValue.equals("")){
			System.out.println("02����_sk �ְ� sv ����");
			preparedStatement = connection.prepareStatement("SELECT g_code, u_id, g_name, g_cate, g_price, g_color, g_size, g_date, g_desc FROM tb_goods");
		
		}else if(searchKey != null & searchValue != null){
			System.out.println("03����_�Ѵ� ���� �ִ�");
			if(searchKey.equals("g_code")){
				System.out.println("03_01 g_code ����");
				preparedStatement = connection.prepareStatement("SELECT g_code, u_id, g_name, g_cate, g_price, g_color, g_size, g_date, g_desc FROM tb_goods WHERE g_code = ?");
				preparedStatement.setString(1, searchValue);
			}else if(searchKey.equals("u_id")){
				System.out.println("03_02 u_id ����");
				preparedStatement = connection.prepareStatement("SELECT g_code, u_id, g_name, g_cate, g_price, g_color, g_size, g_date, g_desc FROM tb_goods WHERE u_id = ?");
				preparedStatement.setString(1, searchValue);
			}else if(searchKey.equals("g_name")){
				System.out.println("03_03 g_name ����");
				preparedStatement = connection.prepareStatement("SELECT g_code, u_id, g_name, g_cate, g_price, g_color, g_size, g_date, g_desc FROM tb_goods WHERE g_name = ?");
				preparedStatement.setString(1, searchValue);
			}else if(searchKey.equals("g_cate")){
				System.out.println("03_04 g_cate ����");
				preparedStatement = connection.prepareStatement("SELECT g_code, u_id, g_name, g_cate, g_price, g_color, g_size, g_date, g_desc FROM tb_goods WHERE g_cate = ?");
				preparedStatement.setString(1, searchValue);
			}else if(searchKey.equals("g_price")){
				System.out.println("03_05 g_price ����");
				preparedStatement = connection.prepareStatement("SELECT g_code, u_id, g_name, g_cate, g_price, g_color, g_size, g_date, g_desc FROM tb_goods WHERE g_price = ?");
				preparedStatement.setString(1, searchValue);
			}else if(searchKey.equals("g_color")){
				System.out.println("03_06 g_color ����");
				preparedStatement = connection.prepareStatement("SELECT g_code, u_id, g_name, g_cate, g_price, g_color, g_size, g_date, g_desc FROM tb_goods WHERE g_color = ?");
				preparedStatement.setString(1, searchValue);
			}else if(searchKey.equals("g_size")){
				System.out.println("03_07 g_size ����");
				preparedStatement = connection.prepareStatement("SELECT g_code, u_id, g_name, g_cate, g_price, g_color, g_size, g_date, g_desc FROM tb_goods WHERE g_size = ?");
				preparedStatement.setString(1, searchValue);
			}else if(searchKey.equals("g_date")){
				System.out.println("03_08 g_date ����");
				preparedStatement = connection.prepareStatement("SELECT g_code, u_id, g_name, g_cate, g_price, g_color, g_size, g_date, g_desc FROM tb_goods WHERE g_date = ?");
				preparedStatement.setString(1, searchValue);
			}else if(searchKey.equals("g_desc")){
				System.out.println("03_09 g_desc ����");
				preparedStatement = connection.prepareStatement("SELECT g_code, u_id, g_name, g_cate, g_price, g_color, g_size, g_date, g_desc FROM tb_goods WHERE g_desc=?");
				preparedStatement.setString(1, searchValue);
			}
		}
		
		resultSet = preparedStatement.executeQuery();
		
		while(resultSet.next()){
			System.out.println(resultSet.getString("g_code") + "<-- g_code");
			System.out.println(resultSet.getString("u_id") + "<-- u_id");
			System.out.println(resultSet.getString("g_name") + "<-- g_name");
			System.out.println(resultSet.getString("g_cate") + "<-- g_cate");
			System.out.println(resultSet.getString("g_price") + "<-- g_price");
			System.out.println(resultSet.getString("g_color") + "<-- g_color");
			System.out.println(resultSet.getString("g_size") + "<-- g_size");
			System.out.println(resultSet.getString("g_date") + "<-- g_date");
			System.out.println(resultSet.getString("g_desc") + "<-- g_desc");
			
			GoodsDTO goodsDto = new GoodsDTO();
			goodsDto.setG_code(resultSet.getString("g_code"));
			goodsDto.setU_id(resultSet.getString("u_id"));
			goodsDto.setG_name(resultSet.getString("g_name"));
			goodsDto.setG_cate(resultSet.getString("g_cate"));
			goodsDto.setG_price(resultSet.getString("g_price"));
			goodsDto.setG_color(resultSet.getString("g_color"));
			goodsDto.setG_size(resultSet.getString("g_size"));
			goodsDto.setG_date(resultSet.getString("g_date"));
			goodsDto.setG_desc(resultSet.getString("g_desc"));
			arrayListGoodsDto.add(goodsDto);
		}
		
		resultSet.close();
		preparedStatement.close();
		connection.close();
		
		return arrayListGoodsDto;
	}
	
	//��ǰ������ �޼���
	public GoodsDTO selectGoodsDetail(String get_g_code) throws ClassNotFoundException, SQLException {
		System.out.println("07 selectGoodsDetail GoodsDAO.java");
		
		GoodsDTO goodsDto = new GoodsDTO();
		
		DriverDB driverDb = new DriverDB();
		connection = driverDb.driverDb();
		System.out.println(connection + "<-- connection");
		
		preparedStatement = connection.prepareStatement("SELECT g_code, u_id, g_name, g_cate, g_price, g_color, g_size, g_date, g_desc FROM tb_goods WHERE g_code = ?");
		preparedStatement.setString(1, get_g_code);
		
		resultSet = preparedStatement.executeQuery();
		
		if(resultSet.next()) {
			goodsDto.setG_code(resultSet.getString("g_code"));
			goodsDto.setU_id(resultSet.getString("u_id"));
			goodsDto.setG_name(resultSet.getString("g_name"));
			goodsDto.setG_cate(resultSet.getString("g_cate"));
			goodsDto.setG_price(resultSet.getString("g_price"));
			goodsDto.setG_color(resultSet.getString("g_color"));
			goodsDto.setG_size(resultSet.getString("g_size"));
			goodsDto.setG_date(resultSet.getString("g_date"));
			goodsDto.setG_desc(resultSet.getString("g_desc"));
		}
		
		resultSet.close();
		preparedStatement.close();
		connection.close();
		
		return goodsDto;
	}
}