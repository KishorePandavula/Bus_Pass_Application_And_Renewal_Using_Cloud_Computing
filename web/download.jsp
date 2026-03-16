<%@page import="com.app.utility.DBConnectionn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
  <header class="header"><a href="#" class="logo">Bus Pass Application and Renewal using Cloud Computing</a>
    <nav class="navbar">
        <a href="userhome.jsp" style="--i:1;">Home</a>
        <a href="renewal.jsp" style="--i:2;">Renewal</a>
        <a href="download.jsp" style="--i:3;" class="active">Download</a>
        <a href="login.jsp" style="--i:4;">Logout</a>
    </nav>
</header>
<section class="home">
    <div class="container0">
        <%
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            // Retrieve the logged-in user's name from the session
            String userName = (String) session.getAttribute("name");

            if (userName == null) {
                // If no user is logged in, redirect to login page
                response.sendRedirect("login.jsp?msg=notloggedin");
            } else {
                try {
                    con = DBConnectionn.getConnection();
                    String sqlQuery = "SELECT * FROM userregister WHERE name = ?";
                    ps = con.prepareStatement(sqlQuery);
                    ps.setString(1, userName); // Set the user's name in the query
                    rs = ps.executeQuery();

                    if (rs.next()) {
        %>
        <form action="yourActionServlet" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" value="<%= rs.getString("name") %>" readonly>

            <label for="email">E-Mail:</label>
            <input type="email" id="email" name="email" value="<%= rs.getString("email") %>" readonly>

            <label for="gender">Gender:</label>
            <input type="text" id="gender" name="gender" value="<%= rs.getString("gender") %>" readonly>

            <label for="city">City:</label>
            <input type="text" id="city" name="city" value="<%= rs.getString("city") %>" readonly>

            <label for="destination">Destination:</label>
            <input type="text" id="destination" name="destination" value="<%= rs.getString("destination") %>" readonly>

            <label for="validity">Validity:</label>
            <input type="text" id="validity" name="validity" value="<%= rs.getString("validity") %>" readonly>

            <button type="submit" value="Download" formaction="./DownloadImageServlet">Download</button>
        </form>
        <%
                    } else {
        %>
        <p style="color:red;">No data found for the logged-in user.</p>
        <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) try { rs.close(); } catch (Exception e) { }
                    if (ps != null) try { ps.close(); } catch (Exception e) { }
                    if (con != null) try { con.close(); } catch (Exception e) { }
                }
            }
        %>
    </div>
</section>
</body>
</html>
