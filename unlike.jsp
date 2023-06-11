<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	
<html>
<head><title>unlike</title></head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String dephid = request.getParameter("data1");
	String deuid = request.getParameter("data2");
	


try {
//Step 1: 載入資料庫驅動程式 
    Class.forName("com.mysql.jdbc.Driver");
    try {
//Step 2: 建立連線 
        String url="jdbc:mysql://localhost/?serverTimezone=UTC";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("連線建立失敗");
        else
        {
//Step 3: 選擇資料庫	        
           String sql="USE `product_search`";
           ResultSet rs;
		   con.createStatement().execute(sql);
//Step 4: 執行 SQL 指令, 只有一筆資料  

			sql = "SELECT * FROM `products_like` WHERE `mid` = "+deuid;
			rs=con.createStatement().executeQuery(sql);
			
//Step 5: 顯示結果            
           while (rs.next()) //只有一筆資料
           {
			    sql = "DELETE FROM `products_like` WHERE `pdid` = '"+dephid+"'";
				con.createStatement().execute(sql);

		   }
		   
		}
	//Step 6: 關閉連線
        con.close();
		}
    catch (SQLException sExec) {
        out.println("SQL錯誤"+sExec.toString());
    }
}
catch (ClassNotFoundException err) {
   out.println("class錯誤"+err.toString());
}
	response.sendRedirect("userweb.jsp");
%>
</body>
</html>