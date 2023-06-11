<%@page import="java.sql.*" %>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <script>
        // 显示警告对话框并跳转回 shopcar.jsp 页面
        function showAlertAndRedirect() {
            alert("已刪除");
            window.location.href = "shopcar.jsp"; // 跳转回 shopcar.jsp 页面
        }
    </script>
</head>
<body>
<%
    String deleteID = request.getParameter("delete_id");

    // 建立数据库连接
    Connection con = null;
    PreparedStatement stmt = null;

    try {
        // 加载数据库驱动程序
        Class.forName("com.mysql.jdbc.Driver");

        // 建立数据库连接
        String url = "jdbc:mysql://localhost/product_search?serverTimezone=UTC";
        String username = "root";
        String password = "1234";
        con = DriverManager.getConnection(url, username, password);

        // 执行删除操作
        String deleteSql = "DELETE FROM shop_car WHERE delete_id = ?";
        stmt = con.prepareStatement(deleteSql);
        stmt.setString(1, deleteID);
        stmt.executeUpdate();

        // 调用 JavaScript 函数显示警告对话框并跳转回 shopcar.jsp 页面
        out.println("<script>showAlertAndRedirect();</script>");
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    } finally {
        // 关闭数据库连接
        try {
            if (stmt != null) {
                stmt.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
</body>
</html>
