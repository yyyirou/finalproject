<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
if(session.getAttribute("email") != null ){
    sql = "SELECT * FROM product_search.members WHERE email='" +session.getAttribute("email")+"';"; 
	ResultSet paperrs1 =con.createStatement().executeQuery(sql);
	String email="", pwd="";
	while(paperrs1.next()){
	    //name=paperrs1.getString(1);
	    email=paperrs1.getString("email");
		pwd=paperrs1.getString("pwd");
	}

%>
<html>
	<head>
		<title>Solid State by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" href="assets/css/sliderbar.css" />
		<link rel="stylesheet" href="assets/css/righticon.css" />
		<link rel="stylesheet" href="assets/css/slide.css">
        <link rel="stylesheet" href="assets/css/useropen.css" />
        <link rel="stylesheet" href="assets/css/useredit.css" />
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
                    <a href="user.html">
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
        
                <a href="Apple.html">
                    <i class="fa-brands fa-apple"></i>
                  <span>Apple</span>
                </a>
        
                <a href="Pixel.html" >
                    <i class="fa-brands fa-google"></i>
                  <span>Pixel</span>
                </a>
        
                <a href="Sony.html" >
                    <i class="fa-solid fa-mobile-screen"></i>					  
                    <span>Sony</span>
                </a>
        
                <a href="OPPO.html" >
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
        <nav>
			編輯個人資料
		</nav>
	
		<div class="back1">
			<form action="update.jsp" class="enroll" method="post"><br>
				<p>姓名： <input type="text" class="bar" name="username" value="" size="50"></p><br>
				<p>信箱： <input type="email" class="bar" name="email" value="" size="50"></p><br>
				<p>電話： <input type="text" class="bar" name="tel" value="" size="50"></p><br>
				<p>密碼： <input type="password" class="bar" name="pwd" value="" size="50"></p><br>
				<a href="user.jsp"><input type="submit" class="orderbutton" value="編輯完成"></a>
			</form>
		</div>
		<footer class="footer">
			<hr style="border-color:rgb(43, 39, 39);">
			<h5>Copyrgiht @ 2023 By Starlink</h5>
			<iframe class="no-border" width="150" height="26" frameborder="0" scrolling="no" src="counter.jsp"></iframe>
		</footer>
	</body>
</html>
<%
}
else{
%>
<script>
        alert("尚未登入 !!");
        window.location.href = "signin.jsp";
      </script>

<%
}
%>
