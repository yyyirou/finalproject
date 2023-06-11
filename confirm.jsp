<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*, java.util.*"%>
<%@include file="config.jsp" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <title>Solid State by HTML5 UP</title>
    <link rel="stylesheet" href="assets/css/style.css">
	<link rel="stylesheet" href="assets/css/gotop.css" />
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
                    <a href="shopcar.html">
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
			
				<a href="Apple.html" >
					<i class="fa-brands fa-apple"></i>
					<span>Apple</span>
				</a>
			
				<a href="Pixel.html">
					<i class="fa-brands fa-google"></i>
					<span>Pixel</span>
				</a>
			
				<a href="Sony.html">
					<i class="fa-solid fa-mobile-screen"></i>					  
					<span>Sony</span>
				</a>
			
				<a href="OPPO.html">
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

    <nav>
        <a href="shopcar.jsp">購物車</a>
        <a href="order.jsp">填寫資料</a>
        <a href="jsp">送出訂單</a>
    </nav>

    <script>
        function minus(ctn_num){
            var num = Number(document.getElementsByClassName("input_num")[ctn_num].value);
            if(num > 1){
                document.getElementsByClassName("input_num")[ctn_num].value = num -1;
            }
        }

        function add(ctn_num){
            var num = Number(document.getElementsByClassName("input_num")[ctn_num].value);
            if(num < 100){
                document.getElementsByClassName("input_num")[ctn_num].value = num +1;
            }
        }
    </script>

    <main>
        <article>
            <section class="word">
                <div class="shopcontainer">
                    <div class="infor_header">
                        <div class="infor">訂單送出資訊</div>
                    </div>

                    <div class="shop_header shop_body">
                        <div class="infor02">
                            <p>恭喜您已送出訂單！<br>♡ 我們將盡快安排出貨 ♡</p>
                        </div>
                        
                    </div>

            </section>
        </article>
    </main>

    <div>
        <a href="order.jsp"><input type="button" class="orderbutton" value="回上頁"></a>
        <a href="index.html"><input type="button" class="orderbutton" value="回首頁"></a>
    </div>
	
	
    <footer class="footer">
		<hr style="border-color:rgb(43, 39, 39);">
		<h5>Copyrgiht @ 2023 By Starlink</h5>
		<iframe class="no-border" width="150" height="26" frameborder="0" scrolling="no" src="counter.jsp"></iframe>
	</footer>

	<a class="gotopbtn" href="#"><i class="fa-solid fa-arrow-up"></i></a>
</body>
</html>