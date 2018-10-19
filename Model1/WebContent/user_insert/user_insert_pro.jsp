<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "kr.or.ksmart.DAO.UserDAO"%>

<!DOCTYPE html>

<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id = "userDto" class = "kr.or.ksmart.DTO.UserDTO"/>
<jsp:setProperty name = "userDto" property = "*"/>

<%
	UserDAO userDao = new UserDAO();
	userDao.insertUser(userDto);
	
	response.sendRedirect(request.getContextPath() + "/index.jsp");
%>