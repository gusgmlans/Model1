<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "kr.or.ksmart.DAO.GoodsDAO"%>

<!DOCTYPE html>

<%
	request.setCharacterEncoding("EUC-KR");
	
	String get_g_code = request.getParameter("send_g_code");
	System.out.println(get_g_code + "<-- get_g_code");
	
	GoodsDAO goodsDao = new GoodsDAO();
	
	goodsDao.deleteGoods(get_g_code);
	
	response.sendRedirect(request.getContextPath() + "/goods/goods_search_list.jsp");
%>