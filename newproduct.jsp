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
	int pronum = 0;
	String phcolor = request.getParameter("color");
	int inventory = 0;
	String phname = request.getParameter("phname");
	String phprice = request.getParameter("phprice");
	String phmon =request.getParameter("phmon");
	String phch = request.getParameter("phch");
	String phnumon = request.getParameter("onnum");
	
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
                sql1 = "SELECT * FROM `products`";
				Statement statement = con1.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
				rs = statement.executeQuery(sql1);

				rs.last();
				pronum = rs.getRow();
					sql1 = "INSERT INTO `products`(`pdid`, `pdkind`, `pdname`, `price`, `monitor`, `chip`) VALUES ('P0"+(pronum+1)+"','Other','"+phname+"','"+phprice+"','"+phmon+"','"+phch+"')";
					con1.createStatement().executeUpdate(sql1);
				sql1 = "SELECT * FROM `products_color`";
                rs = con1.createStatement().executeQuery(sql1);
                // Step 5: 顯示結果
                    sql1 = "INSERT INTO `products_color`(`pdid`, `color`, `stock`) VALUES ('P0" + (pronum+1) + "','" + phcolor + "','"+phnumon+"')";
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
	
	
	out.print(phname+phcolor+pronum+phprice+phmon+phnumon+phch);
%>
</body>
</html>
