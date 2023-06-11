<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*, java.util.*"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>IPhone13</title>
    <link rel="stylesheet" href="assets/css/i13_product.css">
    <link rel="stylesheet" href="assets/css/product.css">
    <link rel="stylesheet" href="assets/css/headerr.css">
    <link rel="icon" href="images/tai/icon.jpg" type="image/x-icon"  >
    <script src="https://kit.fontawesome.com/605c912c10.js" crossorigin="anonymous"></script>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String phcolor = request.getParameter("color");
	String phname ="";
	int phprice = 0;
	String phmon ="";
	String phch = "";

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
			sql = "SELECT * FROM `products` WHERE `pdid` = 'P003'";
			rs=con.createStatement().executeQuery(sql);
			while (rs.next()){
				phname = rs.getString(3);
				phprice = rs.getInt(5);
				phmon = rs.getString(6);
				phch = rs.getString(7);}
			
			sql = "SELECT * FROM `pro_detail` WHERE `pdid` = 'P003'";
			rs=con.createStatement().executeQuery(sql);
//Step 5: 顯示結果            
		   int inventory = 0;
           while (rs.next()) //只有一筆資料
           {
           inventory = rs.getInt(3);
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
			
			<div class="righticon">
				<ul>						
				<li>
					<div class="search_wrap">
						<div class="search_box">
							<form action="search.jsp" method="post">
                                <input type="text" class="input" placeholder="search..." name="product_name">
                                <div class="btn" onclick="this.parentNode.submit()">
                                    <p><i class="fa-solid fa-magnifying-glass"></i></p>
                                </div>
                            </form>
						</div>
					</div>
				</li>

				<li>
                    <a href="userweb.jsp">
                    <i class="fa-solid fa-circle-user" id="iconuser" ></i>
                    </a>
                </li>
					
				<li>
                    <a href="shopcar.jsp">
                    <i class="fa-solid fa-cart-plus" id="iconcart"></i>
                    </a>
                </li>

				</ul>
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
        <!--幻燈片-->
        <section class="imgg"> 
            <div class="slideshow">
    
                <div class="Slides fade">
                    <img src="images/yi/apple/i13/IMG_3449.JPG">
                </div>
                <div class="Slides fade">
                    <img src="images/yi/apple/i13/IMG_3450.JPG">
                </div>
                <div class="Slides fade">
                    <img src="images/yi/apple/i13/IMG_3451.png" style="width: 250px;">
                </div>
                
                <div class="Slides fade">
                    <img src="images/yi/apple/i13/IMG_3455.JPG">
                </div>
                
            </div>
            
                <script>
                    var slideIndex = 0; //從第1張照片開始
                    showSlides();
        
                    function showSlides() {
                        var i;
                        var slides = document.getElementsByClassName("Slides"); 
                        
                        //隱藏幻燈片、只顯示一張幻燈片
                        for (i = 0; i < slides.length; i++) {
                            slides[i].style.display = "none";  
                        }
                        slideIndex++;
                        if (slideIndex > slides.length) { 
                            slideIndex = 1 
                        }
                        slides[slideIndex - 1].style.display = "block";
                        
                        setTimeout(showSlides, 2000); // 兩秒後換照片
                    }
                </script>
        </section>
        
        <div class="info">
            <h1 class="name"><%= phname%></h1>

            <div class="price">
                <h2 class="nt">NT.<%= phprice%></h2>
            </div>

            <div class="love">
                <a href="like.jsp?data=P003" style="text-decoration: none !important;position: relative;z-index: 2;">
					<img class="heart" src="images/yi/icon/heart.png" alt="加入最愛"/>
				</a>
            </div>

		 <form action="shop_record.jsp" method="post">
			  <input type="hidden" name="phone" value="Iphone13">

            <div>
                <h2 class="color">color</h2>
                <select class="choose" name="color">
                    <option value=""selected class="choose">請選擇顏色</option>
                    <option value="星光色" class="choose">星光色</option>
                    <option value="午夜色" class="choose">午夜色</option>
                    <option value="藍色" class="choose">藍色</option>
                    <option value="粉紅色" class="choose">粉紅色</option>
                    <option value="綠色" class="choose">綠色</option>
                    <option value="紅色" class="choose">紅色</option>
                </select>
            </div>
           <div class="number">
				<button class="less" type="button" onclick="minus(0)">-</button>
				<input class="quantity" type="text" value="1" name="num">
				<button class="add" type="button" onclick="add(0)">+</button>

				<input type="hidden" name="numberValue" id="numberValue">

				<button class="cart" style="position:relative; right:130px;" type="submit">ADD TO CART</button>庫存：<%out.println(inventory);%>
			  </div>
			</form>

            <script>
                function minus(ctnnum){
                    var num =Number(document.getElementsByClassName("quantity")[ctnnum].value);
                    if(num>1){
                        document.getElementsByClassName("quantity")[ctnnum].value=num-1;
                    }
                }
                function add(ctnnum) {
                    var num =Number(document.getElementsByClassName("quantity")[ctnnum].value);
                    if(num<1000){
                        document.getElementsByClassName("quantity")[ctnnum].value=num+1;
                    }
                }
            </script>

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
       

        
        <fieldset class="review">
            <legend class="rev"><h1>評論</h1></legend>
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
			
           sql="USE `product_search`";
           con.createStatement().execute(sql);
//Step 4: 執行 SQL 指令, 若要操作記錄集, 需使用executeQuery, 才能傳回ResultSet	
           sql="SELECT * FROM `board` WHERE board.product='i13'"; 
           ResultSet rs=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
           //ResultSet.TYPE_SCROLL_INSENSITIVE表紀錄指標可前後移動，ResultSet.CONCUR_READ_ONLY表唯讀

           
	       //計算開始記錄位置   
//Step 5: 顯示結果 

			rs.afterLast();
           while(rs.previous())
                {

				 out.println("<hr style=\"color: #686868; size: 3px;border-style: dotted;\">");
                 out.println("<img class=\"people\" src=\"images/people.png\" >");
                 out.println("<div class=\"sth\">");
                 out.println("<h3>"+rs.getString(1)+"</h3>");
                 out.println("<div class=\"commentstar\">");
                 for (int i=Integer.parseInt(rs.getString(2));i>0;i--){
					out.println("<span class=\"fa fa-star checked\"></span>");
				 }
				 out.println("</div>");
				 out.println("<p>"+rs.getString(3)+"</p>");
				 out.println("<p>"+rs.getString(4)+"</p>");
				 out.println("</div>");
          }
//Step 6: 關閉連線
          con.close();
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

            
        </fieldset>
        

        <section>
            <fieldset class="reviewbroad">
                <legend class="rev"><h1>評論版</h1></legend>
                <div  style="text-align: center;">
				<script>
                        String product = document.getElementById('name').toString();
                    </script>
                    <form action="review_board.jsp" method="get" >
						<input type="hidden" name="p_name" value="i13">
                        <input class="commentinput" type="text" placeholder="User Name" style="text-align: center;" name="name"><br><br>
                        <span class="star-rating" style="width:150px;height:30px">
                            <input type="radio" name="rating" value="1"><i></i>
                            <input type="radio" name="rating" value="2"><i></i>
                            <input type="radio" name="rating" value="3"><i></i>
                            <input type="radio" name="rating" value="4"><i></i>
                            <input type="radio" name="rating" value="5"><i></i>
                        </span>
                        <br><br>
                        <textarea name="review" id="" cols="122" rows="10" placeholder="Write Something...."></textarea><br>
                        <input type="submit" class="commentsubmit">
                    </form>
                </div>
            </fieldset>
        </section>
    </main>
    <footer class="footer">
			<hr style="border-color:rgb(43, 39, 39);">
			<h5>Copyrgiht @ 2023 By Starlink</h5>
			<iframe class="no-border" width="150" height="26" frameborder="0" scrolling="no" src="counter.jsp"></iframe>
		</footer>

    <a class="gotopbtn" href="#"><i class="fa-solid fa-arrow-up"></i></a>
</body>
</html>