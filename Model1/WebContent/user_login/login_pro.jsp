<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "kr.or.ksmart.DAO.UserDAO"%>
<%@ page import = "kr.or.ksmart.DTO.UserDTO"%>

<!DOCTYPE html>

<%
	request.setCharacterEncoding("EUC-KR");
	
	String id = request.getParameter("id");	
	String pw = request.getParameter("pw");
	System.out.println(id + "<-- id");
	System.out.println(pw + "<-- pw");
	
	UserDAO userDao = new UserDAO();
	int loginCheck = userDao.selectUserForLogin(id, pw);
	
	if(loginCheck == 1){
		System.out.println("�α��� ����");
		
		UserDTO userDto = userDao.selectUserForSession(id);
		
		String dbId = userDto.getU_id();
		String dbLevel = userDto.getU_level();
		String dbName = userDto.getU_name();
		
		System.out.println(dbId + "<-- dbId");
		System.out.println(dbLevel + "<-- dbLevel");
		System.out.println(dbName + "<-- dbName");
		
		session.setAttribute("S_ID", dbId);
		session.setAttribute("S_LEVEL", dbLevel);
		session.setAttribute("S_NAME", dbName);
%>
		<script type="text/javascript">
			alert('�α��� ����');
			location.href = '<%=request.getContextPath()%>/index.jsp';
		</script>
<%
	}else if(loginCheck == 2){
		System.out.println("���̵� ����ġ");
%>
		<script type="text/javascript">
			alert('���̵� ����ġ');
			location.href = '<%=request.getContextPath()%>/index.jsp';
		</script>
<%
	}else if(loginCheck == 3){
		System.out.println("��й�ȣ ����ġ");
%>
		<script type="text/javascript">
			alert('��й�ȣ ����ġ');
			location.href = '<%=request.getContextPath()%>/index.jsp';
		</script>
<%
	}
%>	