package com.app.action;

import com.app.utility.DBConnectionn;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user_renewal")
public class user_renewal extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String city = request.getParameter("city");
        String destination = request.getParameter("destination");
        String validity = request.getParameter("validity");

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBConnectionn.getConnection();

            // Check if the record with the given name and email exists
            String checkQuery = "SELECT COUNT(*) FROM userregister WHERE name = ? AND email = ?";
            ps = con.prepareStatement(checkQuery);
            ps.setString(1, name);
            ps.setString(2, email);
            rs = ps.executeQuery();
            rs.next();

            if (rs.getInt(1) > 0) {  // Record exists
                // Update the existing record based on email and name
                String updateQuery = "UPDATE userregister SET mobile = ?, city = ?, destination = ?, validity = ? WHERE name = ? AND email = ?";
                ps = con.prepareStatement(updateQuery);
                ps.setString(1, mobile);
                ps.setString(2, city);
                ps.setString(3, destination);
                ps.setString(4, validity);
                ps.setString(5, name);
                ps.setString(6, email);

                int no = ps.executeUpdate();
                if (no > 0) {
                    // After successful update, redirect to payment page
                    response.sendRedirect("payment.jsp");
                } else {
                    response.sendRedirect("renewal.jsp?msg=failed");
                }
            } else {  // Record does not exist
                response.sendRedirect("renewal.jsp?msg=notfound");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("renewal.jsp?msg=error");
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
