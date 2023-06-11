<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>刪除作業</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String phid = request.getParameter("productId");
	String phcolor = request.getParameter("color");
	int inventory = 0;
	String phname ="";
	int phprice = 0;
	String phmon ="";
	String phch = "";
	String phimg = "";
	String phclass = "";
	String phnumon = request.getParameter("onnum");


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
			sql = "SELECT * FROM `pro_detail` WHERE `pdid` = '"+phid+"'";
			rs=con.createStatement().executeQuery(sql);
			while (rs.next()){
				phclass = rs.getString(6);
			}

			sql = "SELECT * FROM `products_color` WHERE `pdid` = '"+phid+"'";
			rs=con.createStatement().executeQuery(sql);
			
//Step 5: 顯示結果            
           while (rs.next()) //只有一筆資料
           {
			   // 使用预处理语句构建SQL语句
				String updateSql = "UPDATE `products_color` SET `stock` = ? WHERE `pdid` = ? ";
				PreparedStatement updateStmt = con.prepareStatement(updateSql);

				// 设置参数值
				updateStmt.setInt(1,0);
				updateStmt.setString(2, phid);

				// 执行更新语句
				updateStmt.executeUpdate();
			   
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
if (phclass.equals("Find_N2_flip")){
	response.sendRedirect("seller_findn2del.jsp");
}
else if(phclass.equals("Reno8")){
	response.sendRedirect("seller_reno8del.jsp");
}
else if(phclass.equals("Reno8t")){
	response.sendRedirect("seller_reno8tdel.jsp");
}
else if(phclass.equals("Reno8z")){
	response.sendRedirect("seller_reno8zdel.jsp");
}
else{
	response.sendRedirect("seller_"+phclass+"del.jsp");
}
%>
</body>
</html>