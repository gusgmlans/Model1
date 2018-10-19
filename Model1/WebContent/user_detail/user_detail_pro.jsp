<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "kr.or.ksmart.DAO.UserDAO"%>
<%@ page import = "kr.or.ksmart.DTO.UserDTO"%>

<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>ȸ��������</title>
		<link rel = "stylesheet" type = "text/css" href="<%=request.getContextPath()%>/css/main.css">
	</head>
	<body>
	<%
		request.setCharacterEncoding("EUC-KR");
	
		String get_id = request.getParameter("send_id");
		
		UserDAO userDao = new UserDAO();
		UserDTO userDto = userDao.selectUserForDetail(get_id);
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
					<tr>
						<td><%=userDto.getU_id()%></td>
						<td><%=userDto.getU_pw()%></td>
						<td><%=userDto.getU_level()%></td>
						<td><%=userDto.getU_name()%></td>
						<td><%=userDto.getU_email()%></td>
						<td><%=userDto.getU_phone()%></td>
						<td><%=userDto.getU_email()%></td>
						<td><a href = "<%=request.getContextPath()%>/user_update/user_update_form.jsp?send_id=<%=userDto.getU_id()%>">����</a></td>
						<td><a href = "<%=request.getContextPath()%>/user_delete/user_delete_pro.jsp?send_id=<%=userDto.getU_id()%>">����</a></td>
					</tr>
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