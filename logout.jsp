<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="config.jsp" %>
<%
    if (session.getAttribute("email") != null) {
        // 清除 session 中的資料
        session.invalidate();
        // 將使用者重新導向至登入頁面
        response.sendRedirect("signin.jsp");
    } else {
%>
        <script>
            alert('您尚未登入，無法進行登出操作！');
            window.location.href = 'index.html';
        </script>
<%
    }
%>
