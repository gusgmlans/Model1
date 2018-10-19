<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "kr.or.ksmart.DAO.GoodsDAO"%>
<%@ page import = "kr.or.ksmart.DTO.GoodsDTO"%>

<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>��ǰ��������</title>
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
			
	<%
		request.setCharacterEncoding("EUC-KR");
		
		String get_g_code = request.getParameter("send_g_code");
		System.out.println(get_g_code + "<-- get_g_code");
		
		GoodsDAO goodsDao = new GoodsDAO();
		GoodsDTO goodsDto = goodsDao.selectGoodsForUpdate(get_g_code);
	%>
	
			<!-- Begin Right Column -->
			<div id="rightcolumn">
				<h1>��ǰ��������</h1>
				<form action = "<%=request.getContextPath()%>/goods/goods_update_pro.jsp" method = "post">
					<table border = "1">
						<tr>
							<td>��ǰ�ڵ�</td>
							<td><input type = "text" name = "g_code" size = "20" value = "<%=goodsDto.getG_code()%>" readonly></td>
						<tr>
						<tr>
							<td>���̵�</td>
							<td><input type = "text" name = "u_id" size = "20" value = "<%=goodsDto.getU_id()%>" readonly></td>
						<tr>
						<tr>
							<td>��ǰ��</td>
							<td><input type = "text" name = "g_name" size = "20" value = "<%=goodsDto.getG_name()%>"></td>
						<tr>
						<tr>
							<td>ī�װ�</td>
							<td><input type = "text" name="g_cate" size = "20" value = "<%=goodsDto.getG_cate()%>"></td>
						<tr>
						<tr>
							<td>����</td>
							<td><input type = "text" name = "g_price" size = "20" value= "<%=goodsDto.getG_price()%>"></td>
						<tr>
						<tr>
							<td>����</td>
							<td><input type = "text" name = "g_color" size = "20" value = "<%=goodsDto.getG_color()%>"></td>
						<tr>
						<tr>
							<td>������</td>
							<td><input type = "text" name = "g_size" size = "20" value = "<%=goodsDto.getG_size()%>"></td>
						<tr>
						<tr>
							<td>��¥</td>
							<td><input type = "text" name = "g_date" size = "20" value = "<%=goodsDto.getG_date()%>" readonly></td>
						<tr>
						<tr>
							<td>�󼼼���</td>
							<td><input type = "text" name = "g_desc" size = "20" value = "<%=goodsDto.getG_desc()%>"></td>
						<tr>
						<tr>
							<td colspan = "4"><input type = "submit" value = "��ǰ��������"></td>
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