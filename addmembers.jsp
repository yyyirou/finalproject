<%@ page import="java.sql.*, java.io.*" %>
<%@ include file="config.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>新增會員</title>
    <script type="text/javascript">
        function showError(message) {
            alert(message);
            history.back(); // 返回上一頁
        }
    </script>
</head>
<body>
<%
try {
    request.setCharacterEncoding("UTF-8");

    // 获取用户输入的数据
    String new_username = request.getParameter("username");
    String new_gender = request.getParameter("gender");
    String new_email = request.getParameter("email");
    String new_tel = request.getParameter("tel");
    String new_pwd = request.getParameter("pwd");
    String confirm_pwd = request.getParameter("pwd_confirm");

    if (!new_pwd.equals(confirm_pwd)) {
        // 密码不匹配，进行相应处理
        out.println("<script>showError('密碼不匹配，请重新输入密码！');</script>");
    } else if (new_username.isEmpty() || new_email.isEmpty() || new_tel.isEmpty() || new_pwd.isEmpty() || confirm_pwd.isEmpty()) {
        // 有必填欄位未填寫，進行相應處理
        out.println("<script>showError('請填寫所有必填欄位！');</script>");
    } else {
        // 密码匹配且所有必填欄位已填寫，執行插入操作
        // Step 2: 建立連線 	
        String dbUrl = "jdbc:mysql://localhost/product_search?serverTimezone=UTC";
        Connection connection = DriverManager.getConnection(dbUrl, "root", "1234");
        if (connection.isClosed())
            out.println("連線建立失敗");
        else {
            // Step 3: 执行 SQL 指令	
            String insertSql = "INSERT INTO `members` (`pwd`, `username`, `tel`, `email`, `gender`, `role`) ";
            insertSql += "VALUES (?, ?, ?, ?, ?, ?)";

            // 使用 PreparedStatement 来执行 SQL，使用参数来防止 SQL 注入
            PreparedStatement preparedStatement = connection.prepareStatement(insertSql);
            preparedStatement.setString(1, new_pwd);
            preparedStatement.setString(2, new_username);
            preparedStatement.setString(3, new_tel);
            preparedStatement.setString(4, new_email);
            preparedStatement.setString(5, new_gender);
            preparedStatement.setString(6, "member"); // 設定角色為 "member"

            preparedStatement.executeUpdate();
            preparedStatement.close();

            // Step 4: 關閉連線
            connection.close();

            // Step 5: 顯示結果 
            response.sendRedirect("finished.html");
        }
    }
} catch (SQLException sExec) {
    out.println("SQL錯誤" + sExec.toString());
} catch (UnsupportedEncodingException e) {
    e.printStackTrace();
}
%>
</body>
</html>
