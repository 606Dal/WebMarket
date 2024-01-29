<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dto.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	//addProduct.jsp에서 사용자가 업로드한 이미지 부분을 받아서 저장 중
	String filename = "";
	String realFolder = "c:\\upload"; // 웹 어플리케이션에서 절대경로
	int maxSize = 10 * 1024 * 1024;	//최대 업로드 크기 (10M)
	String encType = "utf-8"; //인코딩 유형
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize,
									encType, new DefaultFileRenamePolicy());


	//addProduct.jsp에서 사용자가 입력한 부분을 받아서 저장 중	
	//String productId = request.getParameter("productId"); 파일 업로드 때문에 바꿔줘야 함
	String productId = multi.getParameter("productId");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice"); //단가
	String description = multi.getParameter("description"); //제품 상세 요약
	String manufacturer = multi.getParameter("manufacturer"); //제조사
	String categrory = multi.getParameter("categrory");
	String unitsInStock = multi.getParameter("unitsInStock"); //재고
	String condition = multi.getParameter("condition"); //재품 상태
	
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
	
	Enumeration files = multi.getFileNames();
	String fname = (String)files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
/* 	System.out.println("요청 들어온 파라메터 이름 : " + fname);
	System.out.println("저장 파일 이름 : " + fileName); 이상없음 */
	
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
	newProduct.setFilename(fileName); // 이미지 저장 부분
	
	//ArrayList에 새 상품을 추가하고 있음
	dao.addProduct(newProduct);
	//강제로 페이지 이동 중
	response.sendRedirect("products.jsp");
	
%>