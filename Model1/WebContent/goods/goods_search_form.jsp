<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
	<body>
		<h1>��ǰ�˻�</h1>
		<form action = "<%=request.getContextPath()%>/goods/goods_search_list.jsp" method = "post">
			<select name = "searchKey">
				<option value = "g_code">��ǰ�ڵ�</option>
				<option value = "u_id">���̵�</option>
				<option value = "g_name">��ǰ��</option>
				<option value = "g_cate">ī�װ�</option>
				<option value = "g_price">����</option>
				<option value = "g_color">����</option>
				<option value = "g_size">������</option>
				<option value = "g_date">��¥</option>
				<option value = "g_desc">�󼼼���</option>
			</select>
			<input type = "text" name = "searchValue">
			<input type = "submit" value = "��ǰ�˻�">
		</form>
	</body>
</html>