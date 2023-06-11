<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*, java.util.*"%>
<%@include file="config.jsp" %>

<html>
<head>
<title>shop_record</title>
</head>
<body>


<%  request.setCharacterEncoding("UTF-8")  ;%>

<%
	if (session.getAttribute("email")!= null){
		
		
//Step 3: 選擇資料庫   

           sql="use product_search";
           con.createStatement().execute(sql);
		   request.setCharacterEncoding("UTF-8");  
           String phone = request.getParameter("phone");
		   
		   String color = request.getParameter("color");
		   int num = Integer.parseInt(request.getParameter("num"));
		   String member =  session.getAttribute("email").toString();
			
//Step 4: 執行 SQL 指令
			
			//圖片路徑
			sql = "SELECT p_name FROM product_name WHERE phone LIKE '" +phone+"';";
			ResultSet rs=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
			rs.first();
			String p_name = rs.getString(1);
			rs.close();
			
			sql = "SELECT imgurl FROM product_img WHERE class LIKE \'%"+p_name+"%\'";
			ResultSet rs2=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
			rs2.first();
			String img = rs2.getString(1);
			rs2.close();
			
			
			//價格

			sql="SELECT price FROM products WHERE pdname LIKE \'"+phone+"\'";
			ResultSet rs3=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
			rs3.first();
			
			int price =Integer. parseInt(rs3.getString(1));
			
			//小計
			int total = price*num;
			
			
		
			
			
			
			
           sql="INSERT INTO shop_car(member,pic,name,price,num,total,color) ";
           sql+="VALUES ('" + member + "', ";
           sql+="'"+img+"', ";
		   sql+="'"+phone+"', ";
		   sql+=price+", ";
		   sql+=num+", ";
		   sql+=total+", ";
		   sql+="'"+color+"')";		   
		  
           con.createStatement().execute(sql);
		   sql = "SELECT * FROM product_search.search WHERE product_search.search.product_name LIKE '" + p_name + "';";
           ResultSet rs4=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
		   rs4.first();
		   String result = rs4.getString(2);
		   rs4.close();
		
			
		//減少庫存
		sql="SELECT pdid FROM products WHERE pdname='"+phone+"'";
		ResultSet rs6=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
		rs6.first();
		String pdid = rs6.getString(1);
		rs6.close();
		
		sql = "SELECT stock FROM products_color WHERE color='"+color+"' AND pdid='"+pdid+"'";
		ResultSet rs5=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
		rs5.first();
		int stock = Integer. parseInt(rs5.getString(1));
		stock-=num;
		rs5.close();
		sql = "UPDATE products_color SET stock="+stock+" WHERE color='"+color+"' AND pdid='"+pdid+"'";
		con.createStatement().execute(sql);
//Step 6: 關閉連線
           con.close();%>
		   
		   <script>
                alert("新增成功 !!");
            </script><%
			
//Step 5: 顯示結果 
          //直接顯示最新的資料
			response.sendRedirect(result);
     }
else{
	con.close();
	response.sendRedirect("signin.jsp");
}
%> 

</body>
</html>
