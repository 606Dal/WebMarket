<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<%-- 네비게이션 바를 만듦.	크기를 유동적으로.			색상 --%>
<nav class="navbar navbar-expand navbar bg-dark border-bottom border-body" data-bs-theme="dark">
	<div class="container"> <%-- container라는 클래스 부터는 무엇인가 내용을 표식 --%>
		<div class="navbar-header">
			<a class="navbar-brand" href="./welcome.jsp">Home</a> <%-- 로고 --%>
		</div>
		<%-- 네비게이션 바의 요소들을 추가등록 하는 코드 --%>
		<div>
								<%-- 마진 자동 --%>
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="./products.jsp">상품 목록</a></li>
				<li class="nav-item"><a class="nav-link" href="./addProduct.jsp">상품 등록</a></li>
				<li class="nav-item"><a class="nav-link" href="./editProduct.jsp?edit=update">상품 수정</a></li>
				<li class="nav-item"><a class="nav-link" href="./editProduct.jsp?edit=delete">상품 삭제</a></li>
			</ul>
		</div>
		
	</div>
</nav>