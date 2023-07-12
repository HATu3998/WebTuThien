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
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          rel="stylesheet" crossorigin="anonymous">
              <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
    .header {
        text-align: center;
        padding: 20px;
    }
    
    .nav {
        display: flex;
        justify-content: center;
        margin-bottom: 20px;
    }
    
    .nav button {
        margin-right: 10px;
    }
    
    .content {
        padding: 20px;
    }
    
    .job-listing {
        border: 1px solid #ccc;
        padding: 10px;
        margin-bottom: 20px;
        background-color: #f9f9f9;
    }
    
    .job-listing h2 {
        margin-bottom: 5px;
    }
    
  





</style>
</head>
<body>
<security:authorize access="hasRole('ADMIN')">
    <div class="header">
        <h1>Welcome to the Admin Page</h1>
    </div>

    <div class="nav">
        <button id="btn1" class="active">
            <a href="./">Về trang chủ</a>
        </button>
        <button id="btn2"><a href="./UserServlet">Quản lý User</a></button>
        <button id="btn3"><a href="./AdminServlet">Trang Dự Án</a></button>
        <button id="btn4">Button 4</button>
        <button id="btn5">Button 5</button>
        <button id="btn6">
            <div class="logout-form">
                <form:form action="${pageContext.request.contextPath}/logout" method="POST">
                    <input type="submit" value="Logout" />
                </form:form>
            </div>
        </button>
    </div>

    <div class="buttons">
        <button id="btn1">Danh Sách</button>
        <button id="btn2">Tạo Tài Khoản</button>
        <button id="btn3">Đóng Băng Tài Khoản</button>
        <button id="btn4">cập nhật Thông tin Tài Khoản </button>
        <button id="btn5">Loại tài khoản</button>
       
    </div>

    <div id="content1" class="content">
        <section class="site-section">
            <div class="container">
                <div class="row mb-5 justify-content-center">
                    <div class="col-md-7 text-center">
                        <h2 class="section-title mb-2">Danh Sách User</h2>
                    </div>
                </div>

                <c:forEach items="${InfoList}" var="tu">
                    <ul class="job-listings mb-5">
                        <li class="job-listing d-block d-sm-flex pb-3 pb-sm-0 align-items-center">
                            <div class="job-listing-about d-sm-flex custom-width w-100 justify-content-between mx-4">
                                <div class="job-listing-position custom-width  mb-3 mb-sm-0" style="padding: 10px; width: 250px">
                                    <h2>${tu.user.username}</h2>
                                </div>
                                <div class="job-listing-position custom-width  mb-3 mb-sm-0" style="padding: 10px; width: 250px">
                                    <p>${tu.hoTen}</p>
                                </div>
                                <div class="job-listing-position custom-width  mb-3 mb-sm-0" style="padding: 10px; width: 250px">
                                    <p>${tu.email}</p>
                                </div>
                                <div class="job-listing-position custom-width  mb-3 mb-sm-0" style="padding: 10px; width: 250px">
                                    <p>${tu.sdt}</p>
                                </div>
                            </div>
                        </li>
                    </ul>
                </c:forEach>

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
            </div>
        </section>
    </div>
    
    
      <div id="content2" class="content">
          <form action="./InsertServlet" method="get">
    <table>
    
        <tr>
         <td><input  type="text" name="username" placeholder="username"></td>
        </tr>
        <tr>
            <td><input type="password" name="password" placeholder="password"></td>
        </tr>
      <tr>
            <td><input type="text" name="hoTen" placeholder="ten"></td>
        </tr>
         <tr>
            <td><input type="text" name="email" placeholder="email"></td>
        </tr>
         <tr>
            <td><input type="text" name="sdt" placeholder="sdt"></td>
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

                <c:forEach items="${tuList}" var="tu">
                    <ul class="job-listings mb-5">
                        <li class="job-listing d-block d-sm-flex pb-3 pb-sm-0 align-items-center">
                            <div class="job-listing-about d-sm-flex custom-width w-100 justify-content-between mx-4">
                                <div class="job-listing-position custom-width  mb-3 mb-sm-0" style="padding: 10px; width: 250px">
                                    <h2>${tu.username} </h2>
                                
                                </div>
                                <div class="job-listing-position custom-width  mb-3 mb-sm-0" style="padding: 10px; width: 250px">
                                    <p>******</p>
                                </div>
                                <div class="job-listing-position custom-width  mb-3 mb-sm-0" style="padding: 10px; width: 250px">
                                  
                                    <c:if test="${tu.enabled==0}">
										<c:out value="Đã khóa" />
									</c:if>
									<c:if test="${tu.enabled==1}">
										<c:out value="Đang hoạt động" />
									</c:if>
                                </div>
                                
                                <div class="job-listing-position custom-width  mb-3 mb-sm-0" style="padding: 10px; width: 250px">
                                  
                                    <button class="btn" ><a href="./DeleUser?id=${tu.username}&&status=0">Khóa</a></button>
                                    <button class="btn" ><a href="./DeleUser?id=${tu.username}&&status=1">Khôi Phục</a></button>
                                </div>
                            </div>
                        </li>
                    </ul>
                </c:forEach>

            
        </section>
    </div>
    
      
        <div id="content4" class="content">
         <section class="site-section">
            <div class="container">
                <div class="row mb-5 justify-content-center">
                    <div class="col-md-7 text-center">
                        <h2 class="section-title mb-2">Thông tin tài khoản </h2>
                    </div>
                </div>

                <c:forEach items="${tuList}" var="tu">
                    <ul class="job-listings mb-5">
                        <li class="job-listing d-block d-sm-flex pb-3 pb-sm-0 align-items-center">
                            <div class="job-listing-about d-sm-flex custom-width w-100 justify-content-between mx-4">
                                <div class="job-listing-position custom-width  mb-3 mb-sm-0" style="padding: 10px; width: 250px">
                                    <h2>${tu.username} </h2>
                                
                                </div>
                                <div class="job-listing-position custom-width  mb-3 mb-sm-0" style="padding: 10px; width: 250px">
                                    <p>******</p>
                                </div>
                                <div class="job-listing-position custom-width  mb-3 mb-sm-0" style="padding: 10px; width: 250px">
                                  
                                    <c:if test="${tu.enabled==0}">
										<c:out value="Đã khóa" />
									</c:if>
									<c:if test="${tu.enabled==1}">
										<c:out value="Đang hoạt động" />
									</c:if>
                                </div>
                                
                                <div class="job-listing-position custom-width  mb-3 mb-sm-0" style="padding: 10px; width: 250px">
                                  
                                   
