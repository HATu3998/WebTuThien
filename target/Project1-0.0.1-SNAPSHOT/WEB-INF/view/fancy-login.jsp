<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!doctype html>
<html lang="en">

<head>
	
	<title>Login Page</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<!-- Reference Bootstrap files -->
	<link rel="stylesheet"
		 href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
	body {
			font-family: "Lato", sans-serif;
		}
		
		.main-head{
			height: 150px;
			background: #FFF;
		}
		
		.sidenav {
			height: 100%;
			background-color: #000;
			overflow-x: hidden;
			padding-top: 20px;
		}
		
		.main {
			padding: 0px 10px;
		}
		
		@media screen and (max-height: 450px) {
			.sidenav {padding-top: 15px;}
		}
		
		@media screen and (max-width: 450px) {
			.login-form{
				margin-top: 10%;
			}
		
			.register-form{
				margin-top: 10%;
			}
		}
		
		@media screen and (min-width: 768px){
			.main{
				margin-left: 40%; 
			}
		
			.sidenav{
				width: 40%;
				position: fixed;
				z-index: 1;
				top: 0;
				left: 0;
			}
		
			.login-form{
				margin-top: 80%;
			}
		
			.register-form{
				margin-top: 20%;
			}
		}
		
		.login-main-text{
			margin-top: 20%;
			padding: 60px;
			color: #fff;
		}
		
		.login-main-text h2{
			font-weight: 300;
		}
		
		.btn-black{
			background-color: #000 !important;
			color: #fff;
		}
		
		.btn-register {
			background-color: #333;
			color: #fff;
			border: none;
			padding: 10px 20px;
			border-radius: 4px;
			cursor: pointer;
		}
		
		.btn-register:hover {
			background-color: #222;
		}
</style>
</head>

<body>
<div class="sidenav">
         <div class="login-main-text">
         <c:if test="${param.error != null}">
										
										<div class="alert alert-danger col-xs-offset-1 col-xs-10">
											Invalid username and password.
										</div>
		
									</c:if>
									
									<c:if test="${param.logout != null}">
										            
										<div class="alert alert-success col-xs-offset-1 col-xs-10">
											You have been logged out.
										</div>
								    
									</c:if>
            <h2>Application<br> Login Page</h2>
            <p>Login or register from here to access.</p>
         </div>
      </div>
      <div class="main">
         <div class="col-md-6 col-sm-12">
            <div class="login-form">
               <form action="${pageContext.request.contextPath}/authenticateTheUser" 
						  method="POST" class="form-horizontal">
                  <div class="form-group">
                     <label>User Name</label>
                     <input type="text" name="username" class="form-control" placeholder="User Name">
                  </div>
                  <div class="form-group">
                     <label>Password</label>
                     <input type="password" name="password" class="form-control" placeholder="Password">
                  </div>
                  <button type="submit" class="btn btn-black">Login</button>
                 <button type="submit" class="btn btn-register"><a href="${pageContext.request.contextPath}/Register" style="text-decoration: none; color: #fff;">Register</a></button>
			
				<input type="hidden"
							   name="${_csrf.parameterName}"
							   value="${_csrf.token}" />
               </form>
            </div>
         </div>
      </div>
	<div>
		
		
		<a href="${pageContext.request.contextPath}/">Back to Home Page</a>

</body>
</html>