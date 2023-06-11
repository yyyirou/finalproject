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
    <link rel="stylesheet" href="assets/css/OPPO.css">
	<link rel="stylesheet" href="assets/css/headerr.css">
    <link rel="icon" href="images/tai/icon.jpg" type="image/x-icon"  >
    <script src="https://kit.fontawesome.com/605c912c10.js" crossorigin="anonymous"></script>
</head>
<body>
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

	<main class="main">
	
	<%
	request.setCharacterEncoding("UTF-8");
	String phcolor = request.getParameter("color");
	String phname ="";
	int phprice = 0;
	String phmon ="";
	String phch = "";
	String phimg = "";
	String phclass = "";
	int phtotal = 0;

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
//Step 4: 執行 SQL 指令          
			sql = "SELECT * FROM `pro_detail` WHERE `pdkind` = 'OPPO'";
			rs=con.createStatement().executeQuery(sql);
//Step 5: 顯示結果            
		   int inventory = 0;
           while (rs.next()) //只有一筆資料
           {
			phtotal = rs.getInt(3);
           phname = rs.getString(4);
		   phimg = rs.getString(5);
		   phclass = rs.getString(6);
			if(phtotal==0){
				continue;
			}
			else{
				if (phclass.equals("Find_N2_flip")){
					out.println("<section class='card' style='position: relative;top: 28.5%;'>");
					out.println("<img class='"+phclass+"' src='"+phimg+"' alt='"+phclass+"'>");
					out.println("<h1>"+phname+"</h1>");
					out.println("<a href='"+phclass+"_product.jsp' target='_blank'>");
					out.println("<i class='fa-solid fa-arrow-right' id='iconarrow' ></i>");
					out.println("</a>");
					out.println("</section>");
				}
				else{
					out.println("<section class='card' style='position: relative;top: 15%;'>");
					out.println("<img class='"+phclass+"' src='"+phimg+"' alt='"+phclass+"'>");
					out.println("<h1>"+phname+"</h1>");
					out.println("<a href='"+phclass+"_product.jsp' target='_blank'>");
					out.println("<i class='fa-solid fa-arrow-right' id='iconarrow' ></i>");
					out.println("</a>");
					out.println("</section>");
				}
					
				
			}
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
	
	</main>
	<footer class="footer">
			<hr style="border-color:rgb(43, 39, 39);">
			<h5>Copyrgiht @ 2023 By Starlink</h5>
			<iframe class="no-border" width="150" height="26" frameborder="0" scrolling="no" src="counter.jsp"></iframe>
		</footer>
</body>
</html>