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
        <a href="shopcar.html">購物車</a>
        <a href="order.html">填寫資料</a>
        <a href="confirm.html">送出訂單</a>
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

                    
					
					<%
	if (session.getAttribute("email")!= null){
		
		
//Step 3: 選擇資料庫   

            sql="USE `product_search`";
           con.createStatement().execute(sql);
		   String member =  session.getAttribute("email").toString();
//Step 4: 執行 SQL 指令, 若要操作記錄集, 需使用executeQuery, 才能傳回ResultSet	
           sql="SELECT * FROM `shop_car` WHERE member='"+member+"'"; 
           ResultSet rs=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
           //ResultSet.TYPE_SCROLL_INSENSITIVE表紀錄指標可前後移動，ResultSet.CONCUR_READ_ONLY表唯讀
		   /*
		   String pic = rs.getString(2);
		   String name = rs.getString(3);
		   String price = rs.getString(4);
		   String num = rs.getString(5);
		   String total = rs.getString(6);
			*/
//Step 5: 顯示結果 
			
			rs.afterLast();
			int i=0;
           while(rs.previous())
                {
				i+=1;
				 out.println(" <div class=\"shop_header shop_body\">");
                 out.println("<div class=\"item\">");
                 out.println("<div class=\"delete\">");
                 out.println("<img src=\"images/Lai/delete.png\" width=\"20px\" height=\"20px\" onclick=\"this.parentNode.submit()\">");
                 out.println("</div>");
                 
				 out.println("<img src='" + rs.getString(2) + "' width=\"100px\" height=\"80px\">");

				 out.println("<div class=\"name\">"+rs.getString(3)+"</div>");
				 out.println("</div>");
				 out.println("<div class=\"price\">");
				 out.println("<span>"+rs.getString(4)+"</span>");
				 out.println("</div>");
				 out.println("<div class=\"number\">");
				 out.println("<input type=\"button\" class=\"btn\" value=\"-\" onclick=\"minus(1)\">");
				 out.println("<input type=\"text\" class=\"input_num\" value=\'"+rs.getString(5)+"\' id='a"+i+"'>");
				 out.println("<input type=\"button\" class=\"btn\" value=\"+\" onclick=\"add(1)\">");
				 out.println("</div>");
				 out.println("<div class=\"extendprice\">");
				 out.println("<span>"+rs.getString(6)+"</span>");
				 out.println("</div>");
				 out.println("</div>");
				 out.print("<script>");
out.print("function minus(ctn_num) {");
out.print("    var num = Number(document.getElementById('a" + i + "').value);");
out.print("    if (num > 1) {");
out.print("        document.getElementById('a" + i + "').value = num - 1;");
out.print("    }");
out.print("}");

out.print("function add(ctn_num) {");
out.print("    var num = Number(document.getElementById('a" + i + "').value);");
out.print("    if (num < 100) {");
out.print("        document.getElementById('a" + i + "').value = num + 1;");
out.print("    }");
out.print("}");
out.print("</script>");


				 
          }
			
//Step 6: 關閉連線
           
		   
//Step 5: 顯示結果 
          //直接顯示最新的資料
		
     }
else{
	con.close();
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
                            <form action="go_to_check.jsp">
                                <div class="txt">
                                    運送方式： <div class="bar"><input placeholder="輸入你的地址以檢視運送選項" size="50" name="address"></div>
                                    <br>
                                    <div class="txt">
                                        訂單金額：
                                        <span>$</span>
										<%  request.setCharacterEncoding("UTF-8")  ;%>

<%
	if (session.getAttribute("email")!= null){
		
		
//Step 3: 選擇資料庫   

           sql="use product_search;";
           con.createStatement().execute(sql);
		   request.setCharacterEncoding("UTF-8");  
		   sql = "SELECT SUM(shop_car.total) FROM product_search.shop_car  WHERE member ='"+session.getAttribute("email").toString()+"';";
		   ResultSet rs8=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
		    rs8.first();
		   out.print(rs8.getString(1));
		   
		   
		   

//Step 4: 執行 SQL 指令	
			
//Step 6: 關閉連線
           con.close();
//Step 5: 顯示結果 
          //直接顯示最新的資料
      }
else{
	con.close();
	response.sendRedirect("signin.jsp");
}
%>
                                    </div>
                                    <a href="index.html"><input type="button" class="orderbutton" value="回首頁"></a>
                                    <a href="order.jsp"><input type="submit" class="orderbutton" value="前往結帳"></a>
                                </div>
                            </form>
                        </div>                       
                    </div>
                </div>
            </section>
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