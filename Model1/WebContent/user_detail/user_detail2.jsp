<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>

<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>ȸ��������</title>
		<link rel = "stylesheet" type = "text/css" href="<%=request.getContextPath()%>/css/main.css">
	</head>
	<body>
		<!-- Begin Wrapper -->
		<div id="wrapper">
		
			<!-- Begin top -->
			<%@include file = "/module/top.jsp"%>
			<!-- End top -->
			
			<!-- Begin left -->
			<%@include file = "/module/left.jsp"%>
			<!-- End left -->
			
			<!-- Begin Right Column -->
			<div id = "rightcolumn">
				<h1>ȸ��������</h1>
				<table border = "1">
					<tr>
						<td>���̵�</td>
						<td>��й�ȣ</td>
						<td>����</td>
						<td>�̸�</td>
						<td>�̸���</td>
						<td>�޴���ȭ</td>
						<td>�ּ�</td>
						<td>����</td>
						<td>����</td>
					</tr>
	<%
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		request.setCharacterEncoding("EUC-KR");
		
		String get_id = request.getParameter("send_id");
		
		Class.forName("com.mysql.jdbc.Driver");
		
		String jdbcDriver = "jdbc:mysql://localhost:3306/db14hhm?useUnicode=true&characterEncoding=euckr";
		String dbUser = "dbid14hhm";
		String dbPass = "dbpw14hhm";
		
		connection = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		System.out.println(connection + "<-- connection");
			
		preparedStatement = connection.prepareStatement("SELECT u_id, u_pw, u_level, u_name, u_email, u_phone, u_addr FROM tb_user WHERE u_id = ?");
		System.out.println(preparedStatement + "<-- preparedStatement");
		
		preparedStatement.setString(1, get_id);
		
		resultSet = preparedStatement.executeQuery();
		System.out.println("preparedStatement.executeQuery");
			
		if(resultSet.next()){
	%>
					<tr>
						<td><%=resultSet.getString("u_id")%></td>
						<td><%=resultSet.getString("u_pw")%></td>
						<td><%=resultSet.getString("u_level")%></td>
						<td><%=resultSet.getString("u_name")%></td>
						<td><%=resultSet.getString("u_email")%></td>
						<td><%=resultSet.getString("u_phone")%></td>
						<td><%=resultSet.getString("u_addr")%></td>
						<td><a href = "<%=request.getContextPath()%>/user_update/user_update_form.jsp?send_id=<%=resultSet.getString("u_id")%>">����</a></td>
						<td><a href = "<%=request.getContextPath()%>/user_delete/user_delete_pro.jsp?send_id=<%=resultSet.getString("u_id")%>">����</a></td>
					</tr>
	<%	
		}
// 		else{
// 			response.sendRedirect(request.getContextPath() + "/user_search/user_search_list.jsp");
// 		}
		
		resultSet.close();
		
		preparedStatement.close();
		
		connection.close();
	%>
				</table>
				<input type = "button" value = "���ư���" onClick = "location.href = '<%=request.getContextPath()%>/user_search/user_search_list.jsp'">
			</div>
			<!-- End Right Column -->
			
			<!-- Begin hadan -->
			<%@include file = "/module/hadan.jsp"%>
			<!-- End hadan -->
			
		</div>
		<!-- End Wrapper -->
	</body>
</html>