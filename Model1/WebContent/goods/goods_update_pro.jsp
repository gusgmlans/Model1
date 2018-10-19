<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "kr.or.ksmart.DAO.GoodsDAO"%>

<!DOCTYPE html>

<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id = "goodsDto" class = "kr.or.ksmart.DTO.GoodsDTO"/>
<jsp:setProperty name = "goodsDto" property = "*"/>

<%
	GoodsDAO goodsDao = new GoodsDAO();
	
	goodsDao.updateGoods(goodsDto);
	
	response.sendRedirect(request.getContextPath() + "/goods/goods_search_list.jsp");
%>