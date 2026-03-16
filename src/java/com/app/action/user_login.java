package com.app.action;

import com.app.utility.DBConnectionn;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/user_login")
public class user_login extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String name = request.getParameter("name");
        String password = request.getParameter("upass");
        

        try (Connection con = DBConnectionn.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT status, accesskey, email FROM userregister WHERE name = ? AND password = ?")) {
            
            ps.setString(1, name);
            ps.setString(2, password);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String status = rs.getString("status");
                    String accesskey = rs.getString("accesskey");
                    String email = rs.getString("email");

                    if ("activated".equalsIgnoreCase(status)) {
                        HttpSession session = request.getSession();
                        session.setAttribute("accesskey", accesskey);
                        session.setAttribute("name", name);
                        session.setAttribute("email", email);
                        response.sendRedirect("userhome.jsp?msg=success");
                    } else {
                        response.sendRedirect("login.jsp?msg=notactivated");
                    }
                } else {
                    response.sendRedirect("login.jsp?msg=notexist");
                }
            }
        } catch (SQLException e) {
            log("Database error in user_login servlet", e);
            e.printStackTrace(); // Print stack trace for debugging
            response.sendRedirect("login.jsp?msg=error");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "user_login Servlet";
    }
}