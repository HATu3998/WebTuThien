<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div id="modal" class="modal">
					<div class="modal-content">
						<span class="close" id="btnClose">&times;</span>
						<h2>Nhập thông tin quyên góp</h2>
						<form:form action="${pageContext.request.contextPath}/InsertUserQuyenGop"
			   method="GET">
							<!-- Các trường thông tin quyên góp ở đây -->
							<input type="text" name="noiDung" placeholder="noiDung">
							<input type="text" name="tien" placeholder="Số tiền quyên góp">
							<input type="hidden" name="tuThien_id" placeholder="TtuThien_id" value="${param.tuthienId}" />
							<input type="hidden" name="autho_username" placeholder="autho_username" value="${param.infoId}" />
							
							<button type="submit">Gửi quyên góp</button>
						</form:form>
					</div>
				</div>
				<a href="${pageContext.request.contextPath}/">Back to Home Page</a>
</body>
</html>