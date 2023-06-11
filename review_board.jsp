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
		   String product = request.getParameter("p_name");
		   String member =  session.getAttribute("email").toString();
		   
           java.sql.Date new_date=new java.sql.Date(System.currentTimeMillis());
//Step 4: 執行 SQL 指令	
			
           sql="INSERT INTO board(name,rating,date,comment,product,member) ";
           sql+="VALUES ('" + new_name + "', ";
           sql+="'"+new_rating+"', ";
		   sql+="'"+new_date+"', ";
		   sql+="'"+new_review+"', ";
			sql+="'"+product+"', ";
		   sql+="'"+member+"')";	
		  
           con.createStatement().execute(sql);
		   sql = "SELECT * FROM product_search.search WHERE product_search.search.product_name LIKE '%" + product + "%';";

           ResultSet rs=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
		   rs.first();
		   String result = rs.getString(2);	  
		   
//Step 6: 關閉連線
           con.close();
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
