<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html>

<%
	String S_ID = (String)session.getAttribute("S_ID");
	String S_LEVEL = (String)session.getAttribute("S_LEVEL");
	String S_NAME = (String)session.getAttribute("S_NAME");

	System.out.println(S_ID + "<-- S_ID");
	System.out.println(S_LEVEL + "<-- S_LEVEL");
	System.out.println(S_NAME + "<-- S_NAME");
%>

<!-- Begin Header -->
<div id = "header">
���<br>
<%
	if(S_LEVEL == null){
%>         
	<!-- �α��� �� ȭ�� ���� -->		       	 
	<form action = "<%=request.getContextPath()%>/user_login/login_pro.jsp" method = "post">
		���̵�: <input type="text" name="id" value="id001">
		��  ��: <input type="password" name="pw" value="pw001">
		<input type="submit" value="�α���">
	</form><br>		   
	<!-- �α��� �� ȭ�� End -->
	<a href="<%=request.getContextPath()%>/user_insert/user_insert_form.jsp">ȸ������</a>

<%
	}else{
%>
	<%=S_NAME%>�� <%=S_LEVEL%>�� �α�����... 
	<a href = "<%=request.getContextPath()%>/user_login/logout_pro.jsp">�α׾ƿ�</a><br><br>
<%
		if(S_LEVEL.equals("������")){
%>
	<a href = "<%=request.getContextPath()%>/goods/goods_search_list.jsp">��ǰ�˻�</a>
<%
		}else if(S_LEVEL.equals("�Ǹ���")){
%>
	<a href = "<%=request.getContextPath()%>/goods/goods_insert_form.jsp">��ǰ���</a>
	<a href = "<%=request.getContextPath()%>/goods/goods_search_list.jsp">��ǰ�˻�</a>	
<%
		}else if(S_LEVEL.equals("������")){
%>
	<a href = "<%=request.getContextPath()%>/user_search/user_search_list.jsp">ȸ���˻�</a>
	<a href = "<%=request.getContextPath()%>/goods/goods_insert_form.jsp">��ǰ���</a>
	<a href = "<%=request.getContextPath()%>/goods/goods_search_list.jsp">��ǰ�˻�</a>
<%
		}
	}
%>
</div>
<!-- End Header -->