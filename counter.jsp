<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.ResultSet, java.sql.SQLException" %>

<%
try {
    // Step 1: 載入資料庫驅動程式
    Class.forName("com.mysql.cj.jdbc.Driver");
    try {
        // Step 2: 建立連線
        String url = "jdbc:mysql://localhost/?serverTimezone=UTC";
        String sql;
        Connection con = DriverManager.getConnection(url, "root", "1234");
        if (con.isClosed())
            out.println("连接建立失败");
        else {
            // Step 3: 選擇資料庫
            sql = "USE product_search;";
            con.createStatement().execute(sql);

            // Step 4: 執行 SQL 指令
            sql = "SELECT * FROM counter;";
            ResultSet rs = con.createStatement().executeQuery(sql);

            // Step 5: 顯示結果
            if (rs.next()) {
				String countString = rs.getString(1);
				int count = Integer.parseInt(countString);
				if (session.isNew()) {
					count = count + 1;
					countString = String.valueOf(count);
					sql = "UPDATE counter SET count=" + countString;
					con.createStatement().execute(sql);
				}
				out.println("瀏覽人數: " + count);
			} else {
				// 如果没有记录，则将计数器初始值设置为100
				int count = 100;
				String countString = String.valueOf(count);
				sql = "INSERT INTO counter (count) VALUES (" + countString + ")";
				con.createStatement().execute(sql);
				out.println("瀏覽人數: " + count);
			}
        }
        // Step 6: 關閉連線
        con.close();
    } catch (SQLException sExec) {
        out.println("SQL错误" + sExec.toString());
    }
} catch (ClassNotFoundException err) {
    out.println("类错误" + err.toString());
}
%>
