<%@page import="dao.ProductRepository"%>
<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session" /> --%>

<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>상품 상세 정보</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="mt-4 p-5 bg-secondary text-white rounded">
		<div class="container">
			<h1 class="display-4">상품 정보</h1>
		</div>
	</div>
	<%
		//넘어온 상품 아이디값을 얻어낸다.
		String id = request.getParameter("id");
		ProductRepository dao = ProductRepository.getInstance();
		//넘어온 상품 아이디값을 이용해서 실제 해당하는 Product객체를 얻고 있음
		/* Product product = productDAO.getProductById(id); */
		Product product = dao.getProductById(id);
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-6 m-4">
				<h3><%= product.getPname() %> </h3>
				<p><%= product.getDescription()  %></p>
				<p><b>상품 코드 : </b><span class="badge rounded-pill text-bg-info"><%=product.getProductId()%></span></p>
				<p><b>제조사 : </b><%=product.getManufacturer() %></p>
				<p><b>분류 : </b><%=product.getCategrory() %></p>
				<p><b>재고 수 : </b><%=product.getUnitsInStock() %></p>
				<h4><%= product.getUnitPrice() %>원</h4>
				
				<p><a href="#" class="btn btn-outline-primary">상품 주문</a></p>
				<a href="./products.jsp" class="btn btn-outline-secondary">상품 목록 &raquo;</a>
			</div>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />

</body>
</html>