<button class="btn" ><a href="./GetByUserName?name=${tu.username}">Update</a></button>
                                </div>
                            </div>
                        </li>
                    </ul>
                </c:forEach>

            
        </section>
    </div>
    
    <div id="content5" class="content">
         <section class="site-section">
            <div class="container">
                <div class="row mb-5 justify-content-center">
                    <div class="col-md-7 text-center">
                        <h2 class="section-title mb-2">Loại tài khoản </h2>
                    </div>
                </div>

                <c:forEach items="${auList}" var="tu">
                    <ul class="job-listings mb-5">
                        <li class="job-listing d-block d-sm-flex pb-3 pb-sm-0 align-items-center">
                            <div class="job-listing-about d-sm-flex custom-width w-100 justify-content-between mx-4">
                                <div class="job-listing-position custom-width  mb-3 mb-sm-0" style="padding: 10px; width: 250px">
                                    <h2>${tu.user.username} </h2>
                                
                                </div>
                                <div class="job-listing-position custom-width  mb-3 mb-sm-0" style="padding: 10px; width: 250px">
                                    <p>${tu.authority}</p>
                                </div>
                              
                                
                                <div class="job-listing-position custom-width  mb-3 mb-sm-0" style="padding: 10px; width: 250px">
                                  
                                   
<button class="btn" ><a href="./GetByUserNameAuthority?name=${tu.user.username}">Update</a></button>
                                </div>
                            </div>
                        </li>
                    </ul>
                </c:forEach>

            
        </section>
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
