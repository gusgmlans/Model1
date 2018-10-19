<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>ȸ������</title>
		<link rel = "stylesheet" type = "text/css" href = "<%=request.getContextPath()%>/css/main.css">
	</head>
	<body>
	<!-- Begin Wrapper -->
		<div id = "wrapper">
		
			<!-- Begin top -->
			<%@include file = "/module/top.jsp"%>
			<!-- End top -->
			
			<!-- Begin left -->
			<%@include file = "/module/left.jsp"%>
			<!-- End left -->
			
			<!-- Begin Right Column -->
			<div id = "rightcolumn">
				<h1>ȸ������</h1>
				<form action = "<%=request.getContextPath()%>/user_insert/user_insert_pro.jsp" method = "post">
					<table border = "1">
						<tr>
							<td>���̵�</td>
							<td><input type = "text" name = "u_id" size = "20"></td>
						<tr>
						<tr>
							<td>��ȣ</td>
							<td><input type = "password" name = "u_pw" size = "20"></td>
						<tr>
						<tr>
							<td>����</td>
							<td><input type = "text" name = "u_level" size = "20"></td>
						<tr>
						<tr>
							<td>�̸�</td>
							<td><input type = "text" name = "u_name" size = "20"></td>
						<tr>
						<tr>
							<td>�̸���</td>
							<td><input type = "text" name = "u_email" size = "20"></td>
						<tr>
						<tr>
							<td>��ȭ��ȣ</td>
							<td><input type = "text" name = "u_phone" size = "20"></td>
						<tr>
						<tr>
							<td>�ּ�</td>
							<td><input type = "text" name = "u_addr" size = "20"></td>
						<tr>
						<tr>
							<td colspan = "4"><input type = "submit" value = "ȸ������"></td>
						</tr>
					</table>
				</form>
			</div>
			<!-- End Right Column -->
			
			<!-- Begin hadan -->
			<%@include file = "/module/hadan.jsp"%>
			<!-- End hadan -->
			
		</div>
		<!-- End Wrapper -->
	</body>
</html>