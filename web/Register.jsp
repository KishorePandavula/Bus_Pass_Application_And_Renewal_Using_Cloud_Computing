<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Bus Pass Renewal</title>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<script>
    function validateForm() {
        var x = document.forms["myForm"]["email"].value;
        var atpos = x.indexOf("@");
        var dotpos = x.lastIndexOf(".");
        if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= x.length) {
            alert("Not a valid e-mail address");
            return false;
        }
    }
</script>
<body>
    <header class="header">
        <a href="#" class="logo">Bus Pass Application and Renewal using Cloud Computing</a>
        <nav class="navbar">
            <a href="index.html" style="--i:1;">Home</a>
            <a href="Register.jsp" style="--i:2;" class="active">Register</a>
            <a href="login.jsp" style="--i:3;">Login</a>
            <a href="Admin.jsp" style="--i:4;">Admin</a>
        </nav>
    </header>
    <div class="container">
        <h1>Register <span>Here!</span></h1>
        <form name="myForm" action="user_reg" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
            <input type="text" name="name" placeholder="User Name" required>
            <input type="password" name="password" placeholder="Password" pattern="(?=.*\d)(?=.*[a-z]).{8,}" required>
            <input type="email" name="email" placeholder="Email Address" required>
            <input type="tel" name="mobile" placeholder="Mobile Number" required>
            <input type="text" name="gender" placeholder="Gender" required>
            <input type="text" name="address" placeholder="Address" required>
            <input type="text" name="city" placeholder="City" required>
            <input type="text" name="destination" placeholder="Destination" required>
            <select name="validity" required>
                <option value="" disabled selected>Validity</option>
                <option value="1 day">1 Day</option>
                <option value="1 month">1 month</option>
                <option value="3 months">3 months</option>
                <option value="6 months">6 months</option>
                <option value="Year">Year</option>
            </select>
            <button type="submit">Register</button>
            <button type="button" onclick="window.location.href='login.jsp'">Already Registered? Login here</button>
        </form>
    </div>
</body>
</html>
