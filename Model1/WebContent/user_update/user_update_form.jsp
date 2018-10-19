<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "kr.or.ksmart.DAO.UserDAO" %>
<%@ page import = "kr.or.ksmart.DTO.UserDTO" %>

<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>회원정보수정</title>
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
	
		String get_id = request.getParameter("send_id");
		System.out.println(get_id + "<-- get_id");
		
		UserDAO userDao = new UserDAO();
		UserDTO userDto = userDao.selectUserForUpdate(get_id);
	%>
			<!-- Begin Right Column -->
			<div id = "rightcolumn">
				<h1>회원정보수정</h1>
				<form method = "post" action = "<%=request.getContextPath()%>/user_update/user_update_pro.jsp">
					<table border = "1">
						<tr>
							<td>아이디</td>
							<td><input type = "text" name = "u_id" size = "20" value = "<%=userDto.getU_id()%>" readonly></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type = "text" name = "u_pw" size = "20" value = "<%=userDto.getU_pw()%>"></td>
						</tr>
						<tr>
							<td>권한</td>
							<td><input type = "text" name = "u_level" size = "20" value = "<%=userDto.getU_level()%>"></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type = "text" name = "u_name" size = "20" value = "<%=userDto.getU_name()%>"></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type = "text" name = "u_email" size = "20" value = "<%=userDto.getU_email()%>"></td>
						</tr>
						<tr>
							<td>폰번호</td>
							<td><input type = "text" name = "u_phone" size = "20" value = "<%=userDto.getU_phone()%>"></td>
						</tr>
						<tr>
							<td>주소</td>
							<td><input type = "text" name = "u_addr" size = "20" value = "<%=userDto.getU_addr()%>"></td>
						</tr>
						<tr>
							<td colspan = "4"><input type = "submit" value = "회원정보수정"></td>
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