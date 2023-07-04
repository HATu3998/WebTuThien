<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="com.luv2code.springsecurity.entity.*"%>
<%@ page import="java.util.List"%>
<!doctype html>
<html xmlns:th="http://www.thymeleaf.org" lang="en">

<head>
<title>Donation website &mdash; Website Donation</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="author" content="Free-Template.co" />
<link rel="shortcut icon" href="ftco-32x32.png">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet" crossorigin="anonymous">

<style>
<%@ include file="./CSS/style.css" %>

</style>


</head>

<body id="top">

	<div th:if="${msg}" class="toast" data-delay="1000"
		style="position: fixed; top: 100PX; left: 40PX; z-index: 2000; width: 300px">
	</div>

	<div class="site-wrap">
		<div class="site-mobile-menu site-navbar-target">
			<div class="site-mobile-menu-header">
				<div class="site-mobile-menu-close mt-3">
					<span class="icon-close2 js-menu-toggle"></span>
				</div>
			</div>
			<div class="site-mobile-menu-body"></div>
		</div>
		<!-- NAVBAR -->
		<header class="site-navbar mt-3">
			<div class="container-fluid">
				<div class="row align-items-center">
					<nav class="site-navigation col-12">
						<ul class="nav justify-content-end">
							<li class="nav-item"><a class="nav-link" href="./">Trang
									chủ</a></li>
							<li class="nav-item"><a class="nav-link" href="#">Về
									chúng tôi</a></li>
							<li class="nav-item"><a class="nav-link" href="#">Hoàn
									cảnh quyên góp</a></li>
							<li class="nav-item"><a class="nav-link" href="#">Đối
									tác đồng hành</a></li>
							<li class="nav-item"><a class="nav-link" href="#">Tin
									tức cộng đồng</a></li>
							<li class="nav-item"><a class="nav-link" href="#">Liên
									hệ</a></li>
	<li  class="nav-item"><security:authorize access="isAnonymous()">
    <a class="nav-link" href="./showMyLoginPage">Đăng nhập</a>
