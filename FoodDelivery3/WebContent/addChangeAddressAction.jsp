<%@page import ="project.ConnectionProvider"%>
<%@page import ="java.sql.*"%>
<%
String email = session.getAttribute("email").toString();
String address = request.getParameter("address");

try
{
	Connection con = ConnectionProvider.getCon();
	PreparedStatement ps = con.prepareStatement("update users set address=? where email=?");
	ps.setString(1, address);
	ps.setString(2, email);
	ps.executeUpdate();
	response.sendRedirect("addChangeAddress.jsp?msg=valid");
	
}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("addChangeAddress.jsp?msg=invalid");
}
%>