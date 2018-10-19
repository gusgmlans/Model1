<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "kr.or.ksmart.DAO.GoodsDAO"%>
<%@ page import = "kr.or.ksmart.DTO.GoodsDTO"%>

<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>��ǰ������</title>
		<link rel = "stylesheet" type = "text/css" href="<%=request.getContextPath()%>/css/main.css">
	</head>
	<body>
	<%		
		request.setCharacterEncoding("EUC-KR");
		
		String get_g_code = request.getParameter("send_g_code");
		
		GoodsDAO goodsDao = new GoodsDAO();
		
		GoodsDTO goodsDto = goodsDao.selectGoodsDetail(get_g_code);
	%>
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
				<h1>��ǰ������</h1>
				<table border = "1">
					<tr>
						<td>��ǰ�ڵ�</td>
						<td>���̵�</td>
						<td>��ǰ��</td>
						<td>ī�װ�</td>
						<td>����</td>
						<td>����</td>
						<td>������</td>
						<td>��¥</td>
						<td>�󼼼���</td>
						<td>����</td>
						<td>����</td>
					</tr>
					<tr>
						<td><%=goodsDto.getG_code()%></td>
						<td><%=goodsDto.getU_id()%></td>
						<td><%=goodsDto.getG_name()%></td>
						<td><%=goodsDto.getG_cate()%></td>
						<td><%=goodsDto.getG_price()%></td>
						<td><%=goodsDto.getG_color()%></td>
						<td><%=goodsDto.getG_size()%></td>
						<td><%=goodsDto.getG_date()%></td>
						<td><%=goodsDto.getG_desc()%></td>
						<td><a href="<%= request.getContextPath()%>/goods/goods_update_form.jsp?send_g_code=<%=goodsDto.getG_code()%>">����</a></td>
						<td><a href="<%= request.getContextPath()%>/goods/goods_delete_pro.jsp?send_g_code=<%=goodsDto.getG_code()%>">����</a></td>
					</tr>
				</table>
				<input type = "button" value = "���ư���" onClick = "location.href = '<%=request.getContextPath()%>/goods/goods_search_list.jsp'">
			</div>
			<!-- End Right Column -->
			
			<!-- Begin hadan -->
			<%@include file = "/module/hadan.jsp"%>
			<!-- End hadan -->
			
		</div>
		<!-- End Wrapper -->
	</body>
</html>