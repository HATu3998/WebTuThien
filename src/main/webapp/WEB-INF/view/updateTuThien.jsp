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
    <h1>Update TuThien</h1>
    <p>"${error}"</p>
    <table>
        <thead>
            <tr>
              <th>id</th>
                <th>Ten</th>
                <th>NgayBatDau</th>
                <th>NgayKetThuc</th>
                <th>ToChuc</th>
                <th>SDT</th>
                <th>Tien</th>
                <th>TongTien</th>
                <th>TrangThai</th>
            </tr>
        </thead>
        <tbody>
            <form action="${pageContext.request.contextPath}/UpdateTuThienServlet" method="GET">
                <!-- Các trường thông tin quyên góp ở đây -->
                <tr>
                    <td><input type="hidden" name="id" placeholder="id" value="${tuThien.id}" ></td>
                    <td><input type="text" name="ten" placeholder="ten" value="${tuThien.ten}"></td>
                    <td><input type="hidden" name="ngayBatDau" placeholder="ngayBatDau" value="${tuThien.ngayBatDau}" ></td>
                    <td><input type="text" name="ngayKetThuc" placeholder="ngayKetThuc" value="0"></td>
                    <td><input type="text" name="toChuc" placeholder="toChuc" value="${tuThien.toChuc}"></td>
                    <td><input type="text" name="sdt" placeholder="sdt" value="${tuThien.sdt}"></td>
                    <td><input type="hidden" name="tien" placeholder="tien" value="${tuThien.tien}"  ></td>
                    <td><input type="text" name="tongTien" placeholder="tongTien" value="${tuThien.tongTien}"></td>
           <td>	<select name="trangThai">
    
            <option value="1" ${tuThien.trangThai == 1 ? 'selected' : ''}>mới khởi tạo</option>
            <option value="2" ${tuThien.trangThai == 2 ? 'selected' : ''}>đang quyên góp</option>
            <option value="3" ${tuThien.trangThai == 3 ? 'selected' : ''}>kết thúc quyên góp</option>
            <option value="4" ${tuThien.trangThai == 4 ? 'selected' : ''}>đóng quyên góp</option>
     
</select>

  		
        </td>
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
