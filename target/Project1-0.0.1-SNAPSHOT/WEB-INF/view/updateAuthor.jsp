<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update TuThien</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        h1 {
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        input[type="text"] {
            padding: 5px;
            width: 100%;
            box-sizing: border-box;
        }

        button[type="submit"] {
            padding: 8px 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }

        button[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<security:authorize access="hasRole('ADMIN')">
    <h1>Update User</h1>
   <c:if test="${not empty error}">
    <p style="color: red">${error}</p>
</c:if>
    <table>
        <thead>
            <tr>
             
                <th>Ten</th>
               
               
              
            </tr>
        </thead>
        <tbody>
     <form action="${pageContext.request.contextPath}/UpdateAuthority" method="get">
    <tr>
        <td><input type="text" name="user" placeholder="username" value="${authorList.user.username}" ></td>
    </tr>

           
     
            <tr>
                <td>
                    <input type="radio" name="authority" value="ROLE_EMPLOYEE" checked> ROLE_EMPLOYEE
                </td>
            </tr>
            <tr>
                <td>
                    <input type="radio" name="authority" value="ROLE_ADMIN"> ROLE_ADMIN
                </td>
            </tr>
     
    <tr>
    <c:if test="${authorList.authority eq 'ROLE_EMPLOYEE'}">
        <td colspan="9" style="text-align: center;">
            <button type="submit">Gửi quyên góp</button>
        </td>
        </c:if>
         <c:if test="${authorList.authority eq 'ROLE_ADMIN'}">
        <td colspan="9" style="text-align: center;">
          <p>Admin </p>
        </td>
        </c:if>
    </tr>
</form>


        </tbody>
    </table>
    </security:authorize>
</body>
</html>
