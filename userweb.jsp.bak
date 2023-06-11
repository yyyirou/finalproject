<%@page contentType="text/html;charset=utf-8" language="java" %>
<%@ page import="java.sql.*, java.io.* " %>
<% String dbUrl = "jdbc:mysql://localhost/product_search?serverTimezone=UTC"; %>

<!DOCTYPE HTML>
<html>
	<head>
		<title>Solid State by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" href="assets/css/sliderbar.css" />
		<link rel="stylesheet" href="assets/css/righticon.css" />
		<link rel="stylesheet" href="assets/css/slide.css">
        <link rel="stylesheet" href="./assets/css/useropen.css" />
        <link rel="stylesheet" href="assets/css/userorder.css" />
		<link rel="icon" href="images/tai/icon.jpg" type="image/x-icon"  > 
		<script src="https://kit.fontawesome.com/605c912c10.js" crossorigin="anonymous"></script>
	</head>
    
	<body class="is-preload">

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
                            <input type="text" class="input" placeholder="search...">
                            <div class="btn">
                                <p><i class="fa-solid fa-magnifying-glass"></i></p>
                            </div>
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
                    <a href="index.html" class="active" >
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

                <a href="login.html" >
                    <i class="fa-regular fa-user"></i>
                  <span>Log IN</span>
                </a>


                <a href="signin.jsp" >
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
<%
try {
    String loggedInemail = (String) session.getAttribute("email");
	String email = "";
    String username = "";
    String tel = "";
	int userid = 0;


    // 使用已登入的使用者名稱進行資料庫查詢
    String selectQuery = "SELECT id,email, username, tel FROM product_search.members WHERE email=?";
    Connection connection = DriverManager.getConnection(dbUrl, "root", "1234");
    PreparedStatement pstmt = connection.prepareStatement(selectQuery);
    pstmt.setString(1, loggedInemail);
    ResultSet rs = pstmt.executeQuery();

    // 檢查是否找到符合條件的資料
    if (rs.next()) {
		userid = rs.getInt("id");
        email = rs.getString("email");
        username = rs.getString("username");
        tel = rs.getString("tel");
    } else {
		%>
        <script>
                alert("尚未登入 !!");
                window.location.href = "signin.jsp";
            </script>
	<%}%>
<!-- HTML部分 -->
<div class="containerdisplay">
    <div class="container">
        <div class="tab_box">
            <button class="tab_btn">個人資訊</button>
            <button class="tab_btn">訂單</button>
            <button class="tab_btn">評價</button>
            <button class="tab_btn">追蹤</button>
            <div class="line"></div>
        </div>

        <div class="content_box">

            <div class="content"><!-- 個人資訊-1 -->
                <div class="userinfor">
                    <i class="fa-solid fa-circle-user" style="color: black;"></i>
                    <p style="font-size: 60px; font-weight: 800;"><%= username %></p>
                </div>

                <div class="useredit">
                    <a href="user.jsp" target="_blank">
                        <i class="fa-solid fa-pen-to-square" style="color: black;"></i>
                    </a>
                    <p style="font-size: 30px; font-weight: 600;">編輯個人資料</p>
                </div>
                <!-- left+right -->
                <div class="userwholeinfor">

                    <div class="userleft">

                        <div class="usercon">
                            <span style="display:block">姓名：</span>
                        </div>

                        <div class="usercon">
                            <span style="display:block">信箱：</span>
                        </div>

                        <div class="usercon">
                            <span style="display:block">電話：</span>
                        </div>


                    </div>


                    <div class="userright">
                        <div class="usercon">
                            <span style="display:block; width: 200px;"><%= username %></span>

                        </div>

                        <div class="usercon">
                            <span style="display:block"><%= email %></span>
                        </div>

                        <div class="usercon">
                            <span style="display:block"><%= tel %></span>
                        </div>
                    </div>
                </div>
            </div>
			
			<%
			int[] ordersid ;
			String[] proid ;
			int[] quantity ;
			String phname ="";
			int phprice = 0;
			String phimg = "";
			selectQuery = "SELECT * FROM product_search.orders WHERE mid=?";
			pstmt = connection.prepareStatement(selectQuery, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			pstmt.setInt(1, userid);
			rs = pstmt.executeQuery();
			rs.last();
			int longer = rs.getRow();
			ordersid = new int[longer];
			int j = 0;
			if (rs.first()) {
				do {
					ordersid[j] = rs.getInt(1);
					j++;
				} while (rs.next());
				}

			//輸出訂單
			for (int i=0 ; i<longer ; i++){%>

			
			                <div class="content"><!-- 訂單-2 -->
                    <main class="table">
                        <section class="table__header">
                            <h1 style="color: black;">#<%= ordersid[i]%></h1><!-- 訂單編號 -->
                            
                            
                        </section>
                        <section class="table__body">
                            <table>
                                <thead>
                                    <tr style="text-align:center;" >
                                        
                                        <th  style="vertical-align:middle;"> Product </th>
                                        <th style="vertical-align:middle; width: 20%;"> QUANTITY</th>
                                        <th style="vertical-align:middle;"> TOTAL</th>
                                    </tr>
                                </thead>
			
                                <tbody>
<%				request.setCharacterEncoding("UTF-8");
				selectQuery = "SELECT * FROM product_search.orders_detail WHERE oid=?";//取得每筆訂單產品及數量
				pstmt = connection.prepareStatement(selectQuery, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
				pstmt.setInt(1, ordersid[i]);
				rs = pstmt.executeQuery();	
				int longer1 = 0;
				
				if(rs.next()){
					rs.last();
					longer1 = rs.getRow();
					proid = new String [longer1];
					quantity = new int [longer1];
					int a = 0;
					if (rs.first()) {
						do {
							proid[a] = rs.getString(2);
							quantity[a] = rs.getInt(3);
							a++;
						} while (rs.next());
					}
				
				
				for (int outp=0 ; outp<longer1 ; outp++){//輸出產品資訊
				
					selectQuery = "SELECT * FROM product_search.pro_detail WHERE pdid=?";//取得產品資訊
					pstmt = connection.prepareStatement(selectQuery, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
					pstmt.setString(1, proid[outp]);
					rs = pstmt.executeQuery();	
						while (rs.next()){
							phname = rs.getString(4);
							phimg = rs.getString(5);
							phprice = rs.getInt(7);
			
                                    out.println("<tr><!-- Good-per -->");
                                        out.println("<td style='text-align: center;'><!--圖片連後端--><img src='"+phimg+"' style='display: flex;' alt=''> <p style='position: relative; top: 10px;  right: 7%;'>"+phname+"</p> </td>");
                                        out.println("<td style=' display: flex; align-items: center; justify-content: center; position: relative; top: 10px;'>"+quantity[outp]+"</td>");
                                        
                                        out.println("<td style='text-align: center;'> $  <p style='display:inline;'>"+phprice*quantity[outp]+"</p>  NTD </td> ");  
                                    out.println("</tr>");
					}
					}
					}
				else{
					out.print("資料獲取失敗");
				}
					%>    

                                </tbody>
                            </table>
                        </section>
                    </main>
                </div>
				
			<%}%>
			
			                <div class="content"><!-- 評價-3 -->
                    <main class="table">
            
                        <section class="table__body">
                            <table>
                                <thead>
                                    <tr style="text-align:center;" >
                                        
                                        <th  style="vertical-align:middle;"> Product </th>
                                        <th style="vertical-align:middle; width: 20%;"> Message</th>
                                        <th style="vertical-align:middle;"> Star</th>
                                    </tr>
                                </thead>
                                <tbody>
<%								selectQuery = "SELECT * FROM product_search.board WHERE member=?";//取得每筆訂單產品數量
								pstmt = connection.prepareStatement(selectQuery, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
								pstmt.setString(1, email);
								rs = pstmt.executeQuery();	
								
								int longer3 = 0;
								rs.last();
								longer3 = rs.getRow();
								String[] proclass = new String [longer3];
								String[] prorat = new String [longer3];
								int c = 0;
								if (rs.first()) {
									do {
										proclass[c] = rs.getString(5);
										prorat[c] = rs.getString(2);
										c++;
									} while (rs.next());
								}
								
								for (int pc=0 ; pc<longer3 ; pc++){//輸出產品資訊
				
								selectQuery = "SELECT * FROM product_search.pro_detail WHERE pdclass=?";//取得產品資訊
								pstmt = connection.prepareStatement(selectQuery, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
								pstmt.setString(1, proclass[pc]);
								rs = pstmt.executeQuery();	
								while (rs.next()){
									phname = rs.getString(4);
									phimg = rs.getString(5);
									
                                    out.println("<tr><!-- Good-per -->");
                                        out.println("<td style='text-align: center;'><!--圖片連後端--><img src='"+phimg+"' style='display: flex;' alt=''> <p style='position: relative; top: 10px; right: 7%; '>"+phname+"</p> </td>");
                                        out.println("<td style=' display: flex; align-items: center; justify-content: center; position: relative; top: 10px;'> 1 </td>");
                                        out.println("<td style='text-align: center;'>"+prorat[pc]+"</td>   ");
                                    out.println("</tr>");
								}
								}
								
%>      

                                </tbody>
                            </table>
                        </section>
                    </main>
                </div>
				
				
                <div class="content"><!-- 追蹤-4 -->
                    <main class="table"> 
                        <section class="table__body">
                            <table>
                                <thead>
                                    <tr style="text-align:center;" >
                                        <th  style="vertical-align:middle;"> Product </th>
                                        <th style="vertical-align:middle; width: 20%;"> Price</th>
                                        <th  style="vertical-align:middle;"> Unfollow</th>
                                    </tr>
                                </thead>
								
								<tbody>
<%								selectQuery = "SELECT * FROM product_search.products_like WHERE mid=?";//取得每筆訂單產品及數量
								pstmt = connection.prepareStatement(selectQuery, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
								pstmt.setInt(1, userid);
								rs = pstmt.executeQuery();	
								
								int longer2 = 0;
								rs.last();
								longer2 = rs.getRow();
								String[] proidlike = new String [longer2];
								int b = 0;
								if (rs.first()) {
									do {
										proidlike[b] = rs.getString(2);
										b++;
									} while (rs.next());
								}
								
								for (int pl=0 ; pl<longer2 ; pl++){//輸出產品資訊
				
								selectQuery = "SELECT * FROM product_search.pro_detail WHERE pdid=?";//取得產品資訊
								pstmt = connection.prepareStatement(selectQuery, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
								pstmt.setString(1, proidlike[pl]);
								rs = pstmt.executeQuery();	
								while (rs.next()){
									phname = rs.getString(4);
									phimg = rs.getString(5);
									phprice = rs.getInt(7);
									
                                    out.println("<tr><!-- Good-per -->");
                                        out.println("<td style='text-align: center;'><!--圖片連後端--><img src='"+phimg+"' style='display: flex;' alt=''> <p style='position: relative; top: 10px;  right:3%;'>"+phname+"</p> </td>");
                                        out.println("<td style='text-align: center;'> $  <p style='display:inline;'>"+phprice+"</p>  NTD </td>");
                                        out.println("<td style='text-align: center; '> <a href='unlike.jsp?data1=" + proidlike[pl] + "&data2=" + userid + "'><i class='fa-solid fa-heart-crack' style='cursor: pointer; color: red;'></i></a></td>");
                                    out.println("</tr>");
								}
								}
								
%>                                    
                                </tbody>
								
                            </table>
                        </section>
                    </main>
                </div>
        </div>
    </div>
</div>

<%
} catch (SQLException e) {
    out.println("SQLException: " + e.getMessage());
}
%>





        <script>
            const tabs= document.querySelectorAll('.tab_btn');
                 const all_content= document.querySelectorAll('.content');
     
                 tabs.forEach((tab,index)=>{
                     tab.addEventListener('click',(e)=>{
                         tabs.forEach(tab=>{tab.classList.remove('active')});
                         tab.classList.add('active');
     
                         var line=document.querySelector('.line');
                     line.style.width = e.target.offsetWidth+"px";
                     line.style.left = e.target.offsetLeft+"px";
     
                     all_content.forEach(content=>{content.classList.remove('active')});
                     all_content[index].classList.add('active');
                     })
                    
                 })
     
         </script>
          <p style="bottom: 0;"></p>
          
	</body>
</html>