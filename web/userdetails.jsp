<%@page import="com.app.utility.DBConnectionn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
  <header class="header"><a href="#" class="logo" style="margin-left: -70px;">Bus Pass Application and Renewal using Cloud Computing </a>
      <nav class="navbar" style="margin-right: -70px;">
        <a href="AdminHome.jsp" style="--i:1;">Home</a>
        <a href="useractivate.jsp" style="--i:2;">Activate user</a>
        <a href="userdetails.jsp" style="--i:3;"class="active">User Details</a>
        <a href="Admin.jsp" style="--i:4;">Logout</a>
    </nav>
</header>
<section class="home">
    <div class="container2">
        <center> <table border="1">
                                <thead>
                                    <tr>
                                        
                                        <th>S.No</th>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Mobile</th>
                                        <th>Destination</th>
                                        <th>validity</th>
                                        

                                    </tr>
                                </thead>
                                 <tbody>
                                    <%
                                        Connection con = null;
                                        PreparedStatement ps = null;
                                        ResultSet rs = null;
                                        int sno = 0;
                                        try {
                                            con = DBConnectionn.getConnection();
                                            String sqlQuery = "select * from userregister";
                                            ps = con.prepareStatement(sqlQuery);
                                            rs = ps.executeQuery();
                                            while (rs.next()) {
                                                sno++;
                                                int id = rs.getInt("id");
                                                String name = rs.getString("name");
                                    %>
                                    <tr style="color: #0ef">
                                        <td><%=sno%></td>
                                        <td><%=name%></td>
                                        <td><%=rs.getString("email")%></td>
                                        <td><%=rs.getString("mobile")%></td>
                                        <td><%=rs.getString("destination")%></td>
                                        <td><%=rs.getString("validity")%></td>
                                    </tr>
                                
                                    <%
                                            }
                                        } catch (Exception e) {

                                            e.printStackTrace();
                                        }


                                    %>

                               
                                </tbody>
            </table></center>
        
    </div>

    
</section>
</body>
</html>
