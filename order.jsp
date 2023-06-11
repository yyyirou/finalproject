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
                    <div class="shop_header">
                        <div class="item">商品</div>
                        <div class="price">價格</div>
                        <div class="number">數量</div>
                        <div class="extendprice">小計</div>
                    </div>
<form action="send_order.jsp">
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
					var price = Number(<%= rs.getString(5) %>); // Replace 'price' with the actual column name for the item's price
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
                <div class="info0"> <!--總計-->
                    <p>運費 : <span>$</span>60</p><br>
                    <p >總計 : <span id="ttttotal">$</span>
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
	s=s+60;
	
    document.getElementById('ttttotal').innerText = s.toFixed(2);
  }
  setTotal();
</script>


					</p>
                </div>
            </section>

            <section class="pg">
			<%
			if (session.getAttribute("email")!= null){
		
		
//Step 3: 選擇資料庫   
			
			Class.forName("com.mysql.jdbc.Driver");
	String url2="jdbc:mysql://localhost/?serverTimezone=UTC";
    Connection con2 = DriverManager.getConnection(url2, "root", "1234");
           sql="use product_search";
           con2.createStatement().execute(sql);
		   request.setCharacterEncoding("UTF-8");
String email = session.getAttribute("email").toString();


sql = "SELECT * FROM members WHERE email = '" + email + "'";
ResultSet rs7 = con2.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
rs7.first();
String name = rs7.getString(3);
String tel = rs7.getString(4);
rs7.close();

sql = "SELECT address FROM shop_car WHERE member='" + email + "'";
ResultSet rs2 = con2.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
rs2.first();
String address = rs2.getString(1);
rs2.close();

out.print("<div class=\"shopcontainer\">");
out.print("<div class=\"infor_header\">");
out.print("<div class=\"infor\">顧客個人資訊</div>");
out.print("</div>");

out.print("<div class=\"infor_header infor_body\">");
out.print("<div class=\"info\">");
out.print("<p>姓名 : <input type=\"text\" size=\"20\" value=\"" + name + "\"><br></p>");
out.print("<p>電話 : <input type=\"text\" size=\"20\" value=\"" + tel + "\"><br></p>");
out.print("</div>");

out.print("<div class=\"info\">");
out.print("<p>電子郵件 : <input type=\"text\" size=\"20\" value=\"" + email + "\"><br></p>");
out.print("<p>收件地址 : <input type=\"text\" size=\"20\" value=\"" + address + "\"><br></p>");
out.print("</div>");

out.print("<div class=\"info\">");
out.print("<p>發票 : <select>");
out.print("<option>電子發票</option>");
out.print("<option>捐贈發票</option>");
out.print("<option>三聯式發票</option></select><br></p>");
out.print("<p>發票載具 : <input type=\"text\" size=\"20\"><br></p>");
out.print("</div>");

out.print("</div>");
out.print("</div>");

		   
		   
		   
//Step 6: 關閉連線
           con2.close();
//Step 5: 顯示結果 
          //直接顯示最新的資料
      }
else{
	//con2.close();
	response.sendRedirect("signin.jsp");
}
			%>
			
                
            </section>
        </article>
    </main>

    <div>
	
        <a href="shopcar.jsp"><input type="button" class="orderbutton" value="回上頁"></a>
        <a href="confirm.jsp"><input type="submit" class="orderbutton" value="送出訂單"></a>
</form>
    </div>
         
    
    <footer class="footer">
			<hr style="border-color:rgb(43, 39, 39);">
			<h5>Copyrgiht @ 2023 By Starlink</h5>
			<iframe class="no-border" width="150" height="26" frameborder="0" scrolling="no" src="counter.jsp"></iframe>
		</footer>

    <a class="gotopbtn" href="#"><i class="fa-solid fa-arrow-up"></i></a>
	
</body>
</html>