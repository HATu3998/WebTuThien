<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page import="com.luv2code.springsecurity.entity.*" %>
<%@ page import="java.util.List" %>
<html>

<head>
	<title>luv2code Company Home Page</title>
</head>

<body>
	<h2>luv2code Company Home Page</h2>
	<hr>
<% 
    List<TuThien> tuList = (List<TuThien>) request.getAttribute("tuList");
    if (tuList != null) {
        for (TuThien tu : tuList) {
%>
            <li>
                <h2><%= tu.getTen() %></h2>
                <p>Ngày bắt đầu: <%= tu.getNgayBatDau() %></p>
                <p>Ngày kết thúc: <%= tu.getNgayKetThuc() %></p>
                <p>Tổ chức: <%= tu.getToChuc() %></p>
                <p>Số điện thoại: <%= tu.getSdt() %></p>
                <p>Trạng thái: <%= tu.getTrangThai() %></p>
            </li>
<% 
        }
    }
%>

	
	<p>
	Welcome to the luv2code company home page!
	</p>
	
	<hr>
	
	<!-- display user name and role -->
	
	<p>
		User: <security:authentication property="principal.username" />
		<br><br>
		Role(s): <security:authentication property="principal.authorities" />
	</p>
	
	<security:authorize access="hasRole('MANAGER')">
	
		<!-- Add a link to point to /leaders ... this is for the managers -->
		
		<p>
			<a href="${pageContext.request.contextPath}/leaders">Leadership Meeting</a>
			(Only for Manager peeps)
		</p>

	</security:authorize>	
	
	
	<security:authorize access="hasRole('ADMIN')">  

		<!-- Add a link to point to /systems ... this is for the admins -->
		
		<p>
			<a href="${pageContext.request.contextPath}/systems">IT Systems Meeting</a>
			(Only for Admin peeps)
		</p>
	
	</security:authorize>
	
	<hr>
	
	
	<!-- Add a logout button -->
	<form:form action="${pageContext.request.contextPath}/logout" 
			   method="POST">
	
		<input type="submit" value="Logout" />
	
	</form:form>
	
</body>

</html>









