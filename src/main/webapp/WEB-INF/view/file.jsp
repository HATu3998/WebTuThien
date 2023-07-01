<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.luv2code.springsecurity.entity.*" %>
<%@ page import="java.util.List" %>
<!doctype html>
<html xmlns:th="http://www.thymeleaf.org" lang="en">

<head>
    <title>Donation website &mdash; Website Donation</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="author" content="Free-Template.co" />
    <link rel="shortcut icon" href="ftco-32x32.png">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">

    <style>
        <%@ include file="./CSS/style.css" %>
    </style>

    <script>
        $(document).ready(function() {
            $('.btn.btn-primary.py-2').click(function() {
                var name = $(this).closest('.job-listing').find('h2').text();
                var idDonation = $(this).closest('.job-listing').data('iddonation');
                $('#myModal .modal-title span').text(name);
                $('#myModal input[name="idDonation"]').val(idDonation);
                $('#myModal').modal('show');
            });
        });
    </script>
</head>

<body id="top">

    <div th:if="${msg}" class="toast" data-delay="1000" style="position:fixed; top: 100PX; left: 40PX;z-index: 2000;width: 300px">
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
                            <li class="nav-item">
                                <a class="nav-link" href="./">Trang chủ</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Về chúng tôi</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Hoàn cảnh quyên góp</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Đối tác đồng hành</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Tin tức cộng đồng</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Liên hệ</a>
                            </li>
                            
                            <li>
                                <div class="logout-form">
                                    <form:form action="${pageContext.request.contextPath}/logout" method="POST">
                                        <input type="submit" value="Logout" />
                                    </form:form>
                                </div>
                            </li>
                        
                            <li>
                                <security:authorize access="hasRole('ADMIN')">
                                    <a href="${pageContext.request.contextPath}/systems" class="nav-link">IT Systems Meeting</a>
                                </security:authorize>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </header>

        <!-- Rest of the HTML code -->




    <section class="section-hero overlay inner-page bg-image" id="home-section">
        <div class="image-container">
            <img src="https://homepage.momocdn.net/img/momo-upload-api-210208163328-637483988083867007.jpg" loading="lazy" alt="Hình ảnh">
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
                <li style="margin-bottom: 20px" class="job-listing d-block d-sm-flex pb-3 pb-sm-0 align-items-center">
                    <div class="job-listing-about d-sm-flex custom-width w-100 justify-content-between mx-4">
                        <div class="job-listing-position custom-width  mb-3 mb-sm-0" style="padding: 10px;width: 250px">
                            <h2><%=tu.getTen() %></h2>
                            <strong><%=tu.getTrangThai() %></strong>
                        </div>
                        <div class="job-listing-location mb-3 mb-sm-0 custom-width w-10" style="padding: 10px;">
                            Ngày bắt đầu<br>
                            <strong><%=tu.getNgayBatDau() %></strong><br>
                        </div>
                        <div class="job-listing-location mb-3 mb-sm-0 custom-width w-10" style="padding: 10px;">
                            Ngày kết thúc<br>
                            <strong><%=tu.getNgayKetThuc()%></strong><br>
                        </div>
                        <div class="job-listing-location mb-3 mb-sm-0 custom-width w-25" style="padding: 10px;">
                            <span class="icon-room"></span>
                            <span>Tên tổ chức<%=tu.getToChuc() %></span><br>
                            <p>SDT:<%=tu.getSdt() %></p><br>
                        </div>
                        <div class="job-listing-meta custom-width w-20">
                            <p style="margin-top: 20px" class="btn btn-primary py-2" data-toggle="modal" data-target="#myModal" data-name="<%=tu.getTen()%>" data-idDonation="<%=tu.getId()%>">Quyên góp</p>
                        </div>
                    </div>
                </li>
            </ul>
            <% } %>

            <div class="row pagination-wrap">
                <div class="col-md-6 text-center text-md-left mb-4 mb-md-0"></div>
                <div class="col-md-6 text-center text-md-right">
                    <div class="custom-pagination ml-auto">
                        <a class="prev">Prev</a>
                        <div class="d-inline-block"></div>
                        <a class="next">Next</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Quyên góp: <span id="donationName"></span></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form method="post">
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-12">
                                <label for="addname" class="col-form-label">Họ tên:</label>
                                <input type="text" class="form-control" id="addname" name="name" placeholder="" required>
                                <label for="addname" class="col-form-label">Số tiền quyên góp:</label>
                                <input type="number" class="form-control" placeholder="" id="addname" name="money" required>
                                <input type="hidden" class="form-control" placeholder="" id="addname" name="idUser">
                                <input type="hidden" class="form-control" placeholder="" id="addname" name="idDonation" required>
                                <label for="addname" class="col-form-label">Lời nhắn:</label>
                                <textarea rows="10" cols="3" class="form-control" name="text"></textarea>
                               
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                            <button type="submit" data-toggle="modal" data-target="#exampleModal" class="btn btn-primary">Quyên góp</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
