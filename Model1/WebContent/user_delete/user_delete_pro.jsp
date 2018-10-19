<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "kr.or.ksmart.DAO.UserDAO" %>

<!DOCTYPE html>

<%
	request.setCharacterEncoding("EUC-KR");
	
	String get_id = request.getParameter("send_id");
	System.out.println(get_id + "<-- get_id");
	
	UserDAO userDao = new UserDAO();
	userDao.deleteUser(get_id);
	
	response.sendRedirect(request.getContextPath() + "/user_search/user_search_list.jsp");
%>