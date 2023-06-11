<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="assets/css/seller_reno8tdel.css">
    <link rel="stylesheet" href="assets/css/seller_del2.css">
    <link rel="stylesheet" href="assets/css/headerr.css">
    <link rel="icon" href="images/tai/icon.jpg" type="image/x-icon"  >
    <script src="https://kit.fontawesome.com/605c912c10.js" crossorigin="anonymous"></script>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
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
			sql = "SELECT * FROM `products` WHERE `pdid` = 'P007'";
			rs=con.createStatement().executeQuery(sql);
			while (rs.next()){
				phname = rs.getString(3);
				phprice = rs.getInt(5);
				phmon = rs.getString(6);
				phch = rs.getString(7);}
			
			sql = "SELECT * FROM `products_color` WHERE `pdid` = 'P007' AND `color`= '"+phcolor+"'";
			rs=con.createStatement().executeQuery(sql);
//Step 5: 顯示結果            
           while (rs.next()) //只有一筆資料
           {
			   inventory = rs.getInt(4);
			   if(inventory==0){
				   %> 
				   <script>
					alert("庫存已為0");
				   </script>
				   <%
			   }
			   else{
			   inventory = inventory-Integer.parseInt(phnumon);}
			   // 使用预处理语句构建SQL语句
				String updateSql = "UPDATE `products_color` SET `stock` = ? WHERE `pdid` = 'P007' AND `color` = ?";
				PreparedStatement updateStmt = con.prepareStatement(updateSql);

				// 设置参数值
				updateStmt.setInt(1, inventory);
				updateStmt.setString(2, phcolor);

				// 执行更新语句
				updateStmt.executeUpdate();
			   
		   }%>

    <!-- Page Wrapper -->
    <div id="page-wrapper">

	    <header id="header" class="">
			<!-- Header -->
				
			<div class="logo">
				<a href="index.html">
				<img src="images/tai/icon.jpg" width="20%" >
				</a>
			</div>
			
		</header>

			<!-- Menu -->
			<div style=" position: absolute; z-index:200 ">
				<input type="checkbox" id="check">
				<label for="check">
				<i class="fas fa-bars" id="btn"></i>
				<i class="fas fa-times" id="cancel"></i>
				</label>

				<div class="sidebar">
				<a href="index.html" class="active">
						<i class="fa-solid fa-house"></i>
						<span>Home</span>
				</a>
			
				<a href="Apple.jsp" >
					<i class="fa-brands fa-apple"></i>
					<span>Apple</span>
				</a>
			
				<a href="Pixel.jsp">
					<i class="fa-brands fa-google"></i>
					<span>Pixel</span>
				</a>
			
				<a href="Sony.jsp">
					<i class="fa-solid fa-mobile-screen"></i>					  
					<span>Sony</span>
				</a>
			
				<a href="OPPO.jsp">
					<i class="fa-solid fa-mobile"></i>
					<span>OPPO</span>
				</a>

				<a href="login.html">
					<i class="fa-regular fa-user"></i>
					<span>Log IN</span>
				</a>


				<a href="signin.jsp">
					<i class="fa-regular fa-user"></i>
					<span>Sign IN</span>
				</a>
                
                <a href="logout.jsp" >
                    <i class="fa-regular fa-user"></i>
                    <span>Sign OUT</span>
                </a>
			    </div>
		    </div>	
	    </div>

    <main>
        <div class="imgg">
            <img class="reno8t" src="images/yi/OPPO/Reno8 T/IMG_3466.PNG" alt="reno8t">
        </div>
        
        
        <div class="info">
            <h1 class="name"><%= phname%></h1>
            <div class="price">
                <h2 class="nt">NT.<%= phprice%></h2>
            </div>

            <div class="love">
                <img class="heart" src="images/yi/icon/heart.png" alt="加入最愛">
            </div>

		<form method="post" action="" accept-charset="UTF-8">
            <div>
                <h2 class="color">color</h2>
                <select class="choose" name="color">
                    <option value=""selected class="choose">請選擇顏色</option>
                    <option value="晨光金" class="choose">晨光金</option>
                    <option value="午夜黑" class="choose">午夜黑</option>
                </select>
            </div>
            <h2 class="color">下架數量</h2>
			<div class="number" style="height:70px;">
				<input name="onnum" type="text" value="1" style="text-alien:center;">
			</div>

            <div>
				<input type="submit" value="下架" class="button"/>庫存：<%out.println(inventory);%>
		</form>
		<form method="post" action="delete.jsp" accept-charset="UTF-8">
				<input type="hidden" name="productId" value="P007">
				<input type="submit" value="刪除" class="button"/>
            </div>
        </form>
            
        </div>
       
        <fieldset class="introduce">
            <legend class="intro"><h1>規格介紹</h1></legend>
                <h2>顯示器</h2><br>
                <p>
                <li>
                <%= phmon%>
                </li>
                </p><br>
                <h2>晶片</h2><br>
                <p>
                <li>
                <%= phch%>
                </li>
                </p>
        </fieldset>

    </main>
    <footer class="footer">
			<hr style="border-color:rgb(43, 39, 39);">
			<h5>Copyrgiht @ 2023 By Starlink</h5>
			<iframe class="no-border" width="150" height="26" frameborder="0" scrolling="no" src="counter.jsp"></iframe>
		</footer>

    <a class="gotopbtn" href="#"><i class="fa-solid fa-arrow-up"></i></a>
	
	<% }
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
%>
</body>
</html>