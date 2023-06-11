<%@ page contentType="text/html;charset=utf-8" language="java" import="java.sql.*" %>
<%@ include file="config.jsp" %>

<%
if (session.getAttribute("email") != null) {
    // Retrieve the values from the request parameters
    String newUsername = request.getParameter("username");
    String newPwd = request.getParameter("pwd");
    String newEmail = request.getParameter("email");
    String newTel = request.getParameter("tel");

    if (newUsername != null && newPwd != null && newEmail != null && newTel != null) {
        // Establish a database connection
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/product_search?serverTimezone=UTC", "root", "1234");

        // Update the fields
        String updateSql = "UPDATE product_search.members SET `username`=?, `pwd`=?, `email`=?, `tel`=? WHERE `email`=?";
        PreparedStatement updateStmt = connection.prepareStatement(updateSql);
        updateStmt.setString(1, newUsername);
        updateStmt.setString(2, newPwd);
        updateStmt.setString(3, newEmail);
        updateStmt.setString(4, newTel);
        updateStmt.setString(5, (String) session.getAttribute("email"));
        updateStmt.executeUpdate();
        updateStmt.close();

        connection.close();
%>
        <script>
			alert("更新成功!正在跳轉回會員頁面");
			window.location.href = "userweb.jsp";
		</script>
<%
    } else {
%>
        <script>
			alert("更新失敗!正在跳轉回會員頁面");
			window.location.href = "user.jsp";
		</script>
<%
    }
} else {
%>
<script>
    alert("尚未登入 !!");
    window.location.href = "signin.jsp";
</script>
<%
}
%>