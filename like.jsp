<%@ page import="java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="config.jsp" %>

<html>
<head>
    <title>like</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String upphid = request.getParameter("data");
	int upmid = 0;
    String member = session.getAttribute("email").toString();
	
	if(member.equals("")){
		%>
		<script>
                alert("尚未登入 !!");
                window.location.href = "signin.jsp";
            </script><%
	}
	else{

    try {
        // Step 1: 載入資料庫驅動程式
        Class.forName("com.mysql.jdbc.Driver");
        try {
            // Step 2: 建立連線
            String url1 = "jdbc:mysql://localhost/?serverTimezone=UTC";
            Connection con1 = DriverManager.getConnection(url1, "root", "1234");
            if (con1.isClosed())
                out.println("連線建立失敗");
            else {
                // Step 3: 選擇資料庫
                String sql1 = "USE `product_search`";
                ResultSet rs;
                con1.createStatement().execute(sql1);
                // Step 4: 執行 SQL 指令, 只有一筆資料
                sql1 = "SELECT * FROM `members` WHERE `email` = '" + member + "'";
                rs = con1.createStatement().executeQuery(sql1);
				
				while (rs.next()){
					upmid = rs.getInt(1);
				}
				sql1 = "SELECT * FROM `products_like` WHERE `mid` = '" + upmid + "'";
                rs = con1.createStatement().executeQuery(sql1);
                // Step 5: 顯示結果
                    sql1 = "INSERT INTO `products_like`(`mid`, `pdid`) VALUES ('" + upmid + "','" + upphid + "')";
                    con1.createStatement().executeUpdate(sql1);

            }
            // Step 6: 關閉連線
            con1.close();
        } catch (SQLException sExec) {
            out.println("SQL錯誤" + sExec.toString());
        }
    } catch (ClassNotFoundException err) {
        out.println("class錯誤" + err.toString());
    }
	}
	
	response.sendRedirect("userweb.jsp");
%>
</body>
</html>
