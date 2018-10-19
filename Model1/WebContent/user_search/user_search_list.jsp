<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.util.ArrayList"%>
<%@ page import = "kr.or.ksmart.DAO.UserDAO"%>
<%@ page import = "kr.or.ksmart.DTO.UserDTO"%>

<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>ȸ���˻�</title>
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
			
				<!-- Begin user_search_form.jsp -->
				<%@include file = "/user_search/user_search_form.jsp"%>
				<!-- End user_search_form.jsp -->
				
				<h1>ȸ������Ʈ</h1>
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
		request.setCharacterEncoding("EUC-KR");
	
		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
	
		UserDAO userDao = new UserDAO();
		ArrayList<UserDTO> arrayListUserDto = userDao.selectUserForSearch(searchKey, searchValue);
		
		for(int i = 0; i < arrayListUserDto.size(); i++){
			UserDTO userDto = arrayListUserDto.get(i);
	%>
					<tr>
						<td><a href = "<%=request.getContextPath()%>/user_detail/user_detail_pro.jsp?send_id=<%=userDto.getU_id()%>"><%=userDto.getU_id()%></a></td>
						<td><%=userDto.getU_pw()%></td>
						<td><%=userDto.getU_level()%></td>
						<td><%=userDto.getU_name()%></td>
						<td><%=userDto.getU_email()%></td>
						<td><%=userDto.getU_phone()%></td>
						<td><%=userDto.getU_addr()%></td>
						<td><a href = "<%=request.getContextPath()%>/user_update/user_update_form.jsp?send_id=<%=userDto.getU_pw()%>">����</a></td>
						<td><a href = "<%=request.getContextPath()%>/user_delete/user_delete_pro.jsp?send_id=<%=userDto.getU_pw()%>">����</a></td>
					</tr>
	<%
		}
	%>
				</table>
			</div>
			<!-- End Right Column -->
			
			<!-- Begin hadan -->
			<%@include file = "/module/hadan.jsp"%>
			<!-- End hadan -->
			
		</div>
		<!-- End Wrapper -->
	</body>
</html>