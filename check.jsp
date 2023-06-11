<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
if (request.getParameter("email") != null && request.getParameter("pwd") != null) {
    String query = "SELECT * FROM product_search.members WHERE email=? AND pwd=?";
    PreparedStatement pstmt = null;
    ResultSet paperrs = null;
    
    try {
        pstmt = con.prepareStatement(query);
        pstmt.setString(1, request.getParameter("email"));
        pstmt.setString(2, request.getParameter("pwd"));
        paperrs = pstmt.executeQuery();

        if (paperrs.next()) {
            String role = paperrs.getString("role");
            session.setAttribute("email", request.getParameter("email"));
            session.setAttribute("role", role);
            if (role.equals("admin")) {
                response.sendRedirect("seller_index.html");
            } else {
                response.sendRedirect("userweb.jsp");
            }
        } else {
            %>
            <script>
                alert("密碼帳號不符 !!");
                window.location.href = "signin.jsp";
            </script>
            <%
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (paperrs != null) {
            try {
                paperrs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
%>
