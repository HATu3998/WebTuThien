<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <h1>Update User</h1>
   <c:if test="${not empty error}">
    <p style="color: red">${error}</p>
</c:if>
    <table>
        <thead>
            <tr>
             
                <th>Ten</th>
                <th>email</th>
                <th>sdt</th>
                <th>username</th>
               
              
            </tr>
        </thead>
        <tbody>
            <form action="${pageContext.request.contextPath}/UpdateUserServlet" method="GET">
                <!-- Các trường thông tin quyên góp ở đây -->
                <tr>
                    <td><input type="text" name="ten" placeholder="ten" value="${infoList.hoTen}" ></td>
                    <td><input type="text" name="email" placeholder="email" value="${infoList.email}"></td>
                    <td><input type="text" name="sdt" placeholder="sdt" value="${infoList.sdt}" ></td>
                  <td><input type="hidden" name="username" placeholder="username" value="${infoList.user.username}" >
                  <p>${infoList.user.username}</p></td>
                </tr>
                <tr>
                    <td colspan="9" style="text-align: center;">
                        <button type="submit">Gửi quyên góp</button>
                    </td>
                </tr>
            </form>
        </tbody>
    </table>
</body>
</html>
