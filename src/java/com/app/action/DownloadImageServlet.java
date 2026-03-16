package com.app.action;

import com.app.utility.DBConnectionn;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.IOException;
import java.io.OutputStream;
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

@WebServlet("/DownloadImageServlet")
public class DownloadImageServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment;filename=user_details.pdf");
        
        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect("login.jsp?msg=notloggedin");
            return;
        }
        
        String userName = (String) session.getAttribute("name");
        
        if (userName == null) {
            response.sendRedirect("login.jsp?msg=notloggedin");
            return;
        }

        try (Connection con = DBConnectionn.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM userregister WHERE name = ?")) {
            
            ps.setString(1, userName);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Document document = new Document();
                OutputStream out = response.getOutputStream();
                PdfWriter.getInstance(document, out);
                
                document.open();
                
                // Setting font
                Font boldFont = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD);
                Font regularFont = new Font(Font.FontFamily.TIMES_ROMAN, 12);

                // Adding title
                Paragraph title = new Paragraph("Pass Details", new Font(Font.FontFamily.TIMES_ROMAN, 18, Font.BOLD));
                title.setAlignment(Element.ALIGN_CENTER);
                document.add(title);
                document.add(new Paragraph(" ")); // Adding an empty line

                // Adding user details in form format
                addDetailToPDF(document, "Name:", rs.getString("name"), boldFont, regularFont);
                addDetailToPDF(document, "E-Mail:", rs.getString("email"), boldFont, regularFont);
                addDetailToPDF(document, "Gender:", rs.getString("gender"), boldFont, regularFont);
                addDetailToPDF(document, "City:", rs.getString("city"), boldFont, regularFont);
                addDetailToPDF(document, "Destination:", rs.getString("destination"), boldFont, regularFont);
                addDetailToPDF(document, "Validity:", rs.getString("validity"), boldFont, regularFont);
                
                document.close();
            } else {
                response.sendRedirect("userhome.jsp?msg=norecord");
            }
        } catch (SQLException | DocumentException e) {
            e.printStackTrace();
            response.sendRedirect("userhome.jsp?msg=error");
        }
    }

    private void addDetailToPDF(Document document, String label, String value, Font boldFont, Font regularFont)
            throws DocumentException {
        PdfPTable table = new PdfPTable(2);
        table.setWidthPercentage(100);
        table.setSpacingBefore(10f);

        PdfPCell cell1 = new PdfPCell(new Phrase(label, boldFont));
        cell1.setBorder(PdfPCell.NO_BORDER);
        table.addCell(cell1);

        PdfPCell cell2 = new PdfPCell(new Phrase(value, regularFont));
        cell2.setBorder(PdfPCell.NO_BORDER);
        table.addCell(cell2);

        document.add(table);
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
        return "Download PDF in form format";
    }
}
