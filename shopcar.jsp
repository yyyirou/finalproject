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

    <nav>
        <a href="shopcar.jsp">購物車</a>
        <a href="order.jsp">填寫資料</a>
        <a href="confirm.jsp">送出訂單</a>
    </nav>
    <main>
        <article>
		 <form action="go_to_check.jsp">
            <section class="word">
                <div class="shopcontainer">
                    <div class="shop_header">
                        <div class="item">商品</div>
                        <div class="price">價格</div>
                        <div class="number">數量</div>
                        <div class="extendprice">小計</div>
                    </div>

                   
					<%
	if (session.getAttribute("email") != null) {
		sql = "USE `product_search`";
		con.createStatement().execute(sql);
		String member = session.getAttribute("email").toString();
		sql = "SELECT * FROM `shop_car` WHERE member='" + member + "'";
		ResultSet rs = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
		rs.afterLast();
		int i = 0;
		while (rs.previous()) {
			i += 1;
%>
			<div class="shop_header shop_body">
				<div class="item">
					<div class="delete">
						<a href="delete_item.jsp?delete_id=<%= rs.getString(1) %>">
						  <img src="images/Lai/delete.png" width="20px" height="20px">
						</a>
					</div>
					<img src="<%= rs.getString(3) %>" width="100px" height="80px">
					<div class="name"><%= rs.getString(4) %></div>
				</div>
				<div class="price">
					<span id="onegoodprice"><%= rs.getString(5) %></span>
				</div>
				<div class="number">
					<input type="button" class="btn" value="-" onclick="minus<%= i %>(1)">
					<input type="text" class="input_num" value="<%= rs.getString(6) %>" id="a<%= i %>" name="n<%= i %>">
					<input type="button" class="btn" value="+" onclick="add<%= i %>(1)">
				</div>
				<div class="extendprice">
					<span id="extendedPrice<%= i %>"><%= rs.getString(7) %></span>
				</div>
			</div>

			<script>
				function minus<%= i %>(ctn_num) {
					
					var num<%= i %> = Number(document.getElementById('a<%= i %>').value);
					if (num<%= i %> > 1) {
						document.getElementById('a<%= i %>').value = num<%= i %> - 1;
						updateExtendedPrice<%= i %>();
					}
					
				}

				function add<%= i %>(ctn_num) {
					var num<%= i %> = Number(document.getElementById('a<%= i %>').value);
					if (num<%= i %> < 100) {
						document.getElementById('a<%= i %>').value = num<%= i %> + 1;
						updateExtendedPrice<%= i %>();
					}
					
				}

				function updateExtendedPrice<%= i %>() {
					var quantity = Number(document.getElementById('a<%= i %>').value);
					var price = Number(<%= rs.getString(5) %>);
					var extendedPrice = quantity * price;
					document.getElementById('extendedPrice<%= i %>').innerText = extendedPrice;
					setTotal();
				}
			</script>
<%
		}
	}
%>

</div>
</section>

<section class="pg">
	<div class="shopcontainer">
		<div class="infor_header">
			<div class="infor">購物車總計</div>
		</div>

		<div class="infor_header infor_body">
			<div class="passway">
				
					<div class="txt">
						運送方式：<div class="bar"><input placeholder="輸入你的地址以檢視運送選項" size="50" name="address"></div>
						<br>
						<div class="txt">
							訂單金額：<span id="ttttotal"></span>
						</div>
						<a href="index.html"><input type="button" class="orderbutton" value="回首頁"></a>
						<input type="submit" class="orderbutton" value="前往結帳">
					</div>
				
			</div>
		</div>
	</div>
</section>
</form>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


	<script>
  function setTotal() {
    var s = 0;
    $('.number').each(function () {
      var quantity = parseInt($(this).find('.input_num').val());
      var price = parseFloat($(this).siblings('.price').find('span').text());
      if (!isNaN(quantity) && !isNaN(price)) {
        s += quantity * price;
      }
    });
	
    document.getElementById('ttttotal').innerText = s.toFixed(2);
  }
  setTotal();
</script>


        </article>
    </main>
    

    
    <footer class="footer">
			<hr style="border-color:rgb(43, 39, 39);">
			<h5>Copyrgiht @ 2023 By Starlink</h5>
			<iframe class="no-border" width="150" height="26" frameborder="0" scrolling="no" src="counter.jsp"></iframe>
		</footer>

    <a class="gotopbtn" href="#"><i class="fa-solid fa-arrow-up"></i></a> 
	
</body>
</html>