<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*, java.util.*"%>
<%@include file="config.jsp" %>

<html>
<head>
<title>add</title>
</head>
<body>


<%  request.setCharacterEncoding("UTF-8")  ;%>

<%
	if (session.getAttribute("email")!= null){
		
		
//Step 3: 選擇資料庫   

           sql="use product_search";
           con.createStatement().execute(sql);
		   request.setCharacterEncoding("UTF-8");  
           String address = request.getParameter("address");
		   sql = "SELECT * FROM shop_car WHERE member = '" +session.getAttribute("email").toString()+ "'";
			ResultSet rs7 = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
			rs7.first();
			String name = rs7.getString(4);
			rs7.close();

		   

		   sql = "SELECT pdid FROM products WHERE pdname LIKE '%" + name + "%'";

		   ResultSet rs3=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
		    rs3.first();
			String pdid = rs3.getString(1);

			rs3.close();
			
			sql = "SELECT num FROM shop_car WHERE member = '" +session.getAttribute("email").toString()+ "'";
		   ResultSet rs2=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
		    rs2.afterLast();
			while(rs2.previous()){
				
				sql="INSERT INTO orders_detail(pdid,numbers) ";
				sql+="VALUES ('" + pdid + "', ";
				sql+=Integer. parseInt(rs2.getString(1))+");";	
				con.createStatement().execute(sql);
			}
			rs2.close();
			

			
//Step 6: 關閉連線
           con.close();
//Step 5: 顯示結果 
          //直接顯示最新的資料
		  response.sendRedirect("confirm.jsp");
      }
else{
	con.close();
	response.sendRedirect("signin.jsp");
}
%>

</body>
</html>
