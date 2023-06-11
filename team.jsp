<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.ResultSet, java.sql.SQLException" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>三之熬夜狗</title>
    <style>
        .container {
            display: flex;
            justify-content: space-between;
        }

        .box {
            width: 30%;
            background-color: #f2f2f2;
            border-radius: 10px;
            padding: 20px;
            text-align: center;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .image {
            display: block;
            margin-bottom: 10px;
            border-radius: 50%;
            width: 100px;
            height: 100px;
            object-fit: cover;
        }
    </style>
</head>
<body>
    <div class="container">
        <% 
        try {
            // Step 1: 載入資料庫驅動程式
            Class.forName("com.mysql.cj.jdbc.Driver");
            try {
                // Step 2: 建立連線
                String url = "jdbc:mysql://localhost/?serverTimezone=UTC";
                Connection con = DriverManager.getConnection(url, "root", "1234");
                if (con.isClosed())
                    out.println("连接建立失败");
                else {
                    // Step 3: 执行查询
					String sql = "USE product_search;";
					con.createStatement().execute(sql);

					sql = "SELECT photo_url, text_content FROM reflection";
					ResultSet rs = con.createStatement().executeQuery(sql);


                    // Step 4: 显示结果
                    while (rs.next()) {
                        String photo_url = rs.getString("photo_url");
                        String text_content = rs.getString("text_content");

                        %>
                        <div class="box">
                            <img class="image" src="<%= photo_url %>" alt="Image">
                            <p><%= text_content %></p>
                        </div>
                        <%
                    }
                }
                // Step 5: 关闭连接
                con.close();
            } catch (SQLException sExec) {
                out.println("SQL错误" + sExec.toString());
            }
        } catch (ClassNotFoundException err) {
            out.println("类错误" + err.toString());
        }
        %>
    </div>
</body>
</html>
