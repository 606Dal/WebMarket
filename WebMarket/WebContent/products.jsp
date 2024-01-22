<%@page import="dao.ProductRepository"%>
<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%-- <jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session"/> --%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>상품 목록</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<%-- jumbotron (B5에서는 더 이상 지원되지 않음) --%>
	<%-- mt(마진 탑) p(패딩) --%>
	<div class="mt-4 p-5 bg-secondary text-white rounded">
		<div class="container">
			<h1 class="display-4">상품 목록</h1>
		</div>
	</div>
	<%
		ProductRepository dao = ProductRepository.getInstance();
		//상품 목록을 다 가져온다.	+ useBean없앤 후 수정
		/* ArrayList<Product> listOfProducts = productDAO.getAllProducts(); */
		ArrayList<Product> listOfProducts = dao.getAllProducts();
	%>
	<div class="container">
		<!-- 한 행씩 보이게 -->
		<div class="row" align="center">
			<%
				for(int i=0; i<listOfProducts.size(); i++){
					Product product = listOfProducts.get(i);
			%>
			<div class="col-md-4 mt-4"> <!-- 컬럼을 12를 4개로 분할 -->
				<h3><%=product.getPname()%> </h3>
				<p><%=product.getDescription() %></p>
				<p><%=product.getUnitPrice() %>원</p>
				
				<%-- 상품의 아이디에 대한 상세정보 페이지를 연결시키기 위한 코드 --%>
				<p><a href="./product.jsp?id=<%=product.getProductId()%>"
				class="btn btn-secondary" role="button">상세 정보 &raquo;</a></p>
												<%--  &raquo; html 특수문자 --%>
			</div>
			<%
				} %>
		</div>
		<hr>
	</div>
	
	<jsp:include page="footer.jsp" />
	
	<%-- <h1><%= greeting %></h1>
	<h3><%= tagline %></h3> --%>
</body>
</html>