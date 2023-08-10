<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert User</title>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>


<%@ include file="./CSS/RegisterStyle.css" %>

</style>
</head>
<body>
<div class="container">
 <!---heading---->
     <header class="heading"> Registration-Form</header><hr></hr>
	<!---Form starting----> 
	<div class="row ">
	 <!--- For Name---->
         <div class="col-sm-12">
         
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
		 
		</div> 
        

    
</body>
</html>
