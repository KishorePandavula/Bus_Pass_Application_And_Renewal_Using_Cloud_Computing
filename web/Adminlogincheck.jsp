 <%  if(request.getParameter("aname").equals("admin") && request.getParameter("apass").equals("admin"))
{
    response.sendRedirect("AdminHome.jsp?msg=success");
}
else{
    response.sendRedirect("Admin.jsp?msg=failed");
}
%>