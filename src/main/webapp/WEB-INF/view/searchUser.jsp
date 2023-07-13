<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="com.luv2code.springsecurity.entity.*"%>
<%@ page import="java.util.List"%>
<html>
<head>
    <title>Kết quả tìm kiếm</title>
</head>
<body>
    <h2>Kết quả tìm kiếm</h2>
    
    <table>
        <tr>
            <th>ID</th>
            <th>Họ tên</th>
            <th>Email</th>
            <th>Số điện thoại</th>
            <th>Người dùng</th>
        </tr>
        
        <c:forEach items="${searchResults}" var="info">
            <tr>
                <td>${info.id}</td>
                <td>${info.hoTen}</td>
                <td>${info.email}</td>
                <td>${info.sdt}</td>
                <td>${info.user.username}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
