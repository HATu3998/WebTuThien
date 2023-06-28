<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
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
        
       
    
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
                crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
      
    </head>
<body id="top">

<style>
    <%@ include file="./CSS/style.css" %>
</style>
<div id="overlayer"></div>
<div class="loader">
    <div class="spinner-border text-primary" role="status">
        <span class="sr-only">Loading...</span>
    </div>
</div>




<div th:if="${msg}" class="toast" data-delay="1000" style="position:fixed; top: 100PX; left: 40PX;z-index: 2000;width: 300px">

    <script>
        // swal({
        //     title: 'Donate Successfully!',
        //     /* text: 'Redirecting...', */
        //     icon: 'success',
        //     timer: 3000,
        //     buttons: true,
        //     type: 'success'
        // })
    </script>
</div>

<div class="site-wrap">

    <div class="site-mobile-menu site-navbar-target">
        <div class="site-mobile-menu-header">
            <div class="site-mobile-menu-close mt-3">
                <span class="icon-close2 js-menu-toggle"></span>
            </div>
        </div>
        <div class="site-mobile-menu-body"></div>
    </div> <!-- .site-mobile-menu -->


    <!-- NAVBAR -->
   <header class="site-navbar mt-3">
  <div class="container-fluid">
    <div class="row align-items-center">
    
      <nav class="site-navigation col-6">
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
          <li> Hi! <security:authentication property="principal.username" /></li>
          <li>   <div class="logout-form">
        <form:form action="${pageContext.request.contextPath}/logout" method="POST">
          <input type="submit" value="Logout" />
        </form:form>
      </div></li>
        </ul>
      </nav>
    
      
  </div>
</header>


    <!-- HOME -->
<section class="section-hero overlay inner-page bg-image" id="home-section">
    
    <div class="image-container">
    <img src="https://homepage.momocdn.net/img/momo-upload-api-210208163328-637483988083867007.jpg" loading="lazy" alt="Hình ảnh">
</div>
 </section>


    <section class="site-section">

        <div class="container">

            <div class="row mb-5 justify-content-center">
                <div class="col-md-7 text-center">
                    <h2 class="section-title mb-2" >Các đợt quyên góp</h2>
                </div>
            </div>

            <ul class="job-listings mb-5">
                <th>
                    <li style="margin-bottom: 20px" class="job-listing d-block d-sm-flex pb-3 pb-sm-0 align-items-center ">
                        <div class="job-listing-about d-sm-flex custom-width w-100 justify-content-between mx-4">
                            <div class="job-listing-position custom-width  mb-3 mb-sm-0" style="padding: 10px;width: 250px">
                                <h2>Quyên góp mùa lũ</h2>
                                <strong > Mới tạo </strong>
                            </div>
                            <div class="job-listing-location mb-3 mb-sm-0 custom-width w-10" style="padding: 10px;">
                                Ngày bắt đầu<br>
                                <strong th:text="${category.startDate}"></strong><br>
                            </div>
                            <div class="job-listing-location mb-3 mb-sm-0 custom-width w-10" style="padding: 10px;">
                                Ngày kết thúc<br>
                                <strong th:text="${category.endDate}"></strong><br>
                            </div>
                            <div class="job-listing-location mb-3 mb-sm-0 custom-width w-25" style="padding: 10px;">
                                <span class="icon-room"></span> <span th:text="${category.organizationName}"></span><br>
                                <strong th:text="${category.phoneNumber}"></strong><br>
                            </div>
                            <div class="job-listing-meta custom-width w-20" >
                                <p style="margin-top: 20px" class="btn btn-primary py-2" data-toggle="modal">Quyên góp</p>
                                <p style="margin-top: 20px;background-color: white !important;" class="btn py-2"><span style="color: white">Quyên góp</span></p>
                            </div>
                        </div>

                    </li>
                    <!-- Modal -->
                    <div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Quyên góp: <span></span></h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <form method="post">
                                    <div class="modal-body">
                                        <div class="row">

                                            <div class="col-12">
                                                <label for="addname"
                                                       class="col-form-label">Họ tên:</label>
                                                <input type="text" class="form-control"
                                                       id="addname" name="name" placeholder="" required>
                                                <label for="addname"
                                                       class="col-form-label">Số tiền quyên góp:</label>
                                                <input type="number" class="form-control" placeholder=""
                                                       id="addname" name="money" required>
                                                <input type="hidden" class="form-control" placeholder=""
                                                       id="addname" name="idUser" >
                                                <input type="hidden" class="form-control" placeholder=""
                                                       id="addname" name="idDonation" required>

                                                <label for="addname"
                                                       class="col-form-label">Lời nhắn:</label>
                                                <textarea rows="10" cols="3" class="form-control" name="text">

                                                </textarea>
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
                </th>
                <script>
                    function detail(id){
                        window.location = '/donation/detail/' + id;
                    }


                </script>
            </ul>

            <div class="row pagination-wrap">
                <div class="col-md-6 text-center text-md-left mb-4 mb-md-0">

                </div>
                <div class="col-md-6 text-center text-md-right">
                    <div class="custom-pagination ml-auto">
                        <a class="prev">Prev</a>
                        <div class="d-inline-block">
                        </div>

                        <a class="next">Next</a>
                    </div>
                </div>
            </div>

        </div>
    </section>

</div>


</body>
</html>