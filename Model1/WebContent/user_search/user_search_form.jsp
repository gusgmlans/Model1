<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
	<body>
		<h1>ȸ���˻�</h1>
		<form action = "<%=request.getContextPath()%>/user_search/user_search_list.jsp" method = "post">
			<select name = "searchKey">
				<option value = "u_id">���̵�</option>
				<option value = "u_level">����</option>
				<option value = "u_name">�̸�</option>
				<option value = "u_email">�̸���</option>
				<option value = "u_phone">����ȣ</option>
				<option value = "u_addr">�ּ�</option>
			</select>
			<input type = "text" name = "searchValue">
			<input type = "submit" value = "�˻�">
		</form>
	</body>
</html>