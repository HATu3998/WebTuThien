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
    <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet" crossorigin="anonymous">
    
    <style>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }

        .header {
            background-color: #333;
            color: #fff;
            padding: 10px;
            text-align: center;
        }

        .nav {
            background-color: #f4f4f4;
            padding: 10px;
            text-align: center;
        }

        .nav button {
            background-color: #ccc;
            border: none;
            padding: 10px 20px;
            margin: 5px;
            cursor: pointer;
        }

        .content {
            display: none;
            padding: 20px;
            background-color: #fff;
            margin-top: 10px;
        }
 <%@ include file="./CSS/style.css" %>
 
       
    </style>
</head>
<body>
<security:authorize access="hasRole('ADMIN')">
      <div class="header">
            <h1>Welcome to the Admin Page</h1>
        </div>

	<div class="nav">
		<button id="btn1">
			<a href="./">Về trang chủ</a>
		</button>
		<button id="btn2">Button 2</button>
		<button id="btn3">Button 3</button>
		<button id="btn4">Button 4</button>
		<button id="btn5">Button 5</button>
		<button id="btn6">
			<div class="logout-form">
			
					<form:form action="${pageContext.request.contextPath}/logout"
						method="POST">
						<input type="submit" value="Logout" />
					</form:form>
				
			</div>
		</button>
	</div>


	<div class="buttons">
        <button id="btn1">Danh Sách</button>
        <button id="btn2">Tạo Dự Án</button>
        <button id="btn3">Xóa Dự Án</button>
        <button id="btn4">Sửa Dự Án</button>
        <button id="btn5">Button 5</button>
        <button id="btn6">Button 6</button>
    </div>

    <div id="content1" class="content">
       
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
							<c:if test="<%=tu.getTrangThai() == 3%>">
									<c:set var="user" value="${pageContext.request.userPrincipal}" />
							<c:if test="${not empty user}">
   <c:set var="userId" value="${user.name}" />
   
							<button id="btnQuyenGop" ><a href="#">Đóng Quyên góp</a></button>
									</c:if>		
									</c:if>
									
								
							
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

    </div>

    <div id="content2" class="content">
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

    <div id="content3" class="content">
       
		<section class="site-section">
			<div class="container">
				<div class="row mb-5 justify-content-center">
					<div class="col-md-7 text-center">
						<h2 class="section-title mb-2">Xóa</h2>
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
							 
   
						<input type="button" ><a href="./DeleTuThien?id=<%= tu.getId() %>">Xóa</a>
 
									
								
							
							</div>
					</li>
				</ul>

				
				<% } %>

				<div class="row pagination-wrap">
					<div class="col-md-6 text-center text-md-left mb-4 mb-md-0"></div>
					<div class="col-md-6 text-center text-md-right">
						<%-- Hiển thị các nút trang --%>
						<% int totalPages2 = (int) request.getAttribute("totalPages"); %>
						<% int currentPage2 = (int) request.getAttribute("currentPage"); %>

						<div class="pagination">
							<p>
								<% if (currentPage2 > 1) { %>
								<a href="?page=<%= currentPage2 - 1 %>"> Prev </a>
								<% } %>
							</p>

							<p>
								<% for (int i = 1; i <= totalPages2; i++) { %>
								<%-- Hiển thị các nút trang --%>
								<a href="?page=<%= i %>"><%= i %></a>
								<% } %>
							</p>

							<p>
								<% if (currentPage2 < totalPages2) { %>
								<a href="?page=<%= currentPage2 + 1 %>"> Next </a>
								<% } %>
							</p>
						</div>
					</div>
				</div>
		</section>
    </div>

    <div id="content4" class="content">
        	<section class="site-section">
			<div class="container">
				<div class="row mb-5 justify-content-center">
					<div class="col-md-7 text-center">
						<h2 class="section-title mb-2">Xóa</h2>
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
							 
   
						<input type="button" ><a href="./GetById?tuThien_id=<%= tu.getId() %>">Update</a>
 
									
								
							
							</div>
					</li>
				</ul>

				
				<% } %>

				<div class="row pagination-wrap">
					<div class="col-md-6 text-center text-md-left mb-4 mb-md-0"></div>
					<div class="col-md-6 text-center text-md-right">
						<%-- Hiển thị các nút trang --%>
						<% int totalPages3 = (int) request.getAttribute("totalPages"); %>
						<% int currentPage3 = (int) request.getAttribute("currentPage"); %>

						<div class="pagination">
							<p>
								<% if (currentPage3 > 1) { %>
								<a href="?page=<%= currentPage3 - 1 %>"> Prev </a>
								<% } %>
							</p>

							<p>
								<% for (int i = 1; i <= totalPages3; i++) { %>
								<%-- Hiển thị các nút trang --%>
								<a href="?page=<%= i %>"><%= i %></a>
								<% } %>
							</p>

							<p>
								<% if (currentPage2 < totalPages2) { %>
								<a href="?page=<%= currentPage2 + 1 %>"> Next </a>
								<% } %>
							</p>
						</div>
					</div>
				</div>
		</section>
    </div>

    <div id="content5" class="content">
        <h2>Content 5</h2>
        <p>This is the content for Button 5.</p>
    </div>

    <div id="content6" class="content">
        <h2>Content 6</h2>
        <p>This is the content for Button 6.</p>
    </div>
</security:authorize>
    <script>
        // Lấy các phần tử button và content
        const buttons = document.querySelectorAll('.buttons button');
        const contents = document.querySelectorAll('.content');

        // Ẩn tất cả các content
        contents.forEach(content => {
            content.style.display = 'none';
        });

        // Hiển thị content mặc định
        contents[0].style.display = 'block';

        // Bắt sự kiện click cho từng button
        buttons.forEach((button, index) => {
            button.addEventListener('click', () => {
                // Ẩn tất cả các content
                contents.forEach(content => {
                    content.style.display = 'none';
                });

                // Hiển thị content tương ứng với button được nhấp vào
                contents[index].style.display = 'block';
            });
        });
    </script>
</body>
</html>
