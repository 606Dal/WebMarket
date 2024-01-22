<%@page import="dto.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	//addProduct.jsp에서 사용자가 입력한 부분을 받아서 저장 중
	String productId = request.getParameter("productId");
	String name = request.getParameter("name");
	String unitPrice = request.getParameter("unitPrice"); //단가
	String description = request.getParameter("description"); //제품 상세 요약
	String manufacturer = request.getParameter("manufacturer"); //제조사
	String categrory = request.getParameter("categrory");
	String unitsInStock = request.getParameter("unitsInStock"); //재고
	String condition = request.getParameter("condition"); //재품 상태
	
	Integer price;
	long stock;
	
	//단가 입력창에 미 입력시
	if(unitPrice.isEmpty()){
		price = 0; //자동 박싱
	} else{
		//String을 숫자로 변환 하고 있음
		price = Integer.valueOf(unitPrice);
	}
	//재고 수량 미 입력시 /* 나중에 유효성 검사 필요함. (,넣어도 오류생김) */
	if(unitsInStock.isEmpty()){
		stock = 0; //자동 박싱
	} else{
		//String을 숫자로 변환 하고 있음
		stock = Long.valueOf(unitsInStock);
	}
	
	ProductRepository dao = ProductRepository.getInstance();
	Product newProduct = new Product();
	
	//Product 객체에 사용자가 입력한 내용을 저장하고 있음
	newProduct.setProductId(productId);
	newProduct.setPname(name);
	newProduct.setUnitPrice(price); //위에서 따로 만든 price
	newProduct.setDescription(description);
	newProduct.setManufacturer(manufacturer);
	newProduct.setCategrory(categrory);
	newProduct.setUnitsInStock(stock); //stock도
	newProduct.setCondition(condition);
	
	//ArrayList에 새 상품을 추가하고 있음
	dao.addProduct(newProduct);
	//강제로 페이지 이동 중
	response.sendRedirect("products.jsp");
	
%>