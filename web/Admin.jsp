<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-compatible" content="IE=edge">
    <title>Bus Pass Renewal</title>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>
  <header class="header"><a href="#" class="logo">Bus Pass Application and Renewal using Cloud Computing </a>
    <nav class="navbar">
        <a href="index.html" style="--i:1;">Home</a>
        <a href="Register.jsp" style="--i:2;">Register</a>
        <a href="login.jsp" style="--i:3;">Login</a>
        <a href="Admin.jsp" style="--i:4;" class="active"s>Admin</a>
    </nav>
</header>
    <div class="container">
        <h1>Admin Login <span>Here!</span></h1>
        <form action="Adminlogincheck.jsp" method="post">
            <input type="text" placeholder="User Name" required name="aname">
            <input type="password" placeholder="Password" required name="apass">
            <button type="submit">Login</button>
        </form>
         <%
                                    String msg = request.getParameter("msg");
                                    if (msg != null && msg.equalsIgnoreCase("failed")) {
                                        out.println("<h5><font color='Red'><b>Invalid Login Credentials</b></font></h5>");
                                    }
                                %>
    </div>
</body>