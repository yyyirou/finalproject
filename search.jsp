<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*, java.util.*"%>


<html>
<head>
<title>search</title>
</head>
<body>


<%  request.setCharacterEncoding("UTF-8")  ;%>

<%
		try {
			
//Step 1: 載入資料庫驅動程式 
    Class.forName("com.mysql.jdbc.Driver");
    try {
//Step 2: 建立連線 	
        String url="jdbc:mysql://localhost/?serverTimezone=UTC";
        String sql="";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("連線建立失敗");
        else {
//Step 3: 選擇資料庫   

           sql="use product_search";
           con.createStatement().execute(sql);
		   request.setCharacterEncoding("UTF-8");  
           String name = request.getParameter("product_name");
		   
//Step 4: 執行 SQL 指令	
			
           sql="SELECT * FROM product_search.search WHERE product_search.search.product_name LIKE \'%"+name+"%\';";
           ResultSet rs=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
		   rs.first();
		   String result = rs.getString(2);
//Step 6: 關閉連線
           con.close();
//Step 5: 顯示結果 
          //直接顯示最新的資料
           response.sendRedirect(result);
       }
    }
    catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
    }
		}
catch (ClassNotFoundException err) {
   out.println("class錯誤"+err.toString());
}
	

%>

</body>
</html>
