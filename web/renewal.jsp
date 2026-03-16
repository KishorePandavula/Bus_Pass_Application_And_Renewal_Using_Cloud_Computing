<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-compatible" content="IE=edge">
    <title>Bus Pass Renewal</title>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
  <header class="header"><a href="#" class="logo">Bus Pass Application and Renewal using Cloud Computing </a>
    <nav class="navbar">
        <a href="userhome.jsp" style="--i:1;">Home</a>
        <a href="renewal.jsp" style="--i:2;" class="active">Renewal</a>
        <a href="download.jsp" style="--i:3;">Download</a>
        <a href="login.jsp" style="--i:4;">Logout</a>
    </nav>
</header>
<section class="home">
    <div class="container" style="margin-left: 400px">
    <h1>Renewal <span>Here!</span></h1>
    <form action="user_renewal" method="post">
        <input type="text" name="name" placeholder="User Name" required>
        <input type="email" name="email" placeholder="email" required>
         <input type="tel" name="mobile" placeholder="Mobile Number" required>
         <input type="text" name="city" placeholder="city" required>
         <input type="text" name="destination" placeholder="Destination" required>
         <select name="validity" required>
                <option value="" disabled selected>Validity</option>
                <option value="1 day">1 Day</option>
                <option value="1 month">1 month</option>
                <option value="3 months">3 months</option>
                <option value="6 months">6 months</option>
                <option value="Year">Year</option>
            </select>
        <button type="submit">Pay now</button>
    </form>
    </div>
</section>
</body>
</html>
