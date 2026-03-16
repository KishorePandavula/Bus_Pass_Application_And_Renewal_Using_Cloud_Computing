<%@page import="java.util.Random"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-compatible" content="IE=edge">
    <title>Payment</title>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
  <header class="header"><a href="#" class="logo">Bus Pass Application and Renewal using Cloud Computing</a>
    <nav class="navbar">
        <a href="userhome.jsp" style="--i:1;">Home</a>
        <a href="renewal.jsp" style="--i:2;" class="active">Renewal</a>
        <a href="download.jsp" style="--i:3;">Download</a>
        <a href="login.jsp" style="--i:4;">Logout</a>
    </nav>
  </header>
  <section class="payment">
    <div class="container" >
        <h1>Payment Details</h1>
        <%
            float paidAmountreturn = 0;
            boolean paymentSuccess = false;
            
            if (request.getMethod().equalsIgnoreCase("POST")) {
                // Assuming payment processing is successful
                paymentSuccess = true;
            } else {
                // Generate a random amount before payment
                float[] amount = {300f, 350f, 250f, 400f, 450f, 600f, 500f, 550f, 200f, 650f, 850f, 750f, 700f, 800f};
                int rnd = new Random().nextInt(amount.length);
                paidAmountreturn = amount[rnd];
            }
        %>
        <form action="payment.jsp" method="post">
            <input type="text" name="cardNumber" placeholder="Card Number" pattern="[1234567890][0-9]{15}" required>
            <input type="text" name="cardHolder" placeholder="Card Holder Name" required>
            <input type="text" name="expiryDate" placeholder="Expiry Date (MM/YY)" required>
            <input type="text" name="cvv" placeholder="CVV" pattern="[123456789][1-9]{2}" required>
            <% if (!paymentSuccess) { %>
                <input type="text" name="paidamount" readonly value="<%=paidAmountreturn%>">
            <% } %>
            <button type="submit">Payment</button>
        </form>

        <% if (paymentSuccess) { %>
        <center><p style="color: green; margin-top: 20px;">Payment Success!</p></center>
        <% } %>
    </div>
  </section>
</body>
</html>