</security:authorize></li>
							<li> 
									<div class="logout-form">
									<security:authorize access="hasRole('EMPLOYEE')">
										<form:form action="${pageContext.request.contextPath}/logout"
											method="POST">
											<input type="submit" value="Logout" />
										</form:form>
								</security:authorize>
				</div>
				</li>
				<li>
						<div class="logout-form">
						<security:authorize access="hasRole('ADMIN')">
							<form:form action="${pageContext.request.contextPath}/logout"
								method="POST">
								<input type="submit" value="Logout" />
							</form:form>
					</security:authorize>
			</div>
			</li>
			<li><security:authorize access="hasRole('ADMIN')">
					<a href="${pageContext.request.contextPath}/systems"
						class="nav-link">IT Systems Meeting</a>
				</security:authorize></li>
			</ul>
		
			</nav>
	</div>
	</div>
	</header>

	<!-- Rest of the HTML code -->




		<section class="section-hero overlay inner-page bg-image"
			id="home-section">
			<div class="image-container">
				<img
					src="https://homepage.momocdn.net/img/momo-upload-api-210208163328-637483988083867007.jpg"
					loading="lazy" alt="Hình ảnh">
			</div>
		</section>

		<section class="site-section">
			<div class="container">
				<div class="row mb-5 justify-content-center">
					<div class="col-md-7 text-center">
						<h2 class="section-title mb-2">Các đợt quyên góp</h2>
					</div>
				</div>

							
				<% for (TuThien tu : (List<TuThien>) request.getAttribute("tuList")) { %>
				<ul class="job-listings mb-5">
					<li style="margin-bottom: 20px"
						class="job-listing d-block d-sm-flex pb-3 pb-sm-0 align-items-center">
						<div
							class="job-listing-about d-sm-flex custom-width w-100 justify-content-between mx-4">
							<div class="job-listing-position custom-width  mb-3 mb-sm-0"
								style="padding: 10px; width: 250px">
								<h2><%=tu.getTen() %></h2>
								<strong> <c:if test="<%=tu.getTrangThai() == 1%>">
										<c:out value="Mới khởi tạo" />
									</c:if>

								</strong>
							</div>
							<div class="job-listing-location mb-3 mb-sm-0 custom-width w-10"
								style="padding: 10px;">
								Ngày bắt đầu<br> <strong><%=tu.getNgayBatDau() %></strong><br>
							</div>
							<div class="job-listing-location mb-3 mb-sm-0 custom-width w-10"
								style="padding: 10px;">
								Ngày kết thúc<br> <strong><%=tu.getNgayKetThuc()%></strong><br>
							</div>
							<div class="job-listing-location mb-3 mb-sm-0 custom-width w-25"
								style="padding: 10px;">
								<span class="icon-room"></span> <span>Tên tổ chức: <%=tu.getToChuc() %></span><br>
								<p>
									SDT:<%=tu.getSdt() %></p>
								<br>
							</div>
							<div class="job-listing-location mb-3 mb-sm-0 custom-width w-10"
								style="padding: 10px;">
								Tiền<br> <strong><%=tu.getTien() %>/<%=tu.getTongTien() %></strong><br>
							</div>
							<div class="job-listing-meta custom-width w-20">
							<c:set var="user" value="${pageContext.request.userPrincipal}" />
							<c:if test="${not empty user}">
   <c:set var="userId" value="${user.name}" />
   
							<button id="btnQuyenGop"><a href="./donate?tuthienId=<%=tu.getId() %>&&infoId=${userId}">Quyên góp</a></button>
									</c:if>		
							</div>
					</li>
				</ul>

				<div id="modal" class="modal">
					<div class="modal-content">
						<span class="close" id="btnClose">&times;</span>
						<h2>Nhập thông tin quyên góp</h2>
						<form>
							<!-- Các trường thông tin quyên góp ở đây -->
							<input type="text" name="ten" placeholder="Tên của bạn">
							<input type="text" name="sotien" placeholder="Số tiền quyên góp">
							<button type="submit">Gửi quyên góp</button>
						</form>
					</div>
				</div>
				<% } %>

				<div class="row pagination-wrap">
					<div class="col-md-6 text-center text-md-left mb-4 mb-md-0"></div>
					<div class="col-md-6 text-center text-md-right">
						<%-- Hiển thị các nút trang --%>
						<% int totalPages = (int) request.getAttribute("totalPages"); %>
						<% int currentPage = (int) request.getAttribute("currentPage"); %>

						<div class="pagination">
							<p>
								<% if (currentPage > 1) { %>
								<a href="?page=<%= currentPage - 1 %>"> Prev </a>
								<% } %>
							</p>

							<p>
								<% for (int i = 1; i <= totalPages; i++) { %>
								<%-- Hiển thị các nút trang --%>
								<a href="?page=<%= i %>"><%= i %></a>
								<% } %>
							</p>

							<p>
								<% if (currentPage < totalPages) { %>
								<a href="?page=<%= currentPage + 1 %>"> Next </a>
								<% } %>
							</p>
						</div>
					</div>
				</div>
		</section>


		<script>
    $(document).ready(function() {
        const modal = document.getElementById("modal");
        const btnQuyenGop = document.getElementById("btnQuyenGop");
        const btnClose = document.getElementById("btnClose");

        // Khi nhấp vào nút "Quyên góp", hiển thị modal
        btnQuyenGop.onclick = function() {
            modal.style.display = "block";
        }

        // Khi nhấp vào nút đóng, ẩn modal
        btnClose.onclick = function() {
            modal.style.display = "none";
        }

        // Khi nhấp vào bất kỳ vị trí nào ngoài modal, ẩn modal
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    });
</script>
</body>
</html>
