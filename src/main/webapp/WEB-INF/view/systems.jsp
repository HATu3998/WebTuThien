<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="com.luv2code.springsecurity.entity.*"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<title>Admin Page</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet" crossorigin="anonymous">
<style>
body {
	font-family: Arial, sans-serif;
	line-height: 1.6;
	margin: 0;
	padding: 0;
	background-image: url('your-background-image.jpg');
	background-size: cover;
	background-position: center;
}

header {
	background-color: #333;
	color: #fff;
	padding: 10px;
	text-align: center;
}

nav {
	background-color: #444;
	color: #fff;
	padding: 10px;
}

nav ul {
	list-style: none;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
}

nav ul li {
	margin: 0 10px;
}

nav ul li a {
	color: #fff;
	text-decoration: none;
	padding: 5px 10px;
	border-radius: 5px;
}

nav ul li a:hover {
	background-color: #555;
}

.container {
	max-width: 1200px;
	margin: 20px auto;
	padding: 20px;
	background-color: rgba(255, 255, 255, 0.8);
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	border-radius: 5px;
}

footer {
	background-color: #333;
	color: #fff;
	text-align: center;
	padding: 10px;
}


<%@ include file="./CSS/style.css" %>


</style>
</head>
<body>
	<header>
		<h1>Admin Page</h1>
	</header>

	<nav>
		<ul>
			<li><a href="#">Dashboard</a></li>
			<li><a href="#">Users</a></li>
			<li><a href="#">Settings</a></li>
			<li><a href="#">Logout</a></li>
		</ul>
	</nav>

	<div class="container">
		<h2>Welcome, Admin!</h2>
		<p>This is the admin page content.</p>

		<!-- Modal Trigger Button -->
		<button type="button" class="btn btn-primary" data-bs-toggle="modal"
			data-bs-target="#myModal1">Tạo dự án</button>

		<button type="button" class="btn btn-primary" data-bs-toggle="modal"
			data-bs-target="#myModal2">Open Modal</button>
			
			<button type="button" class="btn btn-primary" data-bs-toggle="modal"
			data-bs-target="#myModal3">Open Modal</button>
			
			<button type="button" class="btn btn-primary" data-bs-toggle="modal"
			data-bs-target="#myModal4">Open Modal</button>
		
			<button type="button" class="btn btn-primary" data-bs-toggle="modal"
			data-bs-target="#myModal5">Open Modal</button>
			
			<button type="button" class="btn btn-primary" data-bs-toggle="modal"
			data-bs-target="#myModal6">Open Modal</button>
		<!-- Modal -->
		<!-- Modal 1 -->
<div class="modal fade" id="myModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Tạo dự án</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
             <form action="./InsertTuThien" method="get">
    <table>
        <tr>
            <td><input type="text" name="ten" placeholder="Tên"></td>
        </tr>
        <tr>
            <td><input type="text" name="ngayKetThuc" placeholder="Chọn số ngày kết thúc"></td>
        </tr>
        <tr>
            <td><input type="text" name="toChuc" placeholder="Tổ chức"></td>
        </tr>
        <tr>
            <td><input type="text" name="sdt" placeholder="SDT"></td>
        </tr>
        <tr>
            <td><input type="text" name="tongTien" placeholder="Tiền"></td>
        </tr>
        <tr>
            <td><input type="submit" value="Submit"></td>
        </tr>
    </table>
</form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal 2 -->
<div class="modal fade" id="myModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Chọn dự án</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Modal 2 content goes here.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="myModal3" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal 1 Title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Modal 3 content goes here.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="myModal4" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal 1 Title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Modal 4 content goes here.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="myModal5" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal 1 Title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Modal 5 content goes here.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="myModal6" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal 1 Title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Modal 6content goes here.</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<!-- Tương tự cho Modal 3, Modal 4, Modal 5, Modal 6 -->
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
									<c:if test="<%=tu.getTrangThai() == 2%>">
										<c:out value="Đang quyên góp" />
									</c:if>
									<c:if test="<%=tu.getTrangThai() == 3%>">
										<c:out value="Kết thúc đợt quyên góp" />
									</c:if>
									<c:if test="<%=tu.getTrangThai() == 4%>">
										<c:out value="Đóng quyên góp" />
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
								<span class="icon-room"></span> <span>Tên tổ chức: <strong><%=tu.getToChuc() %></strong></span><br>
								<p>
									SDT: <strong><%=tu.getSdt() %></strong></p> 
								<br>
							</div>
							<div class="job-listing-location mb-3 mb-sm-0 custom-width w-10"
								style="padding: 10px;">
								Tiền<br> <strong><%=tu.getTien() %>/<%=tu.getTongTien() %></strong><br>
							</div>
							<div class="job-listing-meta custom-width w-20">
							
							</div>
					</li>
				</ul>
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


	<footer>
		<p>&copy; 2023 Admin Page. All rights reserved.</p>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
</body>
</html>
