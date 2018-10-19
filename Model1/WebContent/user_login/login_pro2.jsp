<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>

<!DOCTYPE html>

<%
	Connection connection = null;
	PreparedStatement preparedStatement = null;
	ResultSet resultSet = null;
	
	request.setCharacterEncoding("EUC-KR");
	
	String id = request.getParameter("id");	
	String pw = request.getParameter("pw");
	System.out.println(id + "<-- id");
	System.out.println(pw + "<-- pw");
	
	Class.forName("com.mysql.jdbc.Driver");
	
	String jdbcDriver = "jdbc:mysql://localhost:3306/db14hhm?useUnicode=true&characterEncoding=euckr";
	String dbUser = "dbid14hhm";
	String dbPass = "dbpw14hhm";
	
	connection = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
	System.out.println(connection + "<-- connection");
	
	preparedStatement = connection.prepareStatement("SELECT u_id, u_pw, u_level, u_name FROM tb_user WHERE u_id = ?");
	preparedStatement.setString(1, id);
	System.out.println(preparedStatement + "<-- preparedStatement");
	
	resultSet = preparedStatement.executeQuery();
	System.out.println("preparedStatement.executeQuery");
	
	if(resultSet.next()){
		System.out.println("���̵� ��ġ");
		String dbId = resultSet.getString("u_id");
		String dbPw = resultSet.getString("u_pw");
		String dbLevel = resultSet.getString("u_level");
		String dbName = resultSet.getString("u_name");
		
		if(pw.equals(dbPw)){
			System.out.println("�α��� ����");
			
			session.setAttribute("S_ID", dbId);
			session.setAttribute("S_LEVEL", dbLevel);
			session.setAttribute("S_NAME", dbName);
%>	
			<script type="text/javascript">
				alert('�α��� ����');
				location.href = '<%=request.getContextPath()%>/index.jsp';
			</script>
<%
		}else{
			System.out.println("��й�ȣ ����ġ");
%>
			<script type="text/javascript">
				alert('��й�ȣ ����ġ');
				location.href = '<%=request.getContextPath()%>/index.jsp';
			</script>
<%
		}
	}else{
		System.out.println("���̵� ����ġ");
%>
		<script type="text/javascript">
			alert('���̵� ����ġ');
			location.href = '<%=request.getContextPath()%>/index.jsp';
		</script>
<% 
	}
	
	resultSet.close();
	
	preparedStatement.close();
	
	connection.close();
%>	