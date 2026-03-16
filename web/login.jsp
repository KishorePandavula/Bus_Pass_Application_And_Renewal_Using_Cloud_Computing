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
  <header class="header">
    <a href="#" class="logo">Bus Pass Application and Renewal using Cloud Computing</a>
    <nav class="navbar">
        <a href="index.html" style="--i:1;">Home</a>
        <a href="Register.jsp" style="--i:2;">Register</a>
        <a href="login.jsp" style="--i:3;" class="active">Login</a>
        <a href="Admin.jsp" style="--i:4;">Admin</a>
    </nav>
  </header>
  <div class="container">
    <h1>Login <span>Here!</span></h1>
    <form action="user_login" method="post">
        <input type="text" name="name" placeholder="User Name" required>
        <input type="password" name="upass" placeholder="Password" required>
        <button type="submit">Login</button>
    </form>
    <br>
    <center>
    <% 
    String msg = request.getParameter("msg");
    if (msg != null) {
        if (msg.equals("notexist")) {
            out.println("<p style='color: red;'>Invalid username or password</p>");
        } else if (msg.equals("notactivated")) {
            out.println("<p style='color: red;'>Your account is not activated</p>");
        } else if (msg.equals("error")) {
            out.println("<p style='color: red;'>An error occurred. Please try again.</p>");
        }
    }
    %>
    </center>
  </div>
</body>
</html>