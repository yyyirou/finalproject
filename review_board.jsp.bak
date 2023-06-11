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
           String new_name = request.getParameter("name");
		   String new_rating = request.getParameter("rating");
		   String new_review = request.getParameter("review");
           java.sql.Date new_date=new java.sql.Date(System.currentTimeMillis());
//Step 4: 執行 SQL 指令	
			
           sql="INSERT INTO board(name,rating,date,comment,product) ";
           sql+="VALUES ('" + new_name + "', ";
           sql+="'"+new_rating+"', ";
		   sql+="'"+new_date+"', ";
		   sql+="'"+new_review+"', ";
		   sql+="'IPhone_11')";		   

           con.createStatement().execute(sql);
//Step 6: 關閉連線
           con.close();
//Step 5: 顯示結果 
          //直接顯示最新的資料
           response.sendRedirect("i11_product.jsp");
       }
else{
	con.close();
	response.sendRedirect("signin.jsp");
}
%>

</body>
</html>
