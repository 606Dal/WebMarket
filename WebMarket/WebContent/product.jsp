<%@page import="dao.ProductRepository"%>
<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page errorPage="exceptionNoProductId.jsp" %> <%-- 상품 코드 값이 유효하지 않으면 에러페이지로 이동 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session" /> --%>

<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">-->
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>상품 상세 정보</title>

<%-- 장바구니에 추가하기 위한 핸들러 함수 --%>
<script type="text/javascript">
	function addToCart() {
		//confirm()함수는 사용자의 선택을 할 때 사용.
		if(confirm("해당 상품을 장바구니에 추가 하시겠습니까?")){
			document.addForm.submit();
		} else {
			document.addForm.reset();
		}
	}
</script>


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
			<!-- 이미지 추가 -->
			<div class="col-md-5">
				<%-- cos.jar 이용을 위해 물리적인 경로로 바꿈-%>
				<%-- <img src="c:/upload/<%= product.getFilename() %>"
					style="width: 100%"> 
					 -> 웹 브라우저에서 적용 안 되서 다시 변경---%>
					 
				<img src="${pageContext.request.contextPath }/resources/images/<%= product.getFilename() %>"
					style="width: 100%" class="mt-4">
			</div>
			
			<div class="col-md-6 m-4">
				<h3><%= product.getPname() %> </h3>
				<p><%= product.getDescription()  %></p>
				<p><b>상품 코드 : </b><span class="badge rounded-pill text-bg-info"><%=product.getProductId()%></span></p>
				<p><b>제조사 : </b><%=product.getManufacturer() %></p>
				<p><b>분류 : </b><%=product.getCategory() %></p>
				<p><b>재고 수 : </b><%=product.getUnitsInStock() %></p>
				<h4><%= product.getUnitPrice() %>원</h4>
				
				<p><form name="addForm" action="./addCart.jsp?id=<%= product.getProductId() %>" method="post">
					<%-- 상품 주문을 클릭하면 자바스크립트의 핸들러 함수 addToCart()가 호출되도록 만듦 --%>
					<a href="#" class="btn btn-outline-primary btn-sm" onclick="addToCart()">상품 주문 &raquo;</a>
					<%-- 장바구니 버튼을 추가함. --%>
					<a href="./cart.jsp" class="btn btn-outline-warning btn-sm">장바구니 &raquo;</a>
					<a href="./products.jsp" class="btn btn-outline-secondary btn-sm">상품 목록 &raquo;</a>
				</form>
			</div>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />

</body>
</html>