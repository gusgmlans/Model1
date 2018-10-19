<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>��ǰ�������</title>
		<link rel = "stylesheet" type = "text/css" href = "<%=request.getContextPath()%>/css/main.css">
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
				<h1>��ǰ�������</h1>
				<form action = "<%= request.getContextPath() %>/goods/goods_insert_pro.jsp" method = "post">
					<input type = "hidden" name = "u_id" value = "<%=S_ID%>">
					<table border = "1">
						<tr>
							<td>��ǰ��</td>
							<td><input type = "text" name = "g_name" size = "20"></td>
						<tr>
						<tr>
							<td>ī�װ�</td>
							<td><input type = "text" name = "g_cate" size = "20"></td>
						<tr>
						<tr>
							<td>����</td>
							<td><input type = "text" name = "g_price" size = "20"></td>
						<tr>
						<tr>
							<td>����</td>
							<td><input type = "text" name = "g_color" size = "20"></td>
						<tr>
						<tr>
							<td>������</td>
							<td><input type = "text" name = "g_size" size = "20"></td>
						<tr>
						<tr>
							<td>�󼼼���</td>
							<td><input type = "text" name = "g_desc" size = "20"></td>
						<tr>
						<tr>
							<td colspan = "4"><input type = "submit" value = "��ǰ�������"></td>
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