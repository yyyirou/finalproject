<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@ include file="config.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="assets/css/sign_in.css">
    <link rel="icon" href="./images/tai/icon.jpg" type="image/x-icon">
</head>
<%
    if (session.getAttribute("email") != null) {
%>
        <script>
            alert('您已經登入，無法再次進行登入！');
            window.location.href = 'userweb.jsp'; // 跳轉到會員介面
        </script>
<%
    } else {
%>
<body>
    <div class="yellow">
        <div class="input">
            <form action="check.jsp" method="post">


                <div>
                    <input type="text" class="user" placeholder="Email" name="email">
                </div>
                
                <span><hr style="color: #C4BAB7;"></span>

                <div>
                    <input type="password" class="password" placeholder="password" name="pwd">
                </div>

                <span><hr style="color: #C4BAB7;"></span>

                <div class="login margin">
                    <a href="index.html"><input type="submit" value="Sing in" class="log"></a>
                </div>
                
        </form>     
        </div>
        <div class="logo">
            <img class="icon" src="./images/tai/icon.jpg" >
        </div>
    </div>
<%
    }
%>
</main>
</body>
</html>