
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>

<head>
	<title>luv2code SYSTEMS Home Page</title>
</head>

<body>

<h2>luv2code SYSTEMS Home Page</h2>

<hr>
<h3>Tạo dự án</h3>
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

<hr>

<a href="${pageContext.request.contextPath}/">Back to Home Page</a>

</body>

</html>